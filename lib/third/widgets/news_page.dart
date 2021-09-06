import 'package:flutter/material.dart';
import 'package:flutter_study_demo/network/network_request.dart';
import 'package:flutter_study_demo/third/model/news_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const baseUrl = "https://v6-gw.m.163.com/nc/api/v1/feed/";
const headers = {
  "Content-Type":"application/json;charset=UTF-8",
  "user-agent":"NewsApp/76.1 iOS/14.4 (iPhone13,2)",
  "user-appid":"zbCHbGcGkGiMBRRJXmZMeA==",
  "user-da":"0s29TN7+3eTrM8C8wV/0sS/myospKKFNrlDwii9KBnJesXabOlbbSbEXzgUS8XT0",
  "user-d":"AU/I4gdRPg01Oa35A7Rx9cgoij07diFUGbX6Z1WtljIB5UztsuQ5jl0T01RoImAl",
  "user-n":"WMJEFhR9rRqgr30oX2W7DQ=="
};

class NewsPage extends StatefulWidget {
  final String subUrl;
  final Map<String, dynamic> params;
  const NewsPage({Key? key, required this.subUrl, required this.params}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState(subUrl, params);
}

class _NewsPageState extends State<NewsPage> {
  final String _subUrl;
  final Map<String, dynamic> _params;
  int _page = 0;
  List<NewsModel> _dataArray = [];
  RefreshController _controller = RefreshController(initialRefresh: true);
  _NewsPageState(this._subUrl, this._params);

  void _headerRefresh() async {
    _page = 0;
    _dataArray = [];
    _loadData();
  }

  void _footerRefresh() async {
    _page++;
    _loadData();
  }

  void _loadData() async {
    _params["offset"] = "$_page";
    _params["size"] = "10";
    await NetworkRequest.requestData(baseUrl+_subUrl, params: _params, headers: headers, success: (data){
      if(mounted){
        setState(() {
          List listData = data["data"]["items"];
          for(var dict in listData){
            NewsModel model = NewsModel.fromJson(dict);
            _dataArray.add(model);
          }
        });
        if(_page == 0){
          _controller.refreshCompleted();
        } else {
          _controller.loadComplete();
        }
      }

    }, failed: (int code, String msg){
      print(msg);
      _controller.refreshCompleted();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _controller,
      onRefresh: _headerRefresh,
      onLoading: _footerRefresh,
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: ClassicFooter(),
      child: ListView.builder(
        itemCount: _dataArray.length,
        itemBuilder: (context, index){
          return Text("测试数据-$index");
        },
      ),
    );
  }
}
