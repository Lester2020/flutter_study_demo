import 'package:flutter/material.dart';

class MyListenerFile extends StatelessWidget {
  const MyListenerFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("手势识别-Listener"),
      ),
      body: Center(
        ///Listener 是一个监听指针事件的控件，比如按下、移动、释放、取消等指针事件，
        ///但Listener无法监听鼠标特有的事件，比如：移入、悬停、移出事件。
        ///鼠标事件使用MouseRegion监听。
        ///监听手势事件使用GestureDetector，GestureDetector是更高级的手势事件。
        child: Listener(
          ///按下时回调
          onPointerDown: (PointerDownEvent pointerDownEvent) {
            print('$pointerDownEvent');
          },
          ///移动时回调
          onPointerMove: (PointerMoveEvent pointerMoveEvent) {
            print('$pointerMoveEvent');
          },
          ///抬起时回调
          onPointerUp: (PointerUpEvent upEvent) {
            print('$upEvent');
          },
          child: Container(
            color: Colors.cyan,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
