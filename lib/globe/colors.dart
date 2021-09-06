import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_study_demo/globe/app_provider.dart';

///调用的时候需要把hex改一下，比如#223344 needs change to 0xFF223344
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

/// 主背景颜色
Color get bodyColor {
  if(AppProvider.instance.darkMode == 1 || (AppProvider.instance.darkMode == 2 && ThemeMode.system == ThemeMode.dark)) {
    return Colors.black;
  } else {
    return Colors.white;
  }
}

/// 分割线颜色
Color get dividerColor {
  return Colors.grey.shade400.withOpacity(0.3);
}

/// 文本标题颜色
Color get mainTextColor {
  if(AppProvider.instance.darkMode == 1 || (AppProvider.instance.darkMode == 2 && ThemeMode.system == ThemeMode.dark)) {
    return Color(0xffdddddd);
  } else {
    return Color(0xff2a2a2a);
  }
}

/// 副标题颜色
Color get subTextColor {
  return Colors.grey;
}

/// 主题颜色
Color get themeColor {
  return themeColorMap[AppProvider.instance.themeColor] ?? Colors.red;
}

Map<String, Color> themeColorMap = {
  'default' : const Color.fromRGBO(237, 67, 71, 1.0),
  'gray': Colors.grey,
  'blue': Colors.blue,
  'blueAccent': Colors.blueAccent,
  'cyan': Colors.cyan,
  'deepPurple': Colors.purple,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'deepOrange': Colors.orange,
  'green': Colors.green,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'orange': Colors.orange,
  'purple': Colors.purple,
  'pink': Colors.pink,
  'red': Colors.red,
  'teal': Colors.teal,
  'black': Colors.black,
};

