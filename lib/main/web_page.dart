import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const whiteUrls = ["m.ctrip.com/", "m.ctrip.com/html5/", "m.ctrip.com/html5"];

class WebViewPage extends StatefulWidget {

  final String? url;
  final String? statusBarColor;
  final String? title;
  final bool? hideAppBar;
  final bool backForbid;

  const WebViewPage({Key? key, this.url, this.statusBarColor, this.title, this.hideAppBar, this.backForbid = false}) : super(key: key);


  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  bool exiting = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }


  _isMain(String? url) {
    bool contain = false;
    for(final value in whiteUrls) {
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  @override
  Widget build(BuildContext context) {

    String statusBarColorStr = widget.statusBarColor ?? "ffffff";
    Color backButtonColor;
    if (statusBarColorStr == "ffffff") {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: Column(
        children: [
          _appBar(Color(int.parse("0xff" + statusBarColorStr)), backButtonColor),
          Expanded(
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
              onWebViewCreated: (WebViewController controller){
                _controller.complete(controller);
              },
              onProgress: (int progress){
                print("WebView is loading (progress : $progress%)");
              },
              navigationDelegate: (NavigationRequest request) {
                if(_isMain(request.url)) {
                  if(!widget.backForbid) {
                    Navigator.pop(context);
                  }
                  //Decision拒绝跳转
                  return NavigationDecision.prevent;
                }

                //allowing navigation允许跳转
                return NavigationDecision.navigate;
              },
              onPageStarted: (String url){
                print('Page started loading: $url');
              },
              onPageFinished: (String url){
                print('Page finished loading: $url');
              },
            ),
          )
        ],
      ),
    );
  }

  _appBar(Color backgroundColor, Color backButtonColor) {
    EdgeInsets insets = MediaQuery.of(context).padding;
    if (widget.hideAppBar??false) {
      return Container(
        color: backgroundColor,
        height: insets.top,
      );
    }

    return Container(
      color: backgroundColor,
      height: 44.0 + insets.top,
      padding: EdgeInsets.only(top: insets.top),
      alignment: Alignment.center,
      child: FractionallySizedBox(
        //FractionallySizedBox撑满整个屏幕宽度
        widthFactor: 1,
        child: Stack(
          children: [
            //返回按钮
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Icon(Icons.close, size: 26, color: backButtonColor),
              ),
            ),
            //标题
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(widget.title??"", style: TextStyle(color: backButtonColor, fontSize: 17, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
