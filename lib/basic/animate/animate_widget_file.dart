import 'package:flutter/material.dart';

class MyAnimateWidgetFile extends StatefulWidget {
  const MyAnimateWidgetFile({Key? key}) : super(key: key);

  @override
  _MyAnimateWidgetFileState createState() => _MyAnimateWidgetFileState();
}
///
/**
 * 创建动画三个必须的步骤:
 * 创建 AnimationController。
 * 监听 AnimationController，调用 setState 刷新UI。
 * 释放 AnimationController。
 *
 * Flutter 系统提供了20多个动画组件,这些组件大部分都是对常用操作的封装
 *隐式动画组件：只需提供给组件动画开始、结束值，组件创建 AnimationController、Curve、Tween，执行动画，释放AnimationController，我们称之为隐式动画组件，
 *隐式动画组件有： AnimatedAlign、AnimatedContainer、AnimatedDefaultTextStyle、
 *AnimatedOpacity、AnimatedPadding、AnimatedPhysicalModel、AnimatedPositioned、
 *AnimatedPositionedDirectional、AnimatedTheme、SliverAnimatedOpacity、TweenAnimationBuilder、AnimatedContainer 等
 *
 *显示动画组件：需要设置 AnimationController，控制动画的执行，使用显式动画可以完成任何隐式动画的效果，甚至功能更丰富一些，
 * 不过你需要管理该动画的 AnimationController 生命周期
 * 显示动画组件有：AlignTransition、AnimatedBuilder、AnimatedModalBarrier、DecoratedBoxTransition、
 * DefaultTextStyleTransition、PositionedTransition、RelativePositionedTransition、RotationTransition、
 * ScaleTransition、SizeTransition、SlideTransition 、FadeTransition 等
 *
 *
 * */
///

class _MyAnimateWidgetFileState extends State<MyAnimateWidgetFile> with SingleTickerProviderStateMixin {

  double _opacity = 1.0;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<Size?> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.green).animate(_controller);
    _sizeAnimation = SizeTween(begin: const Size(100.0, 50.0), end: const Size(200.0, 200.0)).animate(_controller);
    _controller.forward();
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
        title: const Text("动画组件"),
      ),
      body: Center(
        ///使用 AnimatedOpacity 我们并没有主动创建 AnimationController 和 Tween，
        ///是因为 AnimatedOpacity 内部已经创建了
        child: Column(
          children: [
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _opacity = 0;
                  });
                  ///延迟2秒执行
                  Future.delayed(const Duration(seconds: 2), (){
                    setState(() {
                      _opacity = 1.0;
                    });
                  });
                },
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
                animation: _controller,
                builder: (context, widget){
                  return Container(
                    width: _sizeAnimation.value?.width ?? 0.0,
                    height: _sizeAnimation.value?.height ?? 0.0,
                    color: _colorAnimation.value,
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
