import 'package:flutter/material.dart';

class MyWrapFile extends StatelessWidget {
  const MyWrapFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("流式布局组件"),
      ),
      body: Wrap(
        //direction 属性控制布局方向，默认为水平方向，设置方向为垂直
        direction: Axis.horizontal,
        //主轴就是与当前组件方向一致的轴，而交叉轴就是与当前组件方向垂直的轴
        alignment: WrapAlignment.spaceAround,
        crossAxisAlignment: WrapCrossAlignment.start,
        //runAlignment 和 alignment 的区别：
        // alignment ：是主轴方向上对齐方式，作用于每一行。
        // runAlignment ：是交叉轴方向上将每一行看作一个整体的对齐方式。
        //主轴方向间距
        spacing: 5,
        //交叉轴方向子控件之间的间隙
        runSpacing: 15,
        children: List.generate(10, (index) {
          double w = 50.0 + 10 * index;
          double h = 50.0 + 5 * index;
          return Container(
            color: Colors.primaries[index],
            width: w,
            height: h,
            alignment: Alignment.center,
            child: Text('$index'),
          );
        }),

      ),
    );
  }
}
