import 'dart:ui';

import 'package:flutter/material.dart';

class MyBlurDemoPage extends StatelessWidget {
  const MyBlurDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("高斯模糊效果"),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset("images/head.jpeg", fit: BoxFit.cover),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              width: 200,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("我是高斯滤镜")
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
