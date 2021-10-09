import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/demo/friend_circle_comment_view.dart';
import 'package:flutter_study_demo/basic/demo/friend_circle_model.dart';

class FriendCircleItem extends StatelessWidget {
  final FriendCircleModel model;
  const FriendCircleItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              model.userImgUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.userName,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF636F80),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  model.saying,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Color(0xff333333),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Image.network(
                    model.pic,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.publishTime,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff999999),
                      ),
                    ),
                    Icon(
                      Icons.comment,
                      size: 16,
                      color: Color(0xff999999),
                    )
                  ],
                ),
                FriendCircleCommentView(model: model),
              ],
            ),
          )
        ],
      ),
    );
  }
}
