import 'package:flutter/material.dart';

class MySingleChildScrollView extends StatelessWidget {
  const MySingleChildScrollView({Key? key}) : super(key: key);

  ///SingleChildScrollView是一个只能包含单个组件的滚动组件，
  ///如果内容较多，建议使用ListView等，因为SingleChildScrollView没有“懒加载”模式，性能不如ListView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("滚动组件-SingleChildScrollView", style: TextStyle(fontSize: 15)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(50, (index) {
            return Container(
              height: 60,
              color: Colors.primaries[index % 18],
            );
          }).toList(),
        ),
        scrollDirection: Axis.vertical,
        ///内边距Padding
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
