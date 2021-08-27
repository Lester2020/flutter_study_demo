import 'package:flutter/material.dart';

class MyCurveFile extends StatefulWidget {
  const MyCurveFile({Key? key}) : super(key: key);

  @override
  _MyCurveFileState createState() => _MyCurveFileState();
}

///动画中还有一个重要的概念就是 Curve，即动画执行曲线。
///负责控制动画变化的速率，通俗地讲就是使动画的效果能够以匀速、加速、减速、抛物线等各种速率变化
///系统已经提供了38种常用到动画曲线
///比方：linear、decelerate、bounceIn、bounceOut...
///默认是线性运行

class _MyCurveFileState extends State<MyCurveFile> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
    ///必须实现，不然动画没有效果
    _controller.addListener(() {
      setState(() {

      });
    });
    _animation = Tween(begin: 100.0, end: 200.0)
        .chain(CurveTween(curve: Curves.bounceIn))
        .animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("核心动画Curve"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            _controller.forward();
          },
          child: Container(
            width: _animation.value,
            height: _animation.value,
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text("点我", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
