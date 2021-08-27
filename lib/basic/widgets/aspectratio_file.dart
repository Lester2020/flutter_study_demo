import 'package:flutter/material.dart';

class MyAspectRatioFile extends StatelessWidget {
  const MyAspectRatioFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("宽高比组件"),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          width: 300,
          height: 300,
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Container(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
