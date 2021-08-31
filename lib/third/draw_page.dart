import 'package:flutter/material.dart';
import 'package:flutter_study_demo/generated/l10n.dart';
import 'package:flutter_study_demo/third/setting_page.dart';

class DrawPage extends StatelessWidget {
  const DrawPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          ///移除抽屉菜单顶部默认留白间距
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 38.0),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipOval(
                        child: Image.asset("images/head.jpeg", width: 80, height: 80, fit: BoxFit.cover,),
                      ),
                    ),
                    Text(
                      "Lester",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.account_balance_wallet),
                      title: Text(S.of(context).account),
                    ),
                    Divider(),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingPage()));
                      },
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text(S.of(context).setting),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
