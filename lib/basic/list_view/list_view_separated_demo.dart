import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/list_view/friend_card_item.dart';
import 'package:flutter_study_demo/basic/list_view/mock_data.dart';

class ListViewSeparatedDemo extends StatelessWidget {
  const ListViewSeparatedDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Separated用法"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return FriendCardItem(model: friendList[index]);
          },
          separatorBuilder: (context, index){
            return Divider(
              height: 0.5,
              indent: 75,
              color: Color(0xffdddddd),
            );
          },
          itemCount: friendList.length
      ),
    );
  }
}
