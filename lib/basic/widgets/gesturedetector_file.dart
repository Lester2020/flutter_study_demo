import 'package:flutter/material.dart';

class MyGestureDetectorFile extends StatelessWidget {
  const MyGestureDetectorFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("手势识别组件"),
      ),
      body: Column(
        children: [
          GestureDetector(
            ///点击事件
            ///按下然后抬起调用顺序onTapDown-> onTapUp-> onTap
            ///按下后移动的调用顺序onTapDown-> onTapCancel
            onTapDown: (TapDownDetails tapDownDetails){
              print("按下时回调");
            },
            onTapUp: (TapUpDetails tapUpDetails){
              print("抬起时回调");
            },
            onTap: (){
              print("点击事件回调");
            },
            onTapCancel: (){
              print("点击取消事件回调");
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              color: Colors.red,
              width: 100,
              height: 50,
            ),
          ),
          ///双击事件
          ///当同时监听onTap和onDoubleTap事件时，只会触发一个事件,如果触发onTap事件，onTap将会延迟触发（延迟时间为系统判断是onDoubleTap事件的间隔）
          ///因为系统将会等待一段时间来判断是否为onDoubleTap事件，如果用户只监听了onTap事件则没有延迟
          GestureDetector(
            onDoubleTap: (){
              print("双击事件");
            },
            onDoubleTapDown: (TapDownDetails tapDownDetails){
              print("双击事件按下");
            },
            onDoubleTapCancel: (){
              print("双击事件取消");
            },
            child: Container(
              width: 100,
              height: 50,
              color: Colors.green,
            ),
          ),
          ///长按事件
          GestureDetector(
            onLongPressStart: (LongPressStartDetails details) => print("长按手势开始"),
            onLongPress: () => print("长按手势"),
            onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) => print("长按手势移动"),
            onLongPressUp: () => print("长按手势抬起"),
            onLongPressEnd: (LongPressEndDetails details) => print("长按手势结束"),
            child: Container(
              width: 100,
              height: 50,
              color: Colors.orange,
            ),
          ),
          ///水平/垂直拖动事件
          GestureDetector(
            onVerticalDragDown: (DragDownDetails d) => print("垂直拖动按下事件回调"),
            onVerticalDragStart: (DragStartDetails d) => print("垂直拖动开始事件回调"),
            onVerticalDragUpdate: (DragUpdateDetails d) => print("垂直移动更新事件回调"),
            onVerticalDragEnd: (DragEndDetails d) => print("垂直拖动结束事件回调"),
            onVerticalDragCancel: () => print("垂直拖动取消事件回调"),
            onHorizontalDragDown: (DragDownDetails d) => print("水平拖动按下事件"),
            onHorizontalDragStart: (DragStartDetails d) => print("水平拖动开始事件回调"),
            onHorizontalDragUpdate: (DragUpdateDetails d) => print("水平移动更新事件回调"),
            onHorizontalDragEnd: (DragEndDetails d) => print("水平拖动结束事件回调"),
            onHorizontalDragCancel: () => print("水平拖动取消事件回调"),
            child: Container(
              width: 100,
              height: 50,
              color: Colors.blue,
            ),
          ),
          ///缩放事件
          GestureDetector(
            onScaleStart: (v) => print('缩放开始事件回调'),
            onScaleUpdate: (ScaleUpdateDetails v) => print('缩放更新事件回调'),
            onScaleEnd: (v) => print('缩放结束事件回调'),
            child: Container(
              width: 100,
              height: 50,
              color: Colors.orange,
            ),
          )
        ],
      ),
    );
  }
}
