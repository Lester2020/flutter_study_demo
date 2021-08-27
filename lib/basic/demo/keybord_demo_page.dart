import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/demo/keyboard_detector.dart';

class KeyboardDemoPage extends StatefulWidget {
  const KeyboardDemoPage({Key? key}) : super(key: key);

  @override
  _KeyboardDemoPageState createState() => _KeyboardDemoPageState();
}

class _KeyboardDemoPageState extends State<KeyboardDemoPage> {
  bool isKeyboardShowing = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ///键盘监听必须嵌套在外层
    return KeyboardDetector(
      keyboardShowCallback: (show){
        setState(() {
          isKeyboardShowing = show;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("键盘弹起收起监听"),
        ),
        body: GestureDetector(
          ///透明可以触摸
          behavior: HitTestBehavior.translucent,
          onTap: (){
            /// 触摸收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text("昨夜西风凋碧树，独上高楼望尽天涯路；衣带渐宽终不悔，为伊消得人憔悴"),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0)
                          ),
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              hintText: "请输入内容",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 0)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 0)
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 0)
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(width: 0)
                              )
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isKeyboardShowing,
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.grey,
                            child: const Text("bottom bar"),
                            width: MediaQuery.of(context).size.width,
                            height: 44,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
