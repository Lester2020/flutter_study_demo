import 'package:flutter/material.dart';

class MySliverAppBarFile extends StatelessWidget {
  const MySliverAppBarFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            ///设置为true时，当SliverAppBar内容滑出屏幕时，将始终渲染一个固定在顶部的收起状态
            pinned: true,
            ///展开区域的高度
            expandedHeight: 200,
            ///展开和折叠区域
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("SliverAppBar"),
              background: Image.network("http://img.haote.com/upload/20180918/2018091815372344164.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SliverFixedExtentList(delegate: SliverChildBuilderDelegate((context, index){
            return Card(
              child: Container(
                color: Colors.primaries[(index % 18)],
                child: Text("$index"),
                alignment: Alignment.center,
              ),
            );
          }), itemExtent: 60)
        ],
      ),
    );
  }
}
