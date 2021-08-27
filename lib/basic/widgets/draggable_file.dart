import 'package:flutter/material.dart';

class MyDraggableFile extends StatelessWidget {
  const MyDraggableFile({Key? key}) : super(key: key);

  ///拖拽组件包含 Draggable 、LongPressDraggable 和 DragTarget。
  ///Draggable、LongPressDraggable 为可拖拽的组件，LongPressDraggable 继承自Draggable，因此用法和 Draggable 完全一样
  ///唯一的区别就是 LongPressDraggable 触发拖动的方式是长按，而 Draggable 触发拖动的方式是按下
  ///DragTarget 为拖拽组件的目的地组件。

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("拖动组件"),
      ),
      body: Center(
        child: Draggable(
            child: Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text("Draggable", style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
            feedback: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10)
              ),
              alignment: Alignment.center,
              child: const Text("拖动中", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ///拖动的时候子组件显示其他样式
          childWhenDragging: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
            ),
            child: const Text("原组件", style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          ///控制拖动的方向
          // axis: Axis.horizontal,
          ///开始拖动时回调
          onDragStarted: (){

          },
          ///拖动结束时回调
          onDragEnd: (DraggableDetails details){

          },
          ///未拖动到DragTarget控件上时回调
          onDraggableCanceled: (Velocity velocity, Offset offset){

          },
          ///拖动到DragTarget控件上时回调
          onDragCompleted: (){

          },
        ),
      ),
    );
  }
}
