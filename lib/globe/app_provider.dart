import 'package:flutter/material.dart';
import 'package:flutter_study_demo/globe/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// app全局的状态管理类
class AppProvider with ChangeNotifier {

  static final AppProvider instance = AppProvider();

  /// 白天模式时的主题颜色
  String _themeColor = '';
  /// 深色模式 0: 关闭 1: 开启 2: 随系统
  int _darkMode = 0;
  /// 语言
  String _language = '';

  String get themeColor => _themeColor;
  int get darkMode => _darkMode;
  String get language => _language;

  Future initConfig() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _themeColor = prefs.getString(Constant.THEME_COLOR) ?? "default";
    _darkMode = prefs.getInt(Constant.THEME_MODE) ?? 0;
    _language = prefs.getString(Constant.LANGUAGE) ?? "zh";
    notifyListeners();
  }

  Future setThemeColor(String themeColor) async {
    _themeColor = themeColor;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constant.THEME_COLOR, themeColor);
    notifyListeners();
  }

  Future setThemeMode(int darkMode) async {
    _darkMode = darkMode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(Constant.THEME_MODE, darkMode);
    notifyListeners();
  }

  Future setThemeLanguage(String language) async {
    _language = language;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constant.LANGUAGE, language);
    notifyListeners();
  }
}

/**
    provider
    官方推荐的状态管理库，相比其他状态管理库使用起来比较方便。
    状态管理：通俗的讲，当我们想在多个页面（组件/Widget）之间共享状态（数据），
    或者一个页面（组件/Widget）中的多个子组件之间共享状态（数据），
    这个时候我们就可以用 Flutter 中的状态管理来管理统一的状态（数据），实现不同组件直接的传值和数据共享。
 * */