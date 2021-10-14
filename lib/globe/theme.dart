import 'package:flutter/material.dart';
import 'package:flutter_study_demo/globe/app_provider.dart';
import 'package:flutter_study_demo/globe/colors.dart';

class AppTheme {
  static getThemeData(AppProvider provider, bool isDark) {
    if (provider.darkMode == 2) {
      /// 跟随系统
      return _getThemeData(provider, isDark);
    } else if (provider.darkMode == 1) {
      /// 手动暗黑模式
      if (isDark) {
        return null;
      } else {
        return _getThemeData(provider, true);
      }
    } else {
      /// 手动白天模式
      if (isDark) {
        return null;
      } else {
        return _getThemeData(provider, false);
      }
    }
  }

  static ThemeData _getThemeData(AppProvider provider, bool isDark) {
    Color mainColor = (themeColorMap[provider.themeColor] ??
        const Color.fromRGBO(237, 67, 71, 1.0));

    ///下面这些颜色特性，可以在子组件里面重新设置而覆盖这里的设置，比方某个页面的导航栏颜色
    ///在APPBar里面重新设置backgroundColor就覆盖这里的全局设置

    return ThemeData(

        ///主色，决定导航栏颜色,如果是系统自带的颜色属性，可以使用primaryColor
        primaryColor: mainColor,

        ///但是有些颜色在primaryColor中是不适用的,推荐第二种方法primarySwatch
        primarySwatch: createMaterialColor(mainColor),

        ///Icon的默认样式
        iconTheme: const IconThemeData(
            size: 32.0, color: Color(0xFFFAFAFA), opacity: 1.0),

        ///导航栏按钮颜色
        primaryIconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),

        ///文字字体
        textTheme: TextTheme(
          ///比如：appbar标题、alert标题
          headline6: const TextStyle(color: Colors.white),

          ///比如：ListTile.title
          subtitle1: TextStyle(color: isDark ? Colors.white : Colors.black),
          subtitle2: const TextStyle(color: Colors.grey, fontSize: 12),

          ///页面主标题文字
          bodyText1: TextStyle(
              color: isDark ? const Color(0xffdddddd) : const Color(0xff2a2a2a),
              fontSize: 18, fontWeight: FontWeight.normal),

          bodyText2: TextStyle(
              color: isDark ? const Color(0xfff5f5f5) : const Color(0xff1a1a1a),
              fontSize: 15),

          ///[ElevatedButton], [TextButton] and [OutlinedButton]文字颜色
          button: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),

        ///设置状态栏模式
        brightness: isDark ? Brightness.dark : Brightness.light,

        ///页面背景色
        scaffoldBackgroundColor: isDark ? Colors.black : Colors.white,

        ///主要用于Material背景色
        canvasColor: isDark ? Colors.black : Colors.white,
        inputDecorationTheme: InputDecorationTheme(

            /// 输入框占位文字颜色
            hintStyle:
                TextStyle(color: isDark ? Colors.white70 : Colors.black12)),

        ///分割线样式
        dividerTheme: DividerThemeData(
            color: Colors.grey.shade400.withOpacity(0.3),
            space: 0.6,
            thickness: 0.6),
        backgroundColor: isDark ? Colors.black : Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: isDark ? const Color(0xff262626) : Colors.white,
            selectedItemColor: mainColor,
            unselectedItemColor:
                isDark ? const Color(0xfff5f5f5) : const Color(0xff222222),
            selectedLabelStyle: const TextStyle(fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            showSelectedLabels: true,
            showUnselectedLabels: true),
        appBarTheme: const AppBarTheme(

            ///这是整体设置，如果页面需要单独设置只需要在AppBar组件中设置即可
            brightness: Brightness.dark,
            centerTitle: true,
            textTheme: TextTheme(
              headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )));
  }
}
/**
    ThemeData({
    Brightness brightness, //深色还是浅色
    MaterialColor primarySwatch, //主题颜色样本，见下面介绍
    Color primaryColor, //主色，决定导航栏颜色
    Color accentColor, //次级色，决定大多数Widget的颜色，如进度条、开关等。
    Color cardColor, //卡片颜色
    Color dividerColor, //分割线颜色
    ButtonThemeData buttonTheme, //按钮主题
    Color cursorColor, //输入框光标颜色
    Color dialogBackgroundColor,//对话框背景颜色
    String fontFamily, //文字字体
    TextTheme textTheme,// 字体主题，包括标题、body等文字样式
    IconThemeData iconTheme, // Icon的默认样式
    TargetPlatform platform, //指定平台，应用特定平台控件风格
    ...
    })

 * */
