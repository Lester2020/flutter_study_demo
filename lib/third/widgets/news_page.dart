import 'package:flutter/material.dart';
import 'package:flutter_study_demo/network/network_request.dart';

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
  _NewsPageState(this._subUrl, this._params);
  
  @override
  void initState() {
    super.initState();
    _loadData();
  }
  
  void _loadData() {
    NetworkRequest.requestData(baseUrl+_subUrl, params: _params, headers: headers, success: (data){
      print(data);
    }, failed: (int code, String msg){
      print(msg);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("测试数据"),
    );
  }
}
