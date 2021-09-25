import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/demo/pet_data_card.dart';

PetDataModel _model = PetDataModel(
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1425538345,901220022&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1699287406,228622974&fm=26&gp=0.jpg',
    '碧海一波啦啦啦',
    '河南 | 嘻嘻哈哈拉拉拉',
    '惠河流域',
    '12:59',
    '今天带着小VIVI去了爪子生活体验馆，好多好玩的小东西都想带回家！',
    456,
    678,
    56
);

class PitLayoutDemo extends StatelessWidget {
  const PitLayoutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局练习1"),
      ),
      body: ListView(
        children: [
          PetDataCard(model: _model),
          SizedBox(height: 20),
          PetDataCard(model: _model)
        ],
      ),
    );
  }



}

class PetDataModel {
  /// 封面地址
  final String coverUrl;
  /// 用户头像地址
  final String userImgUrl;
  /// 用户名
  final String userName;
  /// 用户描述
  final String description;
  /// 话题
  final String topic;
  /// 发布时间
  final String publishTime;
  /// 发布内容
  final String publishContent;
  /// 回复数
  final int replies;
  /// 喜欢数
  final int likes;
  /// 分享数
  final int shares;

  PetDataModel(
      this.coverUrl,
      this.userImgUrl,
      this.userName,
      this.description,
      this.topic,
      this.publishTime,
      this.publishContent,
      this.replies,
      this.likes,
      this.shares);


}