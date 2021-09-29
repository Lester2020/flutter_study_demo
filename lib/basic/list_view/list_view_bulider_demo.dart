import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/list_view/mock_data.dart';
import 'package:flutter_study_demo/basic/list_view/subscribe_account_item.dart';

class ListViewBuilderDemo extends StatelessWidget {
  const ListViewBuilderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Builder用法'),
      ),
      body: Container(
        color: Color(0xffefefef),
        child: ListView.builder(
          itemCount: subscribeAccountList.length,
          itemBuilder: (context, index){
            return SubscribeAccountItem(model: subscribeAccountList[index]);
          },
        ),
      ),
    );
  }
}
