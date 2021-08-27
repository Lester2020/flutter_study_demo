import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("图片demo"),
      ),
      body: Column(
        children: [
          Container(
            width: 200,
            margin: const EdgeInsets.only(left: 15, top: 15),
            padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bubble.png"),
                ///修改拉伸区域
                centerSlice: Rect.fromLTRB(10, 10, 11, 11),
                fit: BoxFit.fill,
              )
            ),
            child: const Text("昨夜西风凋碧树，独上高楼望尽天涯路；衣带渐宽终不悔，为伊消得人憔悴；众里寻他千百度，蓦然回首，那人却在灯火阑珊处.",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          ///带占位图效果图片
          const SizedBox(height: 20),
          Image.network(
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg",
            fit: BoxFit.cover,
            width: 150,
            height: 150,
            frameBuilder: (
                BuildContext context,
                Widget child,
                int? frame,
                bool wasSynchronouslyLoaded,
                ) {
              if (frame == null) {
                return Image.asset(
                  'images/head.jpeg',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                );
              }
              return child;
            },
          )
        ],
      ),
    );
  }
}
