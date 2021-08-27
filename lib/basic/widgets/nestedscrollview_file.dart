import 'package:flutter/material.dart';

class MyNestedScrollView extends StatelessWidget {
  const MyNestedScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return [const SliverAppBar(
            title: Text("NestedScrollView"),
          )];
        },
        body: ListView.builder(
          itemBuilder: (context, index){
            return Container(
              height: 80,
              color: Colors.primaries[index % 18],
              alignment: Alignment.center,
              child: Text("$index", style: const TextStyle(color: Colors.white)),
            );
          },
        ),
      ),
    );
  }
}
