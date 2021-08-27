import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTweenFile extends StatefulWidget {
  const MyTweenFile({Key? key}) : super(key: key);

  @override
  _MyTweenFileState createState() => _MyTweenFileState();
}

class _MyTweenFileState extends State<MyTweenFile> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  final Color _startColor = Colors.red;
  final Color _endColor = Colors.green;
  // late Color _color;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1)
    );
    _controller.addListener(() {
      setState(() {
        ///Color.lerp 方法，此方法是在两种颜色之间线性插值
        ///Flutter 中把这种从 0 -> 1 转换为 蓝色 -> 红色 行为称之为 Tween（映射）
        // _color = Color.lerp(_startColor, _endColor, _controller.value)!;
      });
    });
    ///Tween 仅仅是映射，动画的控制依然由 AnimationController 控制
    ///ColorTween本质上也是使用 Color.lerp 实现的
    _animation = ColorTween(begin: _startColor, end: _endColor).animate(_controller);
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
        title: const Text("核心动画Tween"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            _controller.forward();
          },
          child: Container(
            width: 200,
            height: 200,
            // color: _color,
            color: _animation.value,
            alignment: Alignment.center,
            child: const Text("点我", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
