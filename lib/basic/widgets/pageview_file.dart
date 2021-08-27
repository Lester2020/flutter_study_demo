import 'package:flutter/material.dart';

class MyPageViewFile extends StatefulWidget {
  const MyPageViewFile({Key? key}) : super(key: key);

  @override
  _MyPageViewFileState createState() => _MyPageViewFileState();
}

///PageView 控件可以实现一个“图片轮播”的效果，PageView 不仅可以水平滑动也可以垂直滑动，
///PageView滚动方向默认是水平，可以设置其为垂直方向,scrollDirection
///PageView配合PageController可以实现非常酷炫的效果，控制每一个Page不占满，
/// PageView(
/// 	controller: PageController(
/// 		viewportFraction: 0.9，
/// 	),
/// 	...
/// )
class _MyPageViewFileState extends State<MyPageViewFile> {

  final List<String> _pages = ["pageView1", "pageView2", "pageView3"];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("滚动组件-PageView"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          height: 260,
          child: Stack(
            children: [
              PageView.builder(
                ///页面发生变化时的回调
                onPageChanged: (int index){
                  setState(() {
                    _currentIndex = index;
                  });
                },
                ///实现无限滚动效果
                itemCount: 1000,
                itemBuilder: (BuildContext context, int index){
                  return _buildPageViewItem(index);
                },
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pages.length, (index){
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex % _pages.length == index ? Colors.blue : Colors.grey
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildPageViewItem(int index) {
    return Container(
      color: Colors.primaries[index % 18],
      alignment: Alignment.center,
      child: Text(_pages[index % _pages.length], style: const TextStyle(color: Colors.white)),
    );
  }
}

