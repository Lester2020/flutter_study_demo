import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/short_video/short_video_widget_bottom_page.dart';
import 'package:flutter_study_demo/basic/short_video/short_video_widget_info_page.dart';
import 'package:flutter_study_demo/basic/short_video/short_video_widget_top_page.dart';
import 'package:flutter_study_demo/basic/short_video/short_video_widget_video_page.dart';

class ShortVideoWidgetPage extends StatefulWidget {
  final Function onClose;
  const ShortVideoWidgetPage({Key? key, required this.onClose}) : super(key: key);

  @override
  _ShortVideoWidgetPageState createState() => _ShortVideoWidgetPageState();
}

class _ShortVideoWidgetPageState extends State<ShortVideoWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
        minHeight: MediaQuery.of(context).size.height
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _setBgImg(),
          _setBlurLayout(),
          Positioned(
            top: MediaQueryData.fromWindow(window).padding.top,
            child: ShortVideoWidgetTopPage(onClose: (){
              widget.onClose.call();
            }),
          ),
          Positioned(
            top: MediaQueryData.fromWindow(window).padding.top + 60,
            child: const ShortVideoWidgetInfoPage(),
          ),
          Positioned(
            top: MediaQueryData.fromWindow(window).padding.top + 100,
            child: const ShortVideoWidgetVideoPage(),
          ),
          const Positioned(
            bottom: 0,
            child: ShortVideoWidgetBottomPage(),
          )
        ],
      ),
    );
  }

  /// 设置背景图片
  _setBgImg() {
    return Image.asset('images/blur_bg.jpg', fit: BoxFit.fill);
  }

  /// 设置高斯模糊
  _setBlurLayout() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
      child: Container(
        color: Colors.white.withAlpha(50),
      ),
    );
  }

}
