import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_study_demo/home/pages/home_page.dart';
import '../travel/travel_page.dart';
import '../basic/basic_page.dart';
import '../third/third_page.dart';

class BaseTabs extends StatefulWidget {
  const BaseTabs({Key? key}) : super(key: key);

  @override
  _BaseTabsState createState() => _BaseTabsState();
}

class _BaseTabsState extends State<BaseTabs> {
  int _index = 0;
  final List<Widget> _pages = [const HomePage(), const TravelPage(), const BasicPage(), const ThirdPage()];
  final List<String> _titles = ["首页", "分类", "商城", "我的"];
  final List<String> _imageNames = ["new_home_tabbar", "new_video_tabbar", "new_long_video_tabbar", "new_mine_tabbar"];
  final Color _themeColor = const Color.fromRGBO(237, 67, 71, 1.0);
  final Color _unselectedColor = const Color.fromRGBO(34, 34, 34, 1.0);

  List<BottomNavigationBarItem> _getItems() {
    List<BottomNavigationBarItem> items = [];
    int count = min(_titles.length, _imageNames.length);
    for (int i = 0; i < count; i++) {
      String imageName = _imageNames[i];
      BottomNavigationBarItem item = BottomNavigationBarItem(
          icon: Image.asset("images/$imageName.png", fit: BoxFit.cover, width: 24, height: 24,),
          activeIcon: Image.asset("images/${imageName}_press.png", fit: BoxFit.cover, width: 24, height: 24),
          label: _titles[i]
      );
      items.add(item);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: _getItems(),
            onTap: (index){
              setState(() {
                _index = index;
              });
            },
            currentIndex: _index,
            backgroundColor: Colors.white,
            activeColor: _themeColor,
            inactiveColor: _unselectedColor,
            iconSize: 24,
          ),
          tabBuilder: (context, index){
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(_titles[_index], style: const TextStyle(color: Colors.white, fontSize: 17)),
                backgroundColor: _themeColor,
                brightness: Brightness.dark,
              ),
              child: _pages[_index],
            );
          }
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(_titles[_index], style: const TextStyle(color: Colors.white, fontSize: 17)),
          backgroundColor: _themeColor,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _getItems(),
          onTap: (index){
            setState(() {
              _index = index;
            });
          },
          currentIndex: _index,
          backgroundColor: Colors.white,
          selectedItemColor: _themeColor,
          unselectedItemColor: _unselectedColor,
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
        ),
        body: _pages[_index],
      );
    }
  }
}
