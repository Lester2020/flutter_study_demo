import 'package:flutter/material.dart';

class MyAnimationController extends StatefulWidget {
  const MyAnimationController({Key? key}) : super(key: key);

  @override
  _MyAnimationControllerState createState() => _MyAnimationControllerState();
}

class _MyAnimationControllerState extends State<MyAnimationController> with SingleTickerProviderStateMixin {
  ///AnimationController，它是动画控制器，控制动画的启动、停止，还可以获取动画的运行状态
  ///vsync：当创建 AnimationController 时，需要传递一个vsync参数，存在vsync时会防止屏幕外动画消耗不必要的资源，
  ///单个 AnimationController 的时候使用 SingleTickerProviderStateMixin，
  ///多个 AnimationController 使用 TickerProviderStateMixin
  ///duration：表示动画执行的时间
  ///AnimationController 的值默认是 0 到 1,也可以通过参数形式设置最大值和最小值,每一帧都会回调addListener

  double _size = 100;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 100,
      upperBound: 200,
    );
    _controller.addListener(() {
      setState(() {
        ///未设置大小边界值的方式
        // _size = 100 + 100 * _controller.value;
        ///设置了边界值的方式
        _size = _controller.value;
      });
    });
    ///动画的状态分为四种
    ///dismissed：动画停止在开始处
    ///forward：动画正在从开始处运行到结束处（正向运行
    ///reverse：动画正在从结束处运行到开始处（反向运行
    ///completed：动画停止在结束处
    ///动画的控制方法：
    ///forward：正向执行动画。
    /// reverse：反向执行动画。
    /// repeat：反复执行动画。
    /// reset：重置动画。
    /// forward 和 reverse 方法中都有 from 参数，这个参数的意义是一样的，表示动画从此值开始执行，而不再是从lowerBound 到 upperBound。
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.reverse();
      } else if(status == AnimationStatus.dismissed) {
        _controller.forward();
      }
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
      appBar: AppBar(
        title: const Text("核心动画AnimationController"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            _controller.forward();
          },
          child: Container(
            width: _size,
            height: _size,
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text("点击一下", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
