import 'package:flutter/material.dart';

///ListView 是滚动组件，常用组件之一，用于展示大量数据的列表。
///数据较少时，可以直接给ListView设置childs来展示
///这种方式一次加载所有的组件，没有“懒加载”，因此当有大量数据时，最好使用ListView.builder动态创建列表

class MyListViewFile extends StatelessWidget {
  const MyListViewFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("滚动组件-ListView"),
      ),
      ///默认情况下，Flutter 的滚动组件（比如 ListView）没有显示滚动条，使用 Scrollbar 显示滚动条
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text("第$index个单元格"),
              ),
            );
          },
          ///itemCount 表示个数
          itemCount: 100,
          ///itemExtent 表示每一个Item的高度,也可以通过内容撑起高度
          itemExtent: 60,
          ///滚动方向，默认是垂直方向，可以设置为水平方向
          scrollDirection: Axis.vertical,
          ///是否反转滚动方向
          reverse: false,
          ///整体内间距
          padding: const EdgeInsets.all(10),
        ),
      )
    );
  }
}
