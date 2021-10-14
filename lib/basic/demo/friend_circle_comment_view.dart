import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/demo/friend_circle_model.dart';

class FriendCircleCommentView extends StatelessWidget {
  final FriendCircleModel model;
  const FriendCircleCommentView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      color: const Color(0xFFF3F3F5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: model.comments.map((comment){
          return Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xff333333),
              ),
              children: [
                TextSpan(
                  text: comment.fromUser,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF636F80),
                  )
                ),
                TextSpan(
                  text: ': ${comment.content}'
                )
              ]..insertAll(1, comment.source ? [const TextSpan()] : [
                const TextSpan(
                  text: ' 回复 '
              ),
                TextSpan(
                  text: comment.toUser,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF636F80),
                  )
                ),
                ])
            )
          );
        }).toList(),
      ),
    );
  }
}
