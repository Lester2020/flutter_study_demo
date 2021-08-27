import 'package:flutter/material.dart';

class MyFractionallySizedBoxFile extends StatelessWidget {
  const MyFractionallySizedBoxFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("相对父组件尺寸"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.pink,
          child: FractionallySizedBox(
            //通过 alignment 参数控制子组件显示的位置，默认为居中
            alignment: Alignment.center,
            widthFactor: 0.5,
            heightFactor: 0.6,
            child: Container(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
