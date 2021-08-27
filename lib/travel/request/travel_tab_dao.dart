import 'dart:convert';
import 'package:flutter_study_demo/travel/model/travel_tab_model.dart';
import 'package:http/http.dart' as http;

const travelUrl = "https://devio.org/io/flutter_app/json/travel_page.json";

class TravelTabDao {

  static Future<TravelTabModel> fetch() async {
    var url = Uri.parse(travelUrl);
    final response = await http.get(url);
    if(response.statusCode == 200) {
      Utf8Decoder utf8decoder = const Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return TravelTabModel.fromJson(result);
    } else {
      throw Exception("failed load travel_page.json");
    }
  }


}
