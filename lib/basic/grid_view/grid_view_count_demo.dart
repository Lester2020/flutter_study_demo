import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/grid_view/mock_data.dart';
import 'package:flutter_study_demo/basic/grid_view/service_item.dart';

class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Count用法'),
      ),
      body: GridView.count(
        crossAxisCount: 5,
        padding: const EdgeInsets.symmetric(vertical: 0),
        children: serviceList.map((m) {
          return ServiceItem(model: m);
        }).toList(),
      ),
    );
  }
}
