import 'package:flutter/material.dart';

class MyRowFile extends StatelessWidget {
  const MyRowFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("水平布局组件"),
      ),
      body: Center(
        //具体到 Row 组件，主轴 是水平方向，交叉轴 是垂直方向。
        child: Container(
          width: 300,
          height: 300,
          color: Colors.cyan,
          child: Row(
            //mainAxisAlignment主轴对齐方式，默认是start
            //spaceAround ：第一个子控件距开始位置和最后一个子控件距结尾位置是其他子控件间距的一半
            //spaceEvenly ： 所有间距一样
            //spaceBetween ： 所有间距一样，但左右两遍没有间距
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),
              Container(
                height: 100,
                width: 80,
                color: Colors.green,
              ),
              Container(
                height: 100,
                width: 80,
                color: Colors.orange,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.pink,
              )
            ],
          ),
        ),
      ),
    );
  }
}
