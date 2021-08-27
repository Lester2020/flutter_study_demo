import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIndicatorFile extends StatelessWidget {
  const MyIndicatorFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("进度组件"),
      ),
      body: Column(
        children: const [
          SizedBox(height: 20),
          /// 水平进度指示器
          LinearProgressIndicator(
            value: 0.5,
            backgroundColor: Colors.green,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
          SizedBox(height: 20),
          LinearProgressIndicator(),
          SizedBox(height: 20),
          CircularProgressIndicator(),
          SizedBox(height: 20),
          /// 圆形进度条
          CircularProgressIndicator.adaptive(),
          SizedBox(height: 20),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            backgroundColor: Colors.cyan,
            value: 0.75,
          ),
          SizedBox(height: 20),
          ///ios风格的指示器,radius参数是半径，值越大，控件越大。
          CupertinoActivityIndicator(
            radius: 20,
          ),
        ],
      ),
    );
  }
}
