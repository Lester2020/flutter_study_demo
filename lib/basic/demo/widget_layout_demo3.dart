import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/demo/friend_circle_item.dart';
import 'friend_circle_model.dart';

final FriendCircleModel friendCircleData = FriendCircleModel(
  userName: '小石头',
  userImgUrl: 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1699287406,228622974&fm=26&gp=0.jpg',
  saying: '听说Flutter很🔥，我也来凑热闹，github上建了一个仓库，欢迎来撩~✌✌✌',
  pic: 'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg@1280w_1l_2o_100sh.jpg',
  publishTime: '2小时前',
  comments: [
    Comment(
        source: true,
        fromUser: '若海',
        toUser: '小石头',
        content: '性能如何？'
    ),
    Comment(
        source: false,
        fromUser: '小石头',
        toUser: '若海',
        content: '性能不错，但是开发体验感觉差一点。。。'
    ),
    Comment(
        source: false,
        fromUser: '若海',
        toUser: '小石头',
        content: '周末我也试试，嘻嘻~'
    ),
    Comment(
        source: true,
        fromUser: '大佬',
        toUser: '小石头',
        content: '卧槽，求求你别学了'
    ),
    Comment(
        source: true,
        fromUser: '产品',
        toUser: '小石头',
        content: '工作量不饱和啊你这是！'
    ),
    Comment(
        source: false,
        fromUser: '小石头',
        toUser: '大佬',
        content: '卧槽，大佬别闹，学不动了。。。'
    ),
    Comment(
        source: false,
        fromUser: '小石头',
        toUser: '产品',
        content: '不不不，你的需求都已经完成了~！'
    ),
  ],
);

class WidgetLayoutDemo3 extends StatelessWidget {
  const WidgetLayoutDemo3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局练习3'),
      ),
      body: ListView(
        children: [
          FriendCircleItem(model: friendCircleData),
          FriendCircleItem(model: friendCircleData),
        ],
      ),
    );
  }
}
