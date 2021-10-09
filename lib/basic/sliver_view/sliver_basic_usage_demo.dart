import 'dart:ui';
import 'package:flutter/material.dart';

final List<Color> colorList = [
  Colors.red,
  Colors.orange,
  Colors.green,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Colors.teal,
  Colors.deepPurpleAccent
];

class SliverBasicUsageDemo extends StatelessWidget {
  const SliverBasicUsageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver基础使用'),
      ),
      body: CustomScrollView(
        slivers: [
          sliverTitleBar('SliverGrid'),
          SliverGrid.count(
            crossAxisCount: 3,
            children: colorList.map((color) {
              return Container(
                color: color,
              );
            }).toList(),
          ),
          sliverTitleBar('SliverList'),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate((context, index){
                return Container(
                  color: colorList[index],
                );
              },
                childCount: colorList.length
              ),
              itemExtent: 80
          ),
        ],
      ),
    );
  }

  Widget sliverTitleBar(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
