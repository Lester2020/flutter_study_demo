import 'package:flutter/material.dart';

class MySliverViewFile extends StatelessWidget {
  const MySliverViewFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("滚动组件-SliverView"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildBuilderDelegate((context, index){
            return Container(
              height: 65,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }, childCount: 15),
          ),

          SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              }, childCount: 18)
          )

        ],

      ),
    );
  }
}
