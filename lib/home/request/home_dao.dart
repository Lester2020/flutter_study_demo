import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/home_model.dart';

const homeUrl = "https://www.devio.org/io/flutter_app/json/home_page.json";

/// 首页接口
class HomeDao {
  static Future<HomeModel> fetch() async {
    var url = Uri.parse(homeUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //修复中文乱码
      Utf8Decoder utf8decoder = const Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception("failed load home_page.json");
    }
  }
}

/**
 * await http.post(
    Uri.parse("https://api.instagram.com/oauth/access_token"),
    body: {
    "client_id": clientID,
    "redirect_uri": redirectUri,
    "client_secret": appSecret,
    "code": authorizationCode,
    "grant_type": "authorization_code",
    });
 *
 * */