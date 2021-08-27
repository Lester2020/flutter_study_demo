import 'package:flutter/material.dart';
import 'package:flutter_study_demo/generated/l10n.dart';
import 'package:flutter_study_demo/globe/app_provider.dart';

class ThemeModePage extends StatefulWidget {
  const ThemeModePage({Key? key}) : super(key: key);

  @override
  _ThemeModePageState createState() => _ThemeModePageState();
}

class _ThemeModePageState extends State<ThemeModePage> {

  int _modeValue = AppProvider.instance.darkMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).changeDarkMode),
      ),
      body: ListView(
        children: [
          RadioListTile(
              value: 0,
              groupValue: _modeValue,
              onChanged: (value){
                setState(() {
                  _modeValue = value as int;
                  AppProvider.instance.setThemeMode(_modeValue);
                });
              },
            title: Text(S.of(context).lightMode),
          ),
          RadioListTile(
            value: 1,
            groupValue: _modeValue,
            onChanged: (value){
              setState(() {
                _modeValue = value as int;
                AppProvider.instance.setThemeMode(_modeValue);
              });
            },
            title: Text(S.of(context).darkMode),
          ),
          RadioListTile(
            value: 2,
            groupValue: _modeValue,
            onChanged: (value){
              setState(() {
                _modeValue = value as int;
                AppProvider.instance.setThemeMode(_modeValue);
              });
            },
            title: Text(S.of(context).automatic),
          ),
        ],
      ),
    );
  }
}

