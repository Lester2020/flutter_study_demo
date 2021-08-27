
import 'package:flutter_study_demo/home/model/sales_box_model.dart';
import 'common_model.dart';
import 'config_model.dart';
import 'grid_nav_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;

  HomeModel({required this.config, required this.bannerList, required this.localNavList, required this.subNavList, required this.gridNav, required this.salesBox});
  factory HomeModel.fromJson(Map<String, dynamic>json) {
    var bannerListJson = json["bannerList"] as List;
    List<CommonModel> bannerList = bannerListJson.map((e) => CommonModel.fromJson(e)).toList();

    var localNavListJson = json["localNavList"] as List;
    List<CommonModel> localNavList = localNavListJson.map((e) => CommonModel.fromJson(e)).toList();

    var subNavListJson = json["subNavList"] as List;
    List<CommonModel> subNavList = subNavListJson.map((e) => CommonModel.fromJson(e)).toList();

    return HomeModel(
        config: ConfigModel.fromJson(json["config"]),
        bannerList: bannerList,
        localNavList: localNavList,
        subNavList: subNavList,
        gridNav: GridNavModel.fromJson(json["gridNav"]),
        salesBox: SalesBoxModel.fromJson(json["salesBox"]));

  }
}



