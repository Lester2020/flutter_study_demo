import 'package:flutter/material.dart';

class MyColumnFile extends StatelessWidget {
  const MyColumnFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("垂直布局组件"),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          color: Colors.cyan,
          child: Column(
            //Column 与 Row 正好相反,主轴 是垂直方向，交叉轴 是水平方向
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),
              Container(
                height: 100,
                width: 80,
                color: Colors.green,
              ),
              Container(
                height: 100,
                width: 80,
                color: Colors.orange,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.pink,
              )
            ],
          ),
        ),
      ),
    );
  }
}
