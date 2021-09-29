import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/list_view/friend_view_model.dart';

class FriendCardItem extends StatelessWidget {

  final FriendViewModel model;

  const FriendCardItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              model.userImgUrl,
              width: 40,
              height: 40,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 15)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.userName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333),
                      ),
                    ),
                    Text(
                        model.msgTime,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff999999),
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 2)),
                Text(
                  model.msgContent,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff999999),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
