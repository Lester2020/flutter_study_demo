import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_study_demo/globe/app_provider.dart';
import 'package:flutter_study_demo/globe/colors.dart';
import 'package:flutter_study_demo/globe/global.dart';
import 'package:flutter_study_demo/third/widgets/custom_underline_tab_indicator.dart';
import 'package:flutter_study_demo/third/widgets/news_page.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  late TabController _controller;
  final List<Map<String, dynamic>> _heads = [
    {"title":"推荐", "subUrl":"dynamic/headline-list", "types":{"from": "toutiao"}},
    {"title":"科技", "subUrl":"dynamic/normal-list", "types":{"from": "T1348649580692"}},
    {"title":"历史", "subUrl":"dynamic/normal-list", "types":{"from": "T1368497029546"}},
    {"title":"军事", "subUrl":"dynamic/normal-list", "types":{"from": "T1348648141035"}},
    {"title":"手机", "subUrl":"dynamic/normal-list", "types":{"from": "T1348649654285"}},
    {"title":"体育", "subUrl":"dynamic/normal-list", "types":{"from": "T1348649079062"}},
    {"title":"财经", "subUrl":"dynamic/normal-list", "types":{"from": "T1348648756099"}},
    {"title":"教育", "subUrl":"dynamic/normal-list", "types":{"from": "T1348654225495"}},
    {"title":"娱乐", "subUrl":"dynamic/normal-list", "types":{"from": "T1348648517839"}},
    {"title":"公开课", "subUrl":"dynamic/normal-list", "types":{"from": "T1524118019401"}},
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _heads.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Column(
        children: [
          Container(
            height: Global.paddingTop + 86,
            child: Column(
              children: [
                Container(
                  height: Global.paddingTop + 52,
                  color: themeColorMap[AppProvider.instance.themeColor],
                  child: Container(
                    margin: EdgeInsets.only(top: Global.paddingTop),
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Icon(Icons.search, size: 22, color: Color(0xff1a1a1a).withOpacity(0.8)),
                                SizedBox(width: 1),
                                Text(
                                    "2021全国两会召开 | 抗日奇侠电视剧",
                                  style: TextStyle(
                                    color: Color(0xff1a1a1a),
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 30,
                          alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/icon_publish.png", width: 25, height: 25),
                              SizedBox(height: 2),
                              Text("发布", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 34.0,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                      color: dividerColor,
                      width: 0.5
                    )),
                    color: bodyColor,
                  ),
                  child: TabBar(
                    controller: _controller,
                    isScrollable: true,
                    tabs: _heads.map((dict) {
                      return Tab(
                        text: dict["title"].toString()
                      );
                    }).toList(),
                    labelColor: Colors.black,
                    labelPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    indicator: CustomUnderlineTabIndicator(
                      insets: EdgeInsets.fromLTRB(5, 0, 5, 2),
                      borderSide: BorderSide(color: themeColorMap[AppProvider.instance.themeColor]!, width: 3),
                    ),
                    labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    unselectedLabelStyle: TextStyle(fontSize: 17),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: TabBarView(
              controller: _controller,
              children: _heads.map((dict){
                return NewsPage(subUrl: dict["subUrl"], params: dict["types"]);
              }).toList(),
            ),
          )
        ],
      ),

    );
  }

  @override
  bool get wantKeepAlive => true;
}


