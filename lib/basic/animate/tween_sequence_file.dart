import 'package:flutter/material.dart';

class MyTweenSequenceFile extends StatefulWidget {
  const MyTweenSequenceFile({Key? key}) : super(key: key);

  @override
  _MyTweenSequenceFileState createState() => _MyTweenSequenceFileState();
}

class _MyTweenSequenceFileState extends State<MyTweenSequenceFile> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))
    ..addListener(() {
      setState(() {
      });
    });
    ///weight表示每一个Tween的权重
    _animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 100.0, end: 200.0).chain(CurveTween(curve: Curves.linear)), weight: 40),
      TweenSequenceItem(tween: ConstantTween<double>(200.0), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 200.0, end: 300.0), weight: 40)

    ]).animate(_controller);

    //开始动画
    _controller.forward();
    super.initState();
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
        title: const Text("动画序列TweenSequence"),
      ),
      body: Center(
        child: Container(
          width: _animation.value,
          height: _animation.value,
          color: Colors.red,
        ),
      ),
    );
  }
}
