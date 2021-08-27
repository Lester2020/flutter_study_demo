import 'package:flutter/material.dart';

class MyAnimationControllerDemo extends StatefulWidget {
  const MyAnimationControllerDemo({Key? key}) : super(key: key);

  @override
  _MyAnimationControllerDemoState createState() => _MyAnimationControllerDemoState();
}

///动画系统的核心是 AnimationController，而且是不可或缺的，动画中必须有 AnimationController
///而 Tween 和 Curve 则是对 AnimationController 的补充，
///Tween 实现了将 AnimationController [0,1]的值映射为其他类型的值，比如颜色、样式等
///Curve 是 AnimationController 动画执行曲线，默认是线性运行。
///一个 AnimationController 可以对应多个 Animation（Tween 或者 Curve）
///StatefulWidget 组件可以包含多个 AnimationController ，

class _MyAnimationControllerDemoState extends State<MyAnimationControllerDemo> with TickerProviderStateMixin {

  late AnimationController _sizeController;
  late AnimationController _colorController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _sizeController = AnimationController(vsync: this, duration: const Duration(seconds: 2))
    ..addListener(() {
      setState(() {
      });
    });
    ///写法一:
    _sizeAnimation = _sizeController
        .drive(CurveTween(curve: Curves.linear))
        .drive(Tween(begin: 100, end: 200));

    _colorController = AnimationController(vsync: this, duration: const Duration(seconds: 1))
    ..addListener(() {
      setState(() {
      });
    });
    ///写法二：
    // _colorAnimation = ColorTween(begin: Colors.red, end: Colors.green)
    //     .chain(CurveTween(curve: Curves.bounceIn))
    //     .animate(_colorController);
    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.green)
        .chain(CurveTween(curve: Curves.bounceIn))
        .animate(CurvedAnimation(parent: _colorController, curve: const Interval(0.5, 1.0)));
    ///Interval继承自Curve
    ///上面_colorAnimation表示动画从0.5（一半）开始到结束
    ///Interval中begin 和end参数值的范围是0.0到1.0
  }

  @override
  void dispose() {
    super.dispose();
    _sizeController.dispose();
    _colorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("核心动画demo"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            _sizeController.forward();
            _colorController.forward();
          },
          child: Container(
            width: _sizeAnimation.value,
            height: _sizeAnimation.value,
            color: _colorAnimation.value,
            alignment: Alignment.center,
            child: const Text("点我", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
