import 'package:flutter/material.dart';
import 'package:flutter_study_demo/generated/l10n.dart';
import 'package:flutter_study_demo/setting/theme_color_page.dart';
import 'package:flutter_study_demo/setting/theme_language_page.dart';
import 'package:flutter_study_demo/setting/theme_mode_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).setting),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ThemeColorPage())
                  );
                },
                child: Text(S.of(context).themeColor)
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ThemeModePage())
                  );
                },
                child: Text(S.of(context).changeDarkMode)
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ThemeLanguagePage())
                  );
                },
                child: Text(S.of(context).changeLanguage)
            )
          ],
        ),
      ),
    );
  }



}
