import 'package:flutter/material.dart';
import 'package:flutter_study_demo/travel/request/travel_tab_dao.dart';
import 'package:flutter_study_demo/travel/widgets/travel_tab_page.dart';

import 'model/travel_tab_model.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late TabController _controller;
  List<TravelTab> tabs = [];
  TravelTabModel? travelTabModel;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _controller = TabController(length: 0, vsync: this);
    TravelTabDao.fetch().then((TravelTabModel model){
      _controller = TabController(length: model.tabs.length, vsync: this);
      setState(() {
        tabs = model.tabs;
        travelTabModel = model;
      });
    }).catchError((error){
      print(error);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            left: false,
            right: false,
            bottom: false,
            top: true,
            child: Container(
              color: Colors.white,
              height: 44.0,
              // padding: const EdgeInsets.only(top: 20),
              child: TabBar(
                controller: _controller,
                isScrollable: true,
                labelColor: Colors.black,
                labelPadding: const EdgeInsets.fromLTRB(20, 0, 10, 5),
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(color: Color(0xff2fcfbb), width: 3),
                    insets: EdgeInsets.only(bottom: 10)
                ),
                tabs: tabs.map((item){
                  return Tab(
                    text: item.labelName,
                  );
                }).toList(),
              ),
            ),
          ),
          //让TabBarView动态适应内容宽度，否则执行错误
          Flexible(
            child: TabBarView(
              controller: _controller,
              children: tabs.map((item){
                return TravelTabPage(travelUrl: travelTabModel?.url, groupChannelCode: item.groupChannelCode);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
