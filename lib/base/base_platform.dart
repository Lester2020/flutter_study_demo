import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/**
 * flutter命名规范：
 * UpperCamelCase：单词首字母大写的驼峰命名方式，例如 StudentName；
 * lowerCamelCase：第一个单词的首字母小写的驼峰命名方式，如 studentName;
 * lowercase_with_underscores：单词全部是小写字母，中间用 _ 连接，如 student_name。
 *
 * UpperCamelCase 命名方式一般用在类名、注解、枚举、typedef 和参数的类型上
 * lowerCamelCase 命名方式一般用在类成员、变量、方法名、参数命名等命名上
 * lowercase_with_underscores 命名方式一般用在命名库（libraries）、包（packages）、目录（directories）和源文件（source files）上
 *
 * */

/// 会根据平台，去适配所在平台的小部件,来源：https://blog.csdn.net/weixin_34999505/article/details/86893885
/// Flutter中包含了适用于IOS和Android的两套原生小部件，名为Cupertino和Material
abstract class BasePlatformWidget<A extends Widget, I extends Widget>
    extends StatelessWidget {

  const BasePlatformWidget({Key? key}) : super(key: key);

  A createAndroidWidget(BuildContext context);

  I createIosWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    /**如果是IOS平台，返回cupertino风格的控件
     * Android和其他平台都返回material风格的控件
     */
    if (Platform.isIOS) {
      return createIosWidget(context);
    }
    return createAndroidWidget(context);
  }
}

/// 初始入口
class PlatformApp extends BasePlatformWidget<MaterialApp, CupertinoApp> {
  final Widget? home;
  final Map<String, Widget Function(BuildContext)> routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final bool debugShowCheckedModeBanner = false;

  const PlatformApp({
    Key? key, this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute}) : super(key: key);

  @override
  MaterialApp createAndroidWidget(BuildContext context) {
    return MaterialApp(
      key: key,
      home: home,
      routes: routes,
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      theme: ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.dark
      ),
    );
  }

  @override
  CupertinoApp createIosWidget(BuildContext context) {
    return CupertinoApp(
      key: key,
      home: home,
      routes: routes,
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      theme: const CupertinoThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.dark
      ),
    );
  }

}

/// 脚手架
class PlatformScaffold
    extends BasePlatformWidget<Scaffold, CupertinoPageScaffold> {

  final PlatformAppBar appBar;
  final Widget body;

  const PlatformScaffold({Key? key, required this.appBar, required this.body}) : super(key: key);

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    return Scaffold(
      appBar: appBar.createAndroidWidget(context),
      body: body,
    );
  }

  @override
  CupertinoPageScaffold createIosWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: appBar.createIosWidget(context),
      child: body,
    );
  }
}

/// AppBar
class PlatformAppBar
    extends BasePlatformWidget<AppBar, CupertinoNavigationBar> {
  final Widget? title;
  final Widget? leading;
  final Widget? trailing;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Brightness? brightness;


  const PlatformAppBar({Key? key, this.title, this.leading, this.trailing, this.actions, this.backgroundColor, this.brightness}) : super(key: key);

  @override
  AppBar createAndroidWidget(BuildContext context) {
    return AppBar(leading: leading, title: title, actions: actions, backgroundColor: backgroundColor);
  }

  @override
  CupertinoNavigationBar createIosWidget(BuildContext context) {
    return CupertinoNavigationBar(leading: leading, middle: title, trailing: trailing, backgroundColor: backgroundColor, brightness: brightness,);
  }

}

/// 对话框
class PlatformAlertDialog
    extends BasePlatformWidget<AlertDialog, CupertinoAlertDialog> {

  final Widget? title;
  final Widget? content;
  final List<Widget> actions;

  const PlatformAlertDialog({Key? key, this.title, this.content,  this.actions = const <Widget>[]}) : super(key: key);

  @override
  AlertDialog createAndroidWidget(BuildContext context) {
    return AlertDialog(title: title, content: content, actions: actions,);
  }

  @override
  CupertinoAlertDialog createIosWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: title, content: content,  actions: actions,);
  }
}

/// Switch
class PlatformSwitch extends BasePlatformWidget<Switch, CupertinoSwitch> {

  final bool value;
  final ValueChanged<bool> onChanged;

  const PlatformSwitch({Key? key, this.value = false, required this.onChanged}) : super(key: key);

  @override
  Switch createAndroidWidget(BuildContext context) {
    return Switch(value: value, onChanged: onChanged);
  }

  @override
  CupertinoSwitch createIosWidget(BuildContext context) {
    return CupertinoSwitch(value: value, onChanged: onChanged);
  }
}

/// Button
class PlatformButton extends BasePlatformWidget<TextButton, CupertinoButton> {
  final VoidCallback onPressed;
  final Widget child;

  const PlatformButton({Key? key, required this.onPressed, required this.child}) : super(key: key);

  @override
  TextButton createAndroidWidget(BuildContext context) {
    return TextButton(onPressed: onPressed, child: child);
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    return CupertinoButton(child: child, onPressed: onPressed);
  }
}

//调试入口
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  bool androidSelected = false;
  bool iosSelected = false;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(widget.title), leading: null,

      ),
      body: SafeArea(child: Column(
        children: <Widget>[
          CupertinoButton(
              child:  const Text("显示ios风格的对话框"), onPressed: () {
            showDialog(context: context, builder: (context) {
              return CupertinoAlertDialog(
                title: const Text("title"),
                content: const Text("content"),
                actions:
                <Widget>[
                  CupertinoButton(onPressed: () {},
                      child: const Text("Cancel")),
                  CupertinoButton(onPressed: () {},
                      child: const Text("Confirm")),
                ]
                ,
              );
            });
          }),
          TextButton(child: const Text("显示android风格的对话框"), onPressed: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: const Text("title"),
                content: const Text("content"),
                actions:
                <Widget>[
                  TextButton(onPressed: () {},
                      child: const Text("Cancel")),
                  TextButton(onPressed: () {},
                      child: const Text("Confirm")),
                ]
                ,
              );
            });
          }),
//下面这段代码在ios平台运行会出错，在android平台可以运行，所以暂时注释掉，原因就是Switch需要有一个Material的祖先
//              new Switch(
//                value: androidSelected, onChanged: (value) {
//                setState(() {
//                  androidSelected = value;
//                });
//              },),
          CupertinoSwitch(value: iosSelected, onChanged: (value) {
            setState(() {
              iosSelected = value;
            });
          }),


        ],
      ),),
    );
  }
}


