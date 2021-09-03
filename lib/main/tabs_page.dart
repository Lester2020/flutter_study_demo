import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_demo/generated/l10n.dart';
import 'package:flutter_study_demo/globe/user_event.dart';
import 'package:flutter_study_demo/home/pages/home_page.dart';
import 'package:flutter_study_demo/third/draw_page.dart';
import '../travel/travel_page.dart';
import '../basic/basic_page.dart';
import '../third/third_page.dart';
import 'dart:math';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _index = 0;
  final List<String> _imageNames = ["new_home_tabbar", "new_video_tabbar", "new_long_video_tabbar", "new_mine_tabbar"];
  final Color _themeColor = const Color.fromRGBO(237, 67, 71, 1.0);
  final Color _unselectedColor = const Color.fromRGBO(34, 34, 34, 1.0);
  final PageController _controller = PageController(initialPage: 0);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<BottomNavigationBarItem> _getItems(BuildContext context) {
    List<BottomNavigationBarItem> items = [];
    List<String> _titles = [S.of(context).home, S.of(context).travel, S.of(context).category, S.of(context).mine];
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
    _listen(context);
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: BottomNavigationBar(
        items: _getItems(context),
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _index = index;
            if(index == 0 || index == 1) {
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
            } else {
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
            }
          });
        },
        currentIndex: _index,
        ///此处已经在全局主题色里设置了
        // backgroundColor: Colors.white,
        // selectedItemColor: _themeColor,
        // unselectedItemColor: _unselectedColor,
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
      ),
      body: PageView(
        controller: _controller,
        //禁止pageView滚动
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          TravelPage(),
          BasicPage(),
          ThirdPage()
        ],
      ),
      ///抽屉
      drawer: _index == 2 ? DrawPage() : null,
    );
  }

  /// Flutter 手动控制drawer打开1.GlobalKey 方式打开
  void _listen(BuildContext context) {
    eventBus.on<UserEvent>().listen((event) {
      if(event.text == "openDrawer"){
        _scaffoldKey.currentState?.openDrawer();
      }
    });
  }

  ///2.builder方式:Scaffold.of(context).openDrawer(),
 ///不过这个方式需要在含有draw的scaffold里调用

}

/**
 * tabbar切换，希望控制器不被重新加载的处理方案：
 * 使用IndexedStack来实现会有性能上的问题，在初始化的时候，会一次性的将所有的页面全部被加载。
 *
 * 保持组件不被回收 AutomaticKeepAliveClientMixin：
 * 场景如下：
    1、切换Tab后、页面每次都会刷新，重新加载；
    2、ListView中的某个条目设置为头布局，不希望被回收

    使用 AutomaticKeepAliveClientMixin ；

    第一步：
    class _ListsPageState extends State<ListsPage> with AutomaticKeepAliveClientMixin {}
    同时它们的[build]方法必须调用super.build

    @override
    Widget build(BuildContext context) {
    super.build(context);    //调用super.build(返回值始终返回null，应将其忽略)
    return onBuild(context);
    }

    第二步：
    @override
    bool get wantKeepAlive => true;
 *
 * */
