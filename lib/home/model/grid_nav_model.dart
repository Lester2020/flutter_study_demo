import 'common_model.dart';

class GridNavModel {

  final GridNavItem? hotel;
  final GridNavItem? flight;
  final GridNavItem? travel;

  GridNavModel({this.hotel, this.flight, this.travel});
  factory GridNavModel.fromJson(Map<String, dynamic>json) {
    return GridNavModel(
        hotel: GridNavItem.fromJson(json["hotel"]),
        flight: GridNavItem.fromJson(json["flight"]),
        travel: GridNavItem.fromJson(json["travel"]));
  }
}

class GridNavItem {
  final String startColor;
  final String endColor;
  final CommonModel mainItem;
  final CommonModel item1;
  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  GridNavItem({
    required this.startColor,
    required this.endColor,
    required this.mainItem,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.item4});

  factory GridNavItem.fromJson(Map<String, dynamic>json) {
    return GridNavItem(
        startColor: json["startColor"],
        endColor: json["endColor"],
        mainItem: CommonModel.fromJson(json["mainItem"]),
        item1: CommonModel.fromJson(json["item1"]),
        item2: CommonModel.fromJson(json["item2"]),
        item3: CommonModel.fromJson(json["item3"]),
        item4: CommonModel.fromJson(json["item4"]));
  }
}