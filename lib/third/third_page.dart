import 'package:flutter/material.dart';
import 'package:flutter_study_demo/generated/l10n.dart';
import 'package:flutter_study_demo/globe/user_event.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).setting),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share))
        ],
        leading: IconButton(
            onPressed: (){
          ///发送消息打开抽屉菜单
              eventBus.fire(UserEvent("openDrawer"));
              
        }, icon: Icon(Icons.dashboard)),
      ),
      body: Center(
        child: Text("我的"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add),
      ),
    );
  }



}
