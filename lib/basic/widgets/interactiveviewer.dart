import 'package:flutter/material.dart';

class MyInteractiveViewer extends StatelessWidget {
  const MyInteractiveViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("缩放平移组件"),
      ),
      body: Center(
        child: InteractiveViewer(
          child: Container(
            width: 300,
            height: 500,
            color: Colors.red,
            child: Image.asset("images/head.jpeg", fit: BoxFit.cover,),
          ),
          ///最大缩放倍数
          maxScale: 3,
          ///最小缩放倍数
          minScale: 0.25,
          ///是否可以缩放
          scaleEnabled: true,
          ///组件树中的约束是否应用于子组件，默认为true
          constrained: true,
          ///当用户开始平移或缩放手势时调用
          onInteractionStart: (ScaleStartDetails details){

          },
          ///当用户更新组件上的平移或缩放手势时调用
          onInteractionUpdate: (ScaleUpdateDetails details){

          },
          ///当用户在组件上结束平移或缩放手势时调用
          onInteractionEnd: (ScaleEndDetails details){

          },
        ),
      ),
    );
  }
}
