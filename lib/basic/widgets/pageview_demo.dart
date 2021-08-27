import 'package:flutter/material.dart';

class MyPageViewDemo extends StatefulWidget {
  const MyPageViewDemo({Key? key}) : super(key: key);

  @override
  _MyPageViewDemoState createState() => _MyPageViewDemoState();
}

class _MyPageViewDemoState extends State<MyPageViewDemo> {

  var imgList = [
    'http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2877516247,37083492&fm=26&gp=0.jpg',
    'https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg',
  ];
  late PageController _pageController;
  var _currPageValue = 0.0;
  //缩放系数
  final double _scaleFactor = .8;
  //view page height
  final double _height = 230.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9
    );
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PageViewDemo"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        height: _height,
        child: PageView.builder(
          itemBuilder: (context, index) => _buildPageItem(index),
          itemCount: 10,
          controller: _pageController,
        ),
      ),
    );
  }

  _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      ///当前的item
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _currPageValue.floor() + 1) {
      ///右边的item
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _currPageValue.floor() - 1) {
      ///左边
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else {
      ///其他，不在屏幕显示的item
      matrix4 = Matrix4.diagonal3Values(1.0, _scaleFactor, 1.0)
        ..setTranslationRaw(0.0, _height * (1 - _scaleFactor) / 2, 0.0);
    }

    return Transform(
      transform: matrix4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: NetworkImage(imgList[index % imgList.length]), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
