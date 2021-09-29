import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/list_view/subscribe_account_model.dart';

class SubscribeAccountItem extends StatelessWidget {

  final SubscribeAccountViewModel model;

  const SubscribeAccountItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _accountInfo(),
          _accountCover(),
          _accountArticles()
        ],
      ),
    );
  }

  Widget _accountInfo() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(model.accountImgUrl),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                model.accountName,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff666666),
                ),
              )
            ],
          ),
          Text(
            model.publishTime,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff999999),
            ),
          )
        ],
      ),
    );
  }

  Widget _accountCover() {
    final article = model.articles[0];
    final shouldClip = model.articles.length <= 1;
    return ClipRRect(
      borderRadius: !shouldClip
          ? BorderRadius.circular(0)
          : BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Image.network(
            article.coverImgUrl,
            height: 150,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 100,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black54
                  ]
                )
              ),
              child: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _accountArticles() {
    final articles = model.articles.sublist(1);
    return ListView.separated(
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    articles[index].title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Image.network(
                  articles[index].coverImgUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index){
          return Container(
            height: 0.5,
            margin: EdgeInsets.symmetric(horizontal: 15),
            color: Color(0xffdddddd),
          );
        },
        itemCount: articles.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

    );
  }

}
