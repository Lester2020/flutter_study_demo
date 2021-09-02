import 'package:flutter/material.dart';
import 'package:flutter_study_demo/globe/app_provider.dart';
import 'package:flutter_study_demo/globe/colors.dart';
import 'package:flutter_study_demo/globe/global.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> with TickerProviderStateMixin {

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: TabBar(
                    controller: _controller,
                    isScrollable: true,
                    tabs: [
                      Tab(text: "推荐"),
                      Tab(text: "视频"),
                      Tab(text: "小视频"),
                      Tab(text: "科技"),
                      Tab(text: "互联网"),
                      Tab(text: "美食"),
                      Tab(text: "段子"),
                      Tab(text: "疫情"),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              color: Colors.red,
            ),
            // child: TabBarView(
            //   controller: _controller,
            //   children: [
            //
            //   ],
            // ),
          )
        ],
      ),

    );
  }
}

