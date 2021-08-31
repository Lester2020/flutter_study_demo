import 'package:flutter/material.dart';
import 'package:flutter_study_demo/generated/l10n.dart';
import 'package:flutter_study_demo/third/draw_page.dart';

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
        leading: Builder(builder: (context){
          return IconButton(onPressed: (){
            ///打开抽屉菜单
            Scaffold.of(context).openDrawer();

          }, icon: Icon(Icons.dashboard));
        }),
      ),
      body: Center(
        child: Text("我的"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add),
      ),
      drawer: DrawPage(),
    );
  }



}
