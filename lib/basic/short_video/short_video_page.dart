import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_demo/basic/short_video/short_video_widget_page.dart';

class ShortVideoPage extends StatefulWidget {
  const ShortVideoPage({Key? key}) : super(key: key);

  @override
  _ShortVideoPageState createState() => _ShortVideoPageState();
}

class _ShortVideoPageState extends State<ShortVideoPage> {

  PageController _controller = PageController(keepPage: true);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height
        ),
        child: PageView.builder(
          controller: _controller,
          itemCount: 20,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index){
            return ShortVideoWidgetPage(
              onClose: (){

              },
            );
          },
        ),
      ),
    );
  }
}
