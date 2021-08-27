import 'package:flutter/material.dart';
import 'package:flutter_study_demo/generated/l10n.dart';
import 'package:flutter_study_demo/globe/app_provider.dart';
import 'package:flutter_study_demo/globe/colors.dart';

class ThemeColorPage extends StatelessWidget {
  const ThemeColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).themeColor),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            initiallyExpanded: true,
            leading: Image.asset("images/ic_theme.png", height: 30, width: 30),
            title: Row(
              children: [
                Text(
                  S.of(context).selectThemeColor,
                  style: TextStyle(color: themeColorMap[AppProvider.instance.themeColor]),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  color: themeColorMap[AppProvider.instance.themeColor],
                  height: 15,
                  width: 15,
                )
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 5,
                  children: _getItems(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _getItems() {
    List<Widget> lists = [];
    themeColorMap.forEach((key, value) {
      lists.add(_item(key, value));
    });
    return lists;
  }

  Widget _item(String colorKey, Color color) {
    return GestureDetector(
      onTap: (){
        AppProvider.instance.setThemeColor(colorKey);
      },
      child: Container(
        width: 50,
        height: 50,
        color: color,
      ),
    );
  }

}
