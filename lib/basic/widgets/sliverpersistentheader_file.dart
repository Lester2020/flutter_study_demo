import 'package:flutter/material.dart';

class MySliverPersistentHeader extends StatelessWidget {
  const MySliverPersistentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sliver滚动组件"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index){
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              },
                childCount: 30
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ))

        ],
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.cyan,
      alignment: Alignment.center,
      child: const Text('我是SliverPersistentHeader',
          style: TextStyle(color: Colors.white)),
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
  
}