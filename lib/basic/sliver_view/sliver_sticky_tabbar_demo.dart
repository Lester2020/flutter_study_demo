import 'package:flutter/material.dart';

class SliverStickyTabBarDemo extends StatefulWidget {
  const SliverStickyTabBarDemo({Key? key}) : super(key: key);

  @override
  _SliverStickyTabBarDemoState createState() => _SliverStickyTabBarDemoState();
}

class _SliverStickyTabBarDemoState extends State<SliverStickyTabBarDemo> with SingleTickerProviderStateMixin {

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 6,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'SliverStickyTabBar效果',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22
                ),
              ),
                background: Image.network(
                  'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg@1280w_1l_2o_100sh.jpg',
                  fit: BoxFit.cover,
                ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverTabBarHeaderDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: _controller,
                tabs: [
                  Tab(
                    text: '主页信息',
                  ),
                  Tab(
                    text: '个人信息',
                  )
                ],
              )
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _controller,
              children: [
                Center(
                  child: Text('这是主页信息页面'),
                ),
                Center(
                  child: Text('这是个人信息页面'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SliverTabBarHeaderDelegate extends SliverPersistentHeaderDelegate {

  final TabBar child;

  SliverTabBarHeaderDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}


