import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/list_view/news_view_model.dart';

class NewsCard extends StatelessWidget {

  final NewsViewModel model;

  const NewsCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff333333)
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 3)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.source,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xff999999)
                      ),
                    ),
                    Text(
                      '${model.comments}评论',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xff999999)
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 16)),
          Image.network(
            model.coverImgUrl,
            width: 100,
            height: 60,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
