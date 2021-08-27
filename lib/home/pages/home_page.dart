import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_study_demo/main/loading_container.dart';
import 'package:flutter_study_demo/main/web_page.dart';
import 'package:flutter_study_demo/home/model/common_model.dart';
import 'package:flutter_study_demo/home/model/grid_nav_model.dart';
import 'package:flutter_study_demo/home/model/home_model.dart';
import 'package:flutter_study_demo/home/model/sales_box_model.dart';
import 'package:flutter_study_demo/home/pages/search_page.dart';
import 'package:flutter_study_demo/home/request/home_dao.dart';
import 'package:flutter_study_demo/home/widgets/grid_nav.dart';
import 'package:flutter_study_demo/home/widgets/local_nav.dart';
import 'package:flutter_study_demo/home/widgets/sales_box.dart';
import 'package:flutter_study_demo/home/widgets/search_bar.dart';
import 'package:flutter_study_demo/home/widgets/sub_nav.dart';
import 'package:flutter_study_demo/network/network_request.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';


//最大滚动距离
const appbarScrollOffset = 100;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
//导航条透明度
  double appBarAlpha = 0;

  List<CommonModel> bannerList = [];
  List<CommonModel> localNavList = [];
  GridNavModel? gridNavModel;
  List<CommonModel> subNavList = [];
  SalesBoxModel? salesBoxModel;
  bool _loading = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  Future<void> _handleRefresh() async {
    NetworkRequest.requestData(homeUrl, success: (resultData){
      HomeModel model = HomeModel.fromJson(resultData);
      setState(() {
        bannerList = model.bannerList;
        localNavList = model.localNavList;
        gridNavModel = model.gridNav;
        subNavList = model.subNavList;
        salesBoxModel = model.salesBox;
        _loading = false;
      });

    }, failed: (int code, String msg){
      setState(() {
        _loading = false;
      });
      throw Exception("failed load home_page.json");
    });

    // try {
    //   HomeModel model = await HomeDao.fetch();
    //   setState(() {
    //     bannerList = model.bannerList;
    //     localNavList = model.localNavList;
    //     gridNavModel = model.gridNav;
    //     subNavList = model.subNavList;
    //     salesBoxModel = model.salesBox;
    //     _loading = false;
    //   });
    //
    // } catch(error) {
    //   // print(error.toString());
    //   setState(() {
    //     _loading = false;
    //   });
    // }
    // return;
  }

  void _onScroll(offset) {
    double alpha = offset / appbarScrollOffset;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    //更新状态
    setState(() {
      appBarAlpha = alpha;
    });
  }

  ///注意：发现RefreshIndicator必须为NotificationListener的child或者没有NotificationListener才能正常显示
  ///如果NotificationListener为RefreshIndicator的child就不会显示

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final EdgeInsets insets = MediaQuery.of(context).padding;

    return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        //移除顶部间距
        body: LoadingContainer(
          isLoading: _loading,
          child: Stack(
            children: [
              MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  //监听页面滚动类，能够监听其包装的所有滚动控件
                  child: NotificationListener(
                    onNotification: (scrollNotification){
                      if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                        //监听滚动且是一级列表滚动的时候
                        _onScroll(scrollNotification.metrics.pixels);
                      }
                      return true;
                    },
                    child: RefreshIndicator(
                      onRefresh: _handleRefresh,
                      displacement: insets.top + 44.0,
                      child: _listView,
                    ),
                  )
              ),
              //控制透明度控件
              _appBar
            ],
          ),
        )
    );
  }

  /// 首页列表部分
  Widget get _listView {
    return ListView(
      children: [
        _banner,
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: LocalNav(localNavList: localNavList),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: GridNav(gridNavModel: gridNavModel),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: SubNav(subNavList: subNavList),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: SalesBox(salesBoxModel: salesBoxModel),
        )
      ],
    );
  }

  /// 首页banner
  Widget get _banner {
    return SizedBox(
      height: 160,
      child: Swiper(
        itemCount: bannerList.length,
        autoplay: true,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage(url: bannerList[index].url, title: bannerList[index].title)));
            },
            child: Image.network(
              bannerList[index].icon ?? "",
              fit: BoxFit.cover,
            ),
          );
        },
        pagination: const SwiperPagination(),
      ),
    );
  }

  /// 自定义导航条
  Widget get _appBar {
    //获取间距
    final EdgeInsets insets = MediaQuery.of(context).padding;
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x66000000), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, insets.top, 0, 0),
            height: insets.top + 44.0,
            decoration: BoxDecoration(
                color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255)
            ),
            child: SearchBar(
              searchType: appBarAlpha > 0.2 ? SearchType.homeLight : SearchType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSpeak,
              defaultText: "网红打卡地 景点 美食 酒店",
              leftButtonClick: (){

              },
            ),
          ),
        ),
        //底部阴影分割线
        Container(
          height: appBarAlpha > 0.2 ? 1.0 : 0,
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]
          ),
        )
      ],
    );

    // return Opacity(
    //   opacity: appBarAlpha,
    //   child: Container(
    //       height: 64,
    //       decoration: const BoxDecoration(color: Colors.white),
    //       child: const Center(
    //         child: Padding(
    //           padding: EdgeInsets.only(top: 20),
    //           child: Text("首页", style: TextStyle(color: Colors.black, fontSize: 18)),
    //         ),
    //       )
    //   ),
    // );
  }

  _jumpToSearch() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context){
          return const SearchPage(hint: "搜索你想去哪里");
        })
    );
  }

  _jumpToSpeak() {

  }
}

