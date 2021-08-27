import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFieldFile extends StatefulWidget {
  const MyTextFieldFile({Key? key}) : super(key: key);

  @override
  _MyTextFieldFileState createState() => _MyTextFieldFileState();
}

class _MyTextFieldFileState extends State<MyTextFieldFile> {
  late TextEditingController _controller;
  late String _currentText = "";
  ///controller是输入框文本编辑的控制器，可以获取TextField的内容、设置TextField的内容

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: "初始默认文本",
    );
    _controller.addListener(() {
      ///监听输入框输入
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 在 Flutter 中有很多内置的 Controller
    /// 大部分内置控件都可以通过 Controller 设置和获取控件参数
    /// 比如 TextField 的 TextEditingController
    /// 比如 ListView  的 ScrollController
    return Scaffold(
      appBar: AppBar(
        title: const Text("输入框组件"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              icon: const Icon(Icons.person),
              labelText: "姓名",
              labelStyle: const TextStyle(color: Colors.red),
              helperText: "用户名长度为6-10个字母",
              helperStyle: const TextStyle(color: Colors.blue),
              helperMaxLines: 1,
              hintText: "请输入用户名",
              errorText: "用户名输入错误",
              errorStyle: const TextStyle(color: Colors.green),
              errorMaxLines: 1,
              errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.orange, width: 1)),
              prefixIcon: const Icon(Icons.people),
              suffixIcon: const Icon(Icons.clear),
              counterText: "${_currentText.length}/100"
            ),
            onChanged: (value){
              setState(() {
                _currentText = value;
              });
            },
          ),

          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            height: 60,
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0x30cccccc),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0x00ff000000)),
                  borderRadius: BorderRadius.circular(100),
                ),
                hintText: "QQ号/手机号/邮箱",
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x00000000)),
                  borderRadius: BorderRadius.all(Radius.circular(100))
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _controller,
            ///垂直方向的对齐方式
            textAlignVertical: TextAlignVertical.center,
            ///文本方向
            textDirection: TextDirection.ltr,
            ///长按时弹出的菜单，有copy、cut、paste、selectAll
            toolbarOptions: const ToolbarOptions(
              copy: true,
              cut: true,
              paste: true,
              selectAll: true
            ),
            /// cursor表示光标
            showCursor: true,
            cursorColor: Colors.red,
            cursorWidth: 2,
            cursorHeight: 30,
            cursorRadius: const Radius.circular(2),
            ///显示密码安全文本
            obscureText: true,
            ///inputFormatters可以限制用户输入的内容，比如只想让用户输入字符
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
            ],
            /// 内容发生变化时回调
            onChanged: (value){

            },
            /// 点击回车或者点击软键盘上的完成回调
            onSubmitted: (value){

            },
            /// 点击输入框时回调
            onTap: (){

            },
            /// 编辑完成回调
            onEditingComplete: (){

            },
            /// 最大输入长度
            maxLength: 20,
            /// 键盘样式
            keyboardType: TextInputType.emailAddress,
            /// 键盘主题
            keyboardAppearance: Brightness.dark,
            /// 回车按钮样式
            textInputAction: TextInputAction.send,
          )
        ],
      ),
    );
  }
}

/**
 * keyboardType参数控制软键盘的类型，说明如下：
    text：通用键盘。
    multiline：当TextField为多行时（maxLines设置大于1），右下角的为“换行” 按键。
    number：数字键盘。
    phone：手机键盘，比数字键盘多"*"和 "#"。
    datetime：在ios上和text一样，在android上出现数字键盘、":"和 "-"。
    emailAddress：邮箱键盘，有"@" 和 "."按键。
    url：url键盘，有"/" 和 "."按键。
    visiblePassword：既有字母又有数字的键盘。


    textInputAction参数控制软键盘右下角的按键，说明如下：
    none：android上显示返回键，ios不支持。
    unspecified：让操作系统自己决定哪个合适，一般情况下，android显示“完成”或者“返回”。
    done：android显示代表“完成”的按钮，ios显示“Done”（中文：完成）。
    go：android显示表达用户去向目的地的图标，比如向右的箭头，ios显示“Go”（中文：前往）。
    search：android显示表达搜索的按钮，ios显示"Search"（中文：搜索）。
    send：android显示表达发送意思的按钮，比如“纸飞机”按钮，ios显示"Send"（中文：发送）。
    next：android显示表达“前进”的按钮，比如“向右的箭头”,ios显示"Next"（中文：下一项）。
    previous：android显示表达“后退”的按钮，比如“向左的箭头”,ios不支持。
    continueAction：android 不支持，ios仅在ios9.0+显示"Continue"（中文：继续）。
    join：Android和ios显示"Join"（中文：加入）。
    route：android 不支持，ios显示"Route"（中文：路线）。
    emergencyCall：android 不支持，ios显示"Emergency Call"（中文：紧急电话）。
    newline：android显示表达“换行”的按钮，ios显示”换行“。

 *
 *
 * */