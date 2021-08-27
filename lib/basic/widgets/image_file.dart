import 'package:flutter/material.dart';

/// 图片组件包含Image和Icon两个组件，本质上Icon不属于图片组件，但其外形效果上类似于图片。
/// 在项目中建议优先使用Icon组件，Icon本质上是一种字体，只不过显示的不是文字，而是图标，而Image组件先通过图片解码器将图片解码，所以Icon有如下优点：
/// 通常情况下，图标比图片体积更小，显著的减少App包体积。
/// 图标不会出现失真或者模糊的现象，例如将20x20的图片，渲染在200x200的屏幕上，图片会失真或模糊，而图标是矢量图，不会失真，就像字体一样。
/// 多个图标可以存放在一个文件中，方便管理，全平台通用。


class MyImageFile extends StatelessWidget {
  const MyImageFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("图片组件"),
      ),
      body: Column(
        children: [
          ///加载网络图片：
          Image.network("http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg", width: 200, height: 200, fit: BoxFit.cover),
          const SizedBox(height: 20),
          ///加载项目中图片
          Image.asset("images/head.jpeg", width: 100, height: 100, fit: BoxFit.cover),
          const SizedBox(height: 20),
          ///加载设备上的图片：
          /// 要加载设备（手机）上的图片首先需要获取设备图片的路径，由于不同平台的路径不同，因此路径的获取必须依靠原生支持，
          /// 如果不懂原生（Android和iOS）开发，可以使用第三方插件获取路径:path_provider

          /// 淡入淡出效果
          Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg',
            frameBuilder: (BuildContext context, Widget child, int? frame,
                bool? wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded == true) {
                return child;
              }
              return AnimatedOpacity(
                child: child,
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
              );
            },
            width: 200,
            height: 100,
          ),

          const SizedBox(height: 20),

          Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg',
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            width: 200,
            height: 100,
          )




        ],
      ),
    );
  }
}

/**
 * fit参数就是设置填充方式，其值介绍如下：
    fill：完全填充，宽高比可能会变。
    contain：等比拉伸，直到一边填充满。
    cover：等比拉伸，直到2边都填充满，此时一边可能超出范围。
    fitWidth：等比拉伸，宽填充满。
    fitHeight：等比拉伸，高填充满。
    none：当组件比图片小时，不拉伸，超出范围截取。
    scaleDown：当组件比图片小时，图片等比缩小，效果和contain一样。
 *
 * */