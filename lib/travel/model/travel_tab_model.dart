class TravelTabModel {
  String url;
  Map? params;
  List<TravelTab> tabs;

  TravelTabModel({required this.url, this.params, required this.tabs});

  factory TravelTabModel.fromJson(Map<String, dynamic> json) {
    List tabsJson = json["tabs"] as List;
    List<TravelTab> tabs = tabsJson.map((j) => TravelTab.fromJson(j)).toList();
    return TravelTabModel(url: json["url"], tabs: tabs);
  }

}

class TravelTab {

  String? labelName;
  String? groupChannelCode;
  int? type;

  TravelTab({required this.labelName, required this.groupChannelCode, required this.type});
  factory TravelTab.fromJson(Map<String, dynamic> json) {
    return TravelTab(
        labelName: json["labelName"],
        groupChannelCode: json["groupChannelCode"],
        type: json["type"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "labelName" : labelName,
      "groupChannelCode" : groupChannelCode,
      "type" : type
    };
  }
}
