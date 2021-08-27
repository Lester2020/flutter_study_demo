import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlertDialogFile extends StatelessWidget {
  const MyAlertDialogFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("警告框组件"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              ///Material风格Dialog
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: const Text("提示"),
                      content: const Text("确定删除该文件吗？"),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: const Text("取消")),
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: const Text("确定"))
                      ],
                      ///阴影值
                      elevation: 10,
                      ///背景颜色
                      backgroundColor: Colors.white,
                      ///设置形状
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                    );
                  },
                ///点击空白处不关闭
                barrierDismissible: false,
              );
            },
            child: const Text("Material风格Dialog"),
          ),
          const SizedBox(height: 30),
          CupertinoButton(child: const Text("Cupertino风格Dialog"), onPressed: (){
            showCupertinoDialog(context: context, builder: (context){
              return CupertinoAlertDialog(
                title: const Text("提示"),
                content: const Text("确定删除吗？"),
                actions: [
                  CupertinoDialogAction(
                    child: const Text("取消"),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text("确定"),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            },
                ///showCupertinoDialog点击空白处是无法退出对话框的，
                ///而showDialog点击空白处默认退出对话框，
                ///barrierDismissible属性控制点击空白处的行为
              barrierDismissible: true,
            );
          }),
          const SizedBox(height: 30),
          ///如果你觉得系统提供的这2个风格的对话框不够个性，你可以试试SimpleDialog，用法和AlertDialog基本相同
          ElevatedButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return SimpleDialog(
                title: const Text("提示"),
                children: [
                  Container(
                    height: 80,
                    child: const Text("确认删除吗"),
                    alignment: Alignment.center,
                  ),
                  const Divider(height: 1),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop("cancel");
                  }, child: const Text("取消")),
                  const Divider(height: 1),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop("ok");
                  }, child: const Text("确定"))
                ],
              );
            });
          }, child: const Text("SimpleDialog")),
          const SizedBox(height: 20),
          ///Dialog可以定制任何对话框，只需将对话框的内容给child属性：
          ///这几个对话框组件用法基本一样，不同的地方仅仅是灵活性和使用简易程度的不要
          ///Dialog最灵活，但使用起来比AlertDialog复杂一些
          ///AlertDialog使用起来非常简单，但布局和基本样式都已经固定好，不如Dialog灵活
          ElevatedButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return Dialog(
                child: Container(
                  width: 200,
                  height: 300,
                  color: Colors.red,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text("Dialog警告框", style: TextStyle(color: Colors.white, fontSize: 20)),
                      Positioned(
                        left: 50,
                        top: 100,
                        height: 100,
                        child: TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: const Text("关闭")),
                      )
                    ],
                  ),
                ),
              );
            });
          }, child: const Text("Dialog"))
        ],
      ),
    );
  }
}
