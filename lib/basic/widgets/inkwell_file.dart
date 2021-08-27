import 'package:flutter/material.dart';

class MyInkWellFile extends StatelessWidget {
  const MyInkWellFile({Key? key}) : super(key: key);

  ///InkWell 组件在用户点击时出现“水波纹”效果
  ///onTap是点击事件回调，如果不设置无法出现“水波纹”效果

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("手势识别组件-InkWell"),
      ),
      body: Center(
        child: InkWell(
          onTap: (){

          },
          onDoubleTap: (){

          },
          onLongPress: (){

          },
          onFocusChange: (bool r){

          },
          ///设置高亮颜色颜色
          highlightColor: Colors.green,
          child: Container(
            color: Colors.red,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
