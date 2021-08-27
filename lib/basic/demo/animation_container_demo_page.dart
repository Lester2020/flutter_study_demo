import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationContainerDemoPage extends StatefulWidget {
  const AnimationContainerDemoPage({Key? key}) : super(key: key);

  @override
  _AnimationContainerDemoPageState createState() => _AnimationContainerDemoPageState();
}

class _AnimationContainerDemoPageState extends State<AnimationContainerDemoPage> {

  ///定义需要执行的滑动效果数值
  double _width = 50;
  double _height = 50;
  late Color _color = Colors.green;
  late BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("形变动画"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius
          ),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            ///生成随机数类
            final random = math.Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            _color = Color.fromRGBO(
                random.nextInt(255),
                random.nextInt(255),
                random.nextInt(255),
                1);

            _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());

          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
