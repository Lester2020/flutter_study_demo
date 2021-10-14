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
      padding: const EdgeInsets.all(8),
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
              const Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                model.accountName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff666666),
                ),
              )
            ],
          ),
          Text(
            model.publishTime,
            style: const TextStyle(
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
          : const BorderRadius.only(
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
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              alignment: Alignment.bottomLeft,
              decoration: const BoxDecoration(
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
                style: const TextStyle(
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
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
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
            margin: const EdgeInsets.symmetric(horizontal: 15),
            color: const Color(0xffdddddd),
          );
        },
        itemCount: articles.length,
      ///通常 ListView （GridView，PageView，CustomScrollView)都会尽可能的填充满 parent 组件给的空间大小.
      ///而 shrinkWrap: true 则是只满足自身大小。
      shrinkWrap: true,
      ///NeverScrollableScrollPhysics禁止滚动，不响应滚动事件
      physics: const NeverScrollableScrollPhysics(),

    );
  }

  /**
   * ScrollPhysics	释义
      BouncingScrollPhysics	允许滚动出边界，超过边界时会有回弹效果，会响应滚动事件
      ClampingScrollPhysics	不允许滚动出边界，会响应滚动事件
      AlwaysScrollableScrollPhysics	一直响应滚动事件
      NeverScrollableScrollPhysics	禁止滚动，不响应滚动事件
      FixedExtentScrollPhysics	ListWheelScrollView滚轮使用时，item都会停止在中间位置，不会停在分割线
      PageScrollPhysics	PageView滚轮使用时，item都会停止在一页，不会停止在分割线位置
      RangeMaintainingScrollPhysics	当内容突然改变尺寸时，试图将滚动位置保持在范围内的滚动物理
   *
   * */

}
