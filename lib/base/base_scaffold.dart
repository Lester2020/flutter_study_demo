import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'base_platform.dart';

class BaseScaffold extends StatelessWidget {
  final String titleStr;
  final Widget child;
  const BaseScaffold({Key? key, this.titleStr = " ", required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(titleStr, style: const TextStyle(color: Colors.white, fontSize: 17)),
        backgroundColor: const Color.fromRGBO(237, 67, 71, 1.0),
        brightness: Brightness.dark,
      ),
      body: child,
    );
  }
}