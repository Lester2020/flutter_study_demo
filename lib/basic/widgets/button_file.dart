import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyButtonFile extends StatefulWidget {
  const MyButtonFile({Key? key}) : super(key: key);

  @override
  _ButtonFileState createState() => _ButtonFileState();
}

enum ButtonStatus { none, loading, done }

class _ButtonFileState extends State<MyButtonFile> {
  late ButtonStatus _buttonStatus = ButtonStatus.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("按钮组件"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //ElevatedButton：Material风格”凸起“的按钮
            ElevatedButton(
                child: const Text("这是ElevatedButton"),
              onPressed: (){
                  print("onPressed");
              },
              onLongPress: (){
                  print("onLongPress");
              },
              //设置按钮样式
              style: ButtonStyle(
                //字体样式
                textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.red, fontSize: 20)),
                //背景颜色
                backgroundColor: MaterialStateProperty.all(Colors.green),
                //阴影效果
                elevation: MaterialStateProperty.all(20),
                //阴影颜色
                shadowColor: MaterialStateProperty.all(Colors.red),
                //高亮颜色
                overlayColor: MaterialStateProperty.all(Colors.pink),
                //字体颜色
                foregroundColor: MaterialStateProperty.all(Colors.brown),
                //设置圆角、边框样式
                shape: MaterialStateProperty.all(BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
              ),
            ),
            const SizedBox(height: 15),
            //TextButton：扁平的按钮
            TextButton(onPressed: (){},
                child: const Text("TextButton"),
            ),
            const SizedBox(height: 15),
            //OutlineButton：带边框的按钮
            OutlinedButton(onPressed: (){}, child: const Text("OutlinedButton")),
            const SizedBox(height: 15),
            //图标按钮
            IconButton(onPressed: (){}, icon: const Icon(Icons.build_circle)),
            const SizedBox(height: 15),
            //ios风格按钮
            CupertinoButton(child: const Text("iOS风格CupertinoButton按钮"), onPressed: (){}),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              print("点击了自定义按钮");
            }, child: Container(
              width: 150,
              height: 50,
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Image.asset("images/type_food.png", width: 32, height: 32, fit: BoxFit.cover),
                  const Text("自定义按钮", style: TextStyle(fontSize: 20, color: Colors.orange))
                ],
              ),
            ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),

            const SizedBox(height: 20),
            MaterialButton(
              color: Colors.blue,
              minWidth: 240,
              height: 60,
              onPressed: (){
                setState(() {
                  _buttonStatus = ButtonStatus.loading;
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      _buttonStatus = ButtonStatus.done;
                    });
                  });
                });
              },
              child: _buildChild(),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context);
      },
        child: const Text("返回"),
        backgroundColor: Colors.pink,
        elevation: 10,
        highlightElevation: 15,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _buildChild() {
    if(_buttonStatus == ButtonStatus.none){
      return const Text(
          "登录",
        style: TextStyle(fontSize: 16, color: Colors.white),
      );
    } else if(_buttonStatus == ButtonStatus.loading) {
      return const CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2.0,
      );

    } else if(_buttonStatus == ButtonStatus.done) {
      return const Icon(Icons.check, color: Colors.white,);
    }

    return null;
  }

}
