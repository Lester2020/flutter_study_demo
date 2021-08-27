import 'package:flutter/material.dart';

class MyGridViewFile extends StatelessWidget {
  const MyGridViewFile({Key? key}) : super(key: key);

  ///GridView 是一个可滚动的组件,类似iOS中UICollectionView
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("滚动组件-GridView"),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            ///列数
            crossAxisCount: 3,
            ///列间距
            crossAxisSpacing: 10,
            ///行间距
            mainAxisSpacing: 20,
          ),
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: 80,
              color: Colors.primaries[index % 18],
            );
          },
        ///整体内间距
        padding: const EdgeInsets.all(10),
        ///单元格数量
        itemCount: 100,
      ),
    );
  }
}
