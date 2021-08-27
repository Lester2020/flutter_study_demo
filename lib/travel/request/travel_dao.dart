import 'dart:convert';
import 'package:flutter_study_demo/travel/model/travel_model.dart';
import 'package:http/http.dart' as http;

Map params = {
  "districtId": -1,
  "groupChannelCode": "tourphoto_global1",
  "type": null,
  "lat": 34.2317081,
  "lon": 108.928918,
  "locatedDistrictId": 7,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {
    "cid": "09031010211161114530",
    "ctok": "",
    "cver": "1.0",
    "lang": "01",
    "sid": "8888",
    "syscode": "09",
    "auth": null,
    "extension": [
      {"name": "protocal", "value": "https"}
    ]
  },
  "contentType": "json"
};

class TravelDao {

  static Future<TravelModel> fetch(
      String urlStr,
      String groupChannelCode,
      int pageIndex,
      int pageSize,) async {

    var url = Uri.parse(urlStr);
    Map pageParaMap = params["pagePara"];
    pageParaMap["pageIndex"] = pageIndex;
    pageParaMap["pageSize"] = pageSize;
    params["groupChannelCode"] = groupChannelCode;

    final response = await http.post(url, body: jsonEncode(params));
    if(response.statusCode == 200) {
      Utf8Decoder utf8decoder = const Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return TravelModel.fromJson(result);
    } else {
      throw Exception("failed load travel.json");
    }
  }


}
