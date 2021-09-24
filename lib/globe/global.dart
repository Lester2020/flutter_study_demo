import 'package:flutter/material.dart';
import 'dart:ui';

class Global {

  ///屏幕信息
  static MediaQueryData mediaQueryData = MediaQueryData.fromWindow(window);
  static double screenWidth = mediaQueryData.size.width;
  static double screenHeight = mediaQueryData.size.height;
  static double paddingTop = mediaQueryData.padding.top;
  static double paddingBottom = mediaQueryData.padding.bottom;
  static bool isLandscape = (mediaQueryData.orientation == Orientation.landscape);

  ///判断跟随系统模式当前是不是暗黑模式
  static bool isDarkMode = (window.platformBrightness == Brightness.dark) ? true : false;
}