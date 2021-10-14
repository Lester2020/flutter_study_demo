import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_demo/main/loading_container.dart';
import 'package:flutter_study_demo/network/network_request.dart';
import 'package:flutter_study_demo/third/model/news_detail_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  final String docId;
  const NewsDetailPage({Key? key, required this.docId}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late WebViewController _controller;
  late String _cssStr;
  late String _htmlStr;
  bool _isLoading = true;
  late NewsDetailModel? _model;
  
  @override
  void initState() {
    super.initState();
    _loadCssFile();
    _loadData();
  }
  
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    if(Theme.of(context).brightness == Brightness.dark){
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    return Scaffold(
      body: Column(
        children: [
          _navigationBar(context),
          Expanded(
            child: LoadingContainer(
              isLoading: _isLoading,
              child: WebView(
                initialUrl: "https://flutterchina.club/",
                //JS执行模式 是否允许JS执行
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  _controller = controller;
                  controller.loadUrl(Uri.dataFromString(_htmlStr,
                      mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
                      .toString());
                },
                onPageFinished: (url) {
                  //调用JS得到实际高度
                  _controller.evaluateJavascript("document.documentElement.clientHeight;").then((result){
                    setState(() {
                      print("高度${double.parse(result)}");
                    });
                  }
                  );
                },
                navigationDelegate: (NavigationRequest request) {
                  if(request.url.startsWith("myapp://")) {
                    print("即将打开 ${request.url}");
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                } ,
                javascriptChannels: <JavascriptChannel>{
                  JavascriptChannel(
                      name: "share",
                      onMessageReceived: (JavascriptMessage message) {
                        print("参数： ${message.message}");
                      }
                  ),
                },

              ),
            ),
          ),
          _bottomToolBar(context)
        ],
      ),
    );
  }

  _loadCssFile() async {
    _cssStr = await DefaultAssetBundle.of(context).loadString("bundles/NewsDetailStyle.css");
  }
  
  _loadData() async {
    NetworkRequest.requestData("https://v6-gw.m.163.com/nc-omad/api/v1/article/${widget.docId}/full", success: (data){
      // print(data);
      _model = NewsDetailModel.fromJson(data["data"][widget.docId]);
      _setUpHtmlContent();
      setState(() {
        _isLoading = false;
      });
    }, failed: (code, msg){
      print(msg);
    });
  }

  _setUpHtmlContent() {
    String htmlStart = "<HTML><HEAD><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no, shrink-to-fit=no, minimum-scale=1.0, maximum-scale=1.0\"></HEAD><BODY>";
    ///设置内部样式css
    String cssStr = """<head><style type="text/css">$_cssStr</style></head>""";
    String htmlEnd = "</BODY></HTML>";
    String title = "<div class=\"title\">${_model?.title??""}</div>";
    var bodyStr = _model?.body??"";

    //插入图片标签
    if(_model?.img != null){
      for(ImgNewextra imgModel in _model?.img??[]){
        String ref = imgModel.ref ?? "";
        String src = imgModel.src ?? "";
        String pixel = imgModel.pixel ?? "";
        List pixels = pixel.split("*");
        if(src.isNotEmpty &&  ref.isNotEmpty && pixels.length == 2) {
          double width = double.parse(pixels.first);
          double height = double.parse(pixels.last);
          double imageWidth = MediaQuery.of(context).size.width - 32;
          double imageHeight = imageWidth / width * height;
          String onload = "this.onclick = function() {  window.location.href = 'imageClick='+this.src; };";
          String imgStr = """<div class=\"img-parent\"><img onload=\"${onload}\" width=${imageWidth} height=${imageHeight} src=\"${src}\"></div>""";
          int start = bodyStr.indexOf(ref);
          bodyStr = bodyStr.replaceRange(start, start+ref.length, imgStr);
        }
      }
    }

    //插入视频标签
    if(_model?.video != null){
      for(VideoInfo videoModel in _model?.video??[]){
        String ref = videoModel.ref ?? "";
        String coverScr = videoModel.cover ?? "";
        String src = videoModel.mp4_url ?? "";
        if(ref.isNotEmpty && coverScr.isNotEmpty && src.isNotEmpty){
          double videoWidth = MediaQuery.of(context).size.width - 32;
          double videoHeight = videoWidth / (videoModel.videoRatio??1.0);
          String videoStr = """<div class=\"video-parent\"><video width=${videoWidth} height=${videoHeight} poster=\"${coverScr}\" playsinline=\"true\"  controls><source src=\"${src}\" type=\"video/mp4\"></video></div>""";
          int start = bodyStr.indexOf(ref);
          bodyStr = bodyStr.replaceRange(start, start+ref.length, videoStr);
        }
      }
    }

    _htmlStr = htmlStart + cssStr + title + bodyStr + htmlEnd;
  }

  _navigationBar(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Container(
      height: padding.top + 44,
      padding: EdgeInsets.only(top: padding.top, left: max(padding.left, 10), right: max(padding.right, 10)),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: Border(bottom: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 1.0
        ))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 26,
                color: Theme.of(context).textTheme.bodyText1?.color,
              )
          ),
          Expanded(
            child: Container(

            ),
          ),
          IconButton(onPressed: (){

          }, icon: Icon(
              Icons.search,
              size: 26,
            color: Theme.of(context).textTheme.bodyText1?.color,
          )
          ),
          const SizedBox(width: 4),
          IconButton(onPressed: (){

          }, icon: Icon(
              Icons.more_horiz_rounded,
              size: 26,
            color: Theme.of(context).textTheme.bodyText1?.color,
          )
          )
        ],
      ),
    );
  }

  _bottomToolBar(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    Color? iconColor = Theme.of(context).textTheme.bodyText1?.color;

    return Container(
      height: padding.bottom + 50,
      padding: EdgeInsets.only(bottom: padding.bottom, left: max(padding.left, 12), right: max(padding.right, 6)),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1
          )
        )
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: (){},
              icon: Icon(
                  Icons.share,
                  size: 22,
                  color: iconColor?.withOpacity(0.6)
              )
          ),
          IconButton(onPressed: (){},
              icon: Icon(
                  Icons.thumb_up,
                  size: 22,
                  color: iconColor?.withOpacity(0.6)
              )
          ),
          IconButton(onPressed: (){},
              icon: Icon(
                  Icons.star,
                  size: 26,
                  color: iconColor?.withOpacity(0.6)
              )
          ),
          IconButton(onPressed: (){},
              icon: Icon(
                  Icons.comment,
                  size: 22,
                  color: iconColor?.withOpacity(0.6)
              )
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Container(
              height: 34,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.25),
                borderRadius: BorderRadius.circular(17)
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt,
                    color: iconColor?.withOpacity(0.8),
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "写评论",
                    style: TextStyle(
                      color: iconColor?.withOpacity(0.9),
                      fontSize: 15
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
