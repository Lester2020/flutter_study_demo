import 'package:flutter/material.dart';

typedef KeyboardShowCallback = void Function(bool isKeyboardShowing);

/// 监听键盘弹出收起
class KeyboardDetector extends StatefulWidget {
  final KeyboardShowCallback? keyboardShowCallback;
  final Widget child;
  const KeyboardDetector({Key? key, this.keyboardShowCallback, required this.child}) : super(key: key);

  @override
  _KeyboardDetectorState createState() => _KeyboardDetectorState();
}

class _KeyboardDetectorState extends State<KeyboardDetector> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance?.addPersistentFrameCallback((_) {
      setState(() {
        widget.keyboardShowCallback?.call(MediaQuery.of(context).viewInsets.bottom > 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
