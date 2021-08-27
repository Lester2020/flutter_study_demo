import 'package:flutter/material.dart';

class MyPopupMenuFile extends StatelessWidget {
  const MyPopupMenuFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("弹出菜单组件"),
      ),
      body: Container(
        width: 50,
        height: 50,
        color: Colors.cyan,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        child: PopupMenuButton(
          ///设置其初始值
          initialValue: "语文",
          itemBuilder: (context){
            return <PopupMenuEntry<String>> [
              const PopupMenuItem(
                value: "语文",
                child: Text("语文"),
              ),
              const PopupMenuItem(
                value: "数学",
                child: Text("数学"),
              ),
              const PopupMenuItem(
                value: "英语",
                child: Text("英语"),
              ),
              const PopupMenuItem(
                value: "物理",
                child: Text("物理"),
              ),
              const PopupMenuItem(
                value: "化学",
                child: Text("化学"),
              ),
              ///菜单分割线,
              ///PopupMenuDivider默认高度为16，注意这个高度并不是分割线的高度，而是分割线控件的高度
              const PopupMenuDivider(),
              const PopupMenuItem(
                ///当此项选中后，此值将会通过onSelected返回
                value: "生物",
                ///文本样式
                textStyle: TextStyle(color: Colors.blue, fontSize: 20),
                ///子控件
                child: Text("生物"),
                ///此项是否可用
                enabled: true,
                ///此项的高度
                height: 80,
              ),
              const PopupMenuDivider(),
              ///CheckedPopupMenuItem是前面带是否选中的控件，本质就是一个ListTile
              const CheckedPopupMenuItem(
                value: "历史",
                checked: true,
                child: Text("历史"),
              ),
              const CheckedPopupMenuItem(
                value: "地理",
                checked: false,
                child: Text("地理"),
              )
            ];
          },
          onSelected: (value){

          },
          onCanceled: (){

          },
          ///长按时弹出的提示
          tooltip: "长按提示文字",
          ///阴影值
          elevation: 10,
          ///内边距
          padding: const EdgeInsets.all(5),
          ///弹出菜单的背景颜色
          color: Colors.orange,
          ///默认情况下，PopupMenuButton显示3个小圆点,我们可以对其设置文字，child组件将自动会被InkWell包裹
          // child: Text("data"),
          ///也可以设置其他图标
          icon: const Icon(Icons.add),
          ///设置弹出菜单边框
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.green,
              width: 2.0
            ),
            borderRadius: BorderRadius.circular(5)
          ),
          ///控制菜单弹出的位置
          offset: const Offset(0, 60),
        ),
      ),
    );
  }
}

/**
 * showMenu属性和PopupMenuButton基本一样，
 * 但使用showMenu需要我们指定位置，
 * 所以一般情况下，我们不会直接使用showMenu，而是使用PopupMenuButton，免去了计算位置的过程。
 *
 * */
