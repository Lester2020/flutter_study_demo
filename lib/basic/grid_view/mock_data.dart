import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/grid_view/custom_icons.dart';
import 'package:flutter_study_demo/basic/grid_view/service_item_model.dart';

/// 美团 - 服务菜单
const List<ServiceItemViewModel> serviceList = [
  ServiceItemViewModel(
    title: '精选早餐',
    icon: Icon(
      CustomIcons.breakFirst,
      size: 25,
      color: Colors.lightBlue,
    ),
  ),
  ServiceItemViewModel(
    title: '包子',
    icon: Icon(
      CustomIcons.baozi,
      size: 25,
      color: Colors.orangeAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '炸鸡',
    icon: Icon(
      CustomIcons.friedFood,
      size: 29,
      color: Colors.deepOrangeAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '网红甜品',
    icon: Icon(
      CustomIcons.sweetmeats,
      size: 30,
      color: Colors.pinkAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '湘菜',
    icon: Icon(
      CustomIcons.xiangCuisine,
      size: 20,
      color: Colors.redAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '减免配送费',
    icon: Icon(
      CustomIcons.truck,
      size: 25,
      color: Colors.orange,
    ),
  ),
  ServiceItemViewModel(
    title: '美团专送',
    icon: Icon(
      CustomIcons.motorbike,
      size: 28,
      color: Colors.blueAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '到点自取',
    icon: Icon(
      CustomIcons.shop,
      size: 25,
      color: Colors.lightGreen,
    ),
  ),
  ServiceItemViewModel(
    title: '跑腿代购',
    icon: Icon(
      CustomIcons.errand,
      size: 25,
      color: Colors.red,
    ),
  ),
  ServiceItemViewModel(
    title: '全部分类',
    icon: Icon(
      CustomIcons.allCategories,
      size: 25,
      color: Colors.amber,
    ),
  ),
];
