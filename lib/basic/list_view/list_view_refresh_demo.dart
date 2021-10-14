import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/list_view/mock_data.dart';
import 'package:flutter_study_demo/basic/list_view/news_card.dart';
import 'package:flutter_study_demo/basic/list_view/news_view_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListViewRefreshDemo extends StatefulWidget {
  const ListViewRefreshDemo({Key? key}) : super(key: key);

  @override
  _ListViewRefreshDemoState createState() => _ListViewRefreshDemoState();
}

class _ListViewRefreshDemoState extends State<ListViewRefreshDemo> {

  List<NewsViewModel> _list = List.from(newsList);
  final ScrollController _controller = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if(!_isLoading && _controller.position.pixels >= _controller.position.maxScrollExtent){
        setState(() {
          _isLoading = true;
          _footerRefresh();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future _headerRefresh() {
    return Future.delayed(Duration(seconds: 2), (){
      Fluttertoast.showToast(msg: '刷新成功');
      setState(() {
        _list = List.from(newsList);
      });
    });
  }

  Future _footerRefresh() {
    return Future.delayed(Duration(seconds: 2), (){
      setState(() {
        _isLoading = false;
        _list.addAll(newsList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView刷新练习'),
      ),
      body: RefreshIndicator(
        onRefresh: _headerRefresh,
        child: ListView.separated(
          itemBuilder: (context, index){
            if(index < _list.length){
              return NewsCard(model: _list[index]);
            } else {
              return footerView();
            }
          },
          separatorBuilder: (context, index){
            return Divider(
              height: 0.5,
              color: Color(0xffdddddd),
            );
          },
          itemCount: _list.length+1,
          controller: _controller,
        ),
      ),
    );
  }

  Widget footerView() {
    if(_isLoading){
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '努力加载中...',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff333333)
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                  strokeWidth: 3
              ),
            )
          ],
        ),
      );

    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          "上拉加载更多",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xff333333),
          ),
        ),
      );
    }
  }

}
