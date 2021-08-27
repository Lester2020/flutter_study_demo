import 'package:flutter/material.dart';

class MySizeBoxFile extends StatelessWidget {
  const MySizeBoxFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("固定宽高组件"),
      ),
      body: Column(
        children: [
          const SizedBox(
            width: 100,
            height: 100,
            child: Text("这是一个SizedBox组件"),
          ),
          //设置无限大
          //height: double.infinity,
          //虽然设置了无限大，子控件是否会无限长呢？不，不会，子控件依然会受到父组件的约束，会扩展到父组件的尺寸
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Container(
              color: Colors.green,
              child: const Text("一个最大宽度的sizebox组件"),
            ),
          )
        ],
      ),
    );
  }
}
