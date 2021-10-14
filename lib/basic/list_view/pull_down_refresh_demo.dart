import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/list_view/mock_data.dart';
import 'package:flutter_study_demo/basic/list_view/news_card.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PullDownRefreshDemo extends StatefulWidget {
  const PullDownRefreshDemo({Key? key}) : super(key: key);

  @override
  _PullDownRefreshDemoState createState() => _PullDownRefreshDemoState();
}

class _PullDownRefreshDemoState extends State<PullDownRefreshDemo> {

  final List _list = newsList;

  Future onRefresh(){
    return Future.delayed(Duration(seconds: 2), () {
      Fluttertoast.showToast(msg: '当前已是最新数据');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下拉刷新练习"),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.separated(
            itemBuilder: (context, index){
              return NewsCard(model: _list[index]);
            },
            separatorBuilder: (context, index){
              return Divider(
                height: 0.5,
                color: Color(0xffdddddd),
              );
            },
            itemCount: _list.length
        ),
      ),
    );
  }
}
