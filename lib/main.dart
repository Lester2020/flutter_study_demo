import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_study_demo/generated/l10n.dart';
import 'package:flutter_study_demo/globe/app_provider.dart';
import 'package:flutter_study_demo/globe/theme.dart';
import 'package:flutter_study_demo/main/tabs_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ///隐藏顶部和底部状态栏等
  ///stable版本
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
  ///master版本
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    AppProvider.instance.initConfig();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider.instance)
      ],
      child: Consumer<AppProvider>(
        builder: (context, model, child) {
          return MaterialApp(
            home: const TabsPage(),
            theme: AppTheme.getThemeData(model, false),
            darkTheme: AppTheme.getThemeData(model, true),
            debugShowCheckedModeBanner: false,

            ///设置国际化
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            ///当前语言
            locale: _getLocale(model.language),
          );
        },
      ),
    );
  }

  Locale _getLocale(String language){
    switch(language){
      case "zh_TW":
        return Locale("zh", "TW");
      case "en":
        return Locale("en", "US");
      default:
        return Locale("zh", "CN");
    }
  }
}
