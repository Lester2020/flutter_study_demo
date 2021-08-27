import 'package:flutter/material.dart';

class TransformDemoPage extends StatelessWidget {
  const TransformDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("偏移设置demo"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.cyan,
        child: Card(
          margin: const EdgeInsets.all(10),
          child: Container(
            color: Colors.red,
            height: 150,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getHeader(context),
                const Text(
                  "Flutter is Google's portable UI toolkit for crafting "
                      "beautiful, natively compiled applications for mobile,"
                      "web, and desktop from a single codebase. ",
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 3,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getHeader(BuildContext context) {
    ///向上偏移 -30 位置
    return Transform.translate(
      offset: const Offset(0, -30),
      child: Container(
        width: 72.0,
        height: 72.0,
        decoration: const BoxDecoration(
          ///阴影
          boxShadow: [
            BoxShadow(color: Colors.red, blurRadius: 5)
          ],
            ///形状
          shape: BoxShape.circle,
            ///图片
          image: DecorationImage(
              image: AssetImage("images/head.jpeg"),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}
