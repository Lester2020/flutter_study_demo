import 'package:flutter/material.dart';

class MySliverToBoxAdapter extends StatelessWidget {
  const MySliverToBoxAdapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("滚动组件SliverToBoxAdapter"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.cyan,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index){
              return Container(
                height: 60,
                color: Colors.primaries[index % 18],
                child: Text("$index", style: const TextStyle(color: Colors.white)),
              );
            },
              childCount: 30
            ),
          )
        ],
      ),
    );
  }
}
