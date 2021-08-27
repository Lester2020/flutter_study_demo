import 'package:flutter/material.dart';
import 'package:flutter_study_demo/generated/l10n.dart';
import 'package:flutter_study_demo/globe/app_provider.dart';

class ThemeLanguagePage extends StatefulWidget {
  const ThemeLanguagePage({Key? key}) : super(key: key);

  @override
  _ThemeLanguagePageState createState() => _ThemeLanguagePageState();
}

class _ThemeLanguagePageState extends State<ThemeLanguagePage> {

  String _groupValue = AppProvider.instance.language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).changeLanguage),
      ),
      body: ListView(
        children: [
          RadioListTile(
            title: Text(S.of(context).simplifiedChinese),
            value: "zh",
            groupValue: _groupValue,
            onChanged: _changeValue,
          ),
          RadioListTile(
            value: "zh_TW",
            groupValue: _groupValue,
            onChanged: _changeValue,
            title: Text(S.of(context).traditionalChinese),
          ),
          RadioListTile(
              value: "en",
              groupValue: _groupValue,
              onChanged: _changeValue,
            title: Text(S.of(context).english),
          ),
        ],
      ),
    );
  }

  _changeValue(value) {
    if(value != null) {
      setState(() {
        _groupValue = value;
        ///下面刷新为局部刷新，现已经改成全局模式了
        // if(value == "zh"){
        //   S.load(Locale('zh', 'CN'));
        // } else if (value == "en"){
        //   S.load(Locale('en', 'US'));
        // }
        AppProvider.instance.setThemeLanguage(value);
      });
    }
  }
}
