import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe1f5fe).withOpacity(1.0),
      body: Center(
        child: Image.asset("images/splash.png"),
      ),
    );
  }
}
