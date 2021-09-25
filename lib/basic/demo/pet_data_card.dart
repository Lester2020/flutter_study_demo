import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/demo/widget_layout_demo1.dart';

class PetDataCard extends StatelessWidget {

  final PetDataModel model;
  const PetDataCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
                blurRadius: 6,
                spreadRadius: 4,
                color: Color.fromARGB(20, 0, 0, 0)
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _coverArea(),
          _userInfoArea(),
          _publishContentArea(),
          _interactionArea()
        ],
      ),
    );
  }

  /// 顶部封面区域
  Widget _coverArea() {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8)
          ),
          child: Image.network(
            model.coverUrl,
            height: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: 100,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(80, 0, 0, 0)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
          ),
        )
      ],
    );
  }

  /// 用户信息区域
  Widget _userInfoArea() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xffcccccc),
                backgroundImage: NetworkImage(model.userImgUrl),
              ),
              Padding(padding: EdgeInsets.only(left: 8)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.userName,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff333333)
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  Text(
                    model.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff999999)
                    ),
                  )
                ],
              )
            ],
          ),
          Text(
            model.publishTime,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff999999)
            ),
          )
        ],
      ),
    );
  }

  /// 发布信息区域
  Widget _publishContentArea() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 14),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
                color: Color(0xffffc600),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)
                )
            ),
            child: Text(
              "# ${model.topic}",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white
              ),
            ),
          ),
          Text(
            model.publishContent,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff333333)
            ),
          )
        ],
      ),
    );
  }

  /// 点赞信息区域
  Widget _interactionArea() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _interactionItem(Icons.message, Color(0xff999999), model.replies),
          _interactionItem(Icons.favorite, Color(0xffffc600), model.likes),
          _interactionItem(Icons.share, Color(0xff999999), model.shares)
        ],
      ),
    );
  }

  Widget _interactionItem(IconData iconData, Color color, int count) {
    return GestureDetector(
      onTap: (){

      },
      child: Row(
        children: [
          Icon(
              iconData,
            size: 16,
            color: color,
          ),
          Padding(padding: EdgeInsets.only(left: 6)),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff999999)
            ),
          )
        ],
      ),
    );
  }

}



