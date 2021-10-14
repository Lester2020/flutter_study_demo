import 'package:flutter/material.dart';
import 'package:flutter_study_demo/network/network_request.dart';
import 'package:flutter_study_demo/third/model/news_model.dart';
import 'package:flutter_study_demo/third/widgets/news_item.dart';
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
const baseParams = {
  "devId":"AU/I4gdRPg01Oa35A7Rx9cgoij07diFUGbX6Z1WtljIB5UztsuQ5jl0T01RoImAl",
  "version":"76.1",
  "spever":false,
  "net":"wifi",
  "sign":"KrdzeKfyPUG8ZjcVKRHy1ojetlYdi/EDvPc2TJNURqR48ErR02zJ6/KXOnxX046I",
  "encryption":"1",
  "canal":"appstore",
  "fn":"2"
};

class NewsPage extends StatefulWidget {
  final String subUrl;
  final Map<String, dynamic> params;
  const NewsPage({Key? key, required this.subUrl, required this.params}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState(subUrl, params);
}

class _NewsPageState extends State<NewsPage> with AutomaticKeepAliveClientMixin {
  final String _subUrl;
  final Map<String, dynamic> _params;
  int _page = 0;
  List<NewsModel> _dataArray = [];
  final RefreshController _controller = RefreshController(initialRefresh: true);
  _NewsPageState(this._subUrl, this._params);

  void _headerRefresh() async {
    _page = 0;
    _dataArray = [];
    _loadData();
  }

  void _footerRefresh() async {
    _page+=10;
    _loadData();
  }

  void _loadData() async {
    Map<String, dynamic> totalParams = {};
    totalParams.addAll(baseParams);
    totalParams.addAll(_params);
    totalParams["offset"] = "$_page";
    totalParams["size"] = "10";
    totalParams["ts"] = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    await NetworkRequest.requestData(baseUrl+_subUrl, params: totalParams, headers: headers, success: (data){
      if(mounted){
        // print(data);
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
    super.build(context);
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
          return NewsItem(model: _dataArray[index]);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
