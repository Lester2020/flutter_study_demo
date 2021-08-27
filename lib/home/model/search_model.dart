
/// 搜索模型
class SearchModel {
  final List<SearchItem>? data;
  String keyword = "";

  SearchModel({this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    List jsonData = json["data"] as List;
    List<SearchItem> data = jsonData.map((i) => SearchItem.fromJson(i)).toList();
    return SearchModel(data: data);
  }
}

class SearchItem {
  final String? word;  //xx酒店
  final String? type;  //类型
  final String? price;  //实时计价
  final String? star;   //豪华型
  final String? zonename; //区
  final String? districtname;  //城市
  final String? url; //链接

  SearchItem(
      {this.word,
        this.type,
        this.price,
        this.star,
        this.zonename,
        this.districtname,
        this.url});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
        word: json["word"],
        type: json["type"],
        price: json["price"],
        star: json['star'],
        zonename: json["zonename"],
        districtname: json["districtname"],
        url: json["url"]
    );
  }


}