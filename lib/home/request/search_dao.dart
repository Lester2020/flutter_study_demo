import 'dart:async';
import 'dart:convert';
import 'package:flutter_study_demo/home/model/search_model.dart';
import 'package:http/http.dart' as http;

class SearchDao {

  static Future<SearchModel> fetch(String urlStr, String searchText) async {
    var url = Uri.parse(urlStr);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //修复中文乱码
      Utf8Decoder utf8decoder = const Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      SearchModel model = SearchModel.fromJson(result);
      //只有当前输入的内容和服务端返回一直的时候才渲染
      model.keyword = searchText;
      return model;
    } else {
      throw Exception("failed load search_page.json");
    }
  }

}