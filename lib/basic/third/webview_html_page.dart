import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewHtmlPage extends StatefulWidget {
  const WebViewHtmlPage({Key? key}) : super(key: key);

  @override
  _WebViewHtmlPageState createState() => _WebViewHtmlPageState();
}

class _WebViewHtmlPageState extends State<WebViewHtmlPage> {
  late WebViewController _controller;
  String _title = "webview";
  double _height = 100;
  double _width =100;
  String htmlStr = """
  <!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<p>ListView中的webview_flutter要放在SizedBox中，指定并指定sizedbox的高度，
                      否则会出错。<span style="color:#e74c3c">实际高度可以调用js来获得返回的高度
                      </span></p>

                      <p><img alt="" src="http://10.0.2.2:8000/media/imgs/2019-12-05.png"  /></p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
 """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$_title"),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              width: _width,
              height: _height,
              child: Card(
                  child: WebView(
                    initialUrl: "https://flutterchina.club/",
                    //JS执行模式 是否允许JS执行
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (controller) {
                      _controller = controller;
                      controller.loadUrl(Uri.dataFromString(htmlStr,
                          mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
                          .toString());
                    },
                    onPageFinished: (url) {
                      //调用JS得到实际高度
                      _controller.evaluateJavascript("document.documentElement.clientHeight;").then((result){
                        setState(() {
                          _height = double.parse(result);
                          print("高度$_height");
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
                    javascriptChannels: <JavascriptChannel>[
                      JavascriptChannel(
                          name: "share",
                          onMessageReceived: (JavascriptMessage message) {
                            print("参数： ${message.message}");
                          }
                      ),
                    ].toSet(),

                  )
              ),
            )

          ],
        )
    );
  }

}

