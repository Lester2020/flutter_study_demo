import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MyTextFile extends StatelessWidget {
  const MyTextFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("文本组件"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //字体粗细共有9个级别，为w100至w900，FontWeight.bold是w700
            const Text("普通文本", style: TextStyle(color: Colors.orange, fontSize: 16, fontWeight: FontWeight.bold)),
            //设置斜体
            const Text("斜体文本", style: TextStyle(fontStyle: FontStyle.italic)),
            //设置自定义的字体：
            // 首先下载字体库（比如中华字体库）
            // 将字体文件拷贝的项目中，一般目录是：assets/fonts/，assets和fonts都需要手动创建，此目录不是必须的，而是约定俗成，资源一般都放在assets目录下。
            // 配置pubspec.yaml：
            const Text("自定义字体", style: TextStyle(fontFamily: 'Canterbury', color: Colors.green)),
            const SizedBox(height: 15),
            //textAlign只是控制水平方向的对齐方式，值说明如下：
            // left：左对齐
            // right：右对齐
            // center：居中
            // justify：两端对齐，此属性中文存在bug（Flutter版本：1.17.3）也可以在官方issue中关注此问题
            // start：前端对齐，和TextDirection属性有关，如果设置TextDirection.ltr，则左对齐，设置TextDirection.rtl则右对齐。
            // end：末端对齐，和TextDirection属性有关，如果设置TextDirection.ltr，则右对齐，设置TextDirection.rtl则左对齐。
            //自动换行 :softWrap
            //溢出的处理方式：
            // clip：直接裁剪。
            // fade：越来越透明。
            // ellipsis：省略号结尾。
            // visible：依然显示，此时将会溢出父组件。
            Container(
              color: Colors.cyan,
              height: 80,
              width: 200,
              child: const Text("这是一个字体对齐、是否自动换行、溢出方式处理、最大行数等相关设置", textAlign: TextAlign.center, softWrap: true, overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 18, color: Colors.pink),),
            ),
            //富文本：
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: "登录即视为同意", style: TextStyle(fontSize: 15, color: Colors.black87)),
                  TextSpan(
                    text: "《用户隐私条款与服务协议》",
                    style: const TextStyle(color: Colors.blue, fontSize: 17),
                    recognizer: TapGestureRecognizer()..onTap = (){
                      print("点击隐私条款与协议");
                    }
                  )
                ]
              ),
            ),
            const SizedBox(height: 15),
            Text("这是一个带渐变色的文本组件",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = const LinearGradient(colors: [Colors.blue, Colors.purple]).createShader(const Rect.fromLTWH(0, 0, 200, 20))
              ),
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue
                      ),
                      child: const Text("判断题", style: TextStyle(color: Colors.white)),
                    )
                  ),
                  const TextSpan(text: "泡沫灭火器是否可以用于灭电火?", style: TextStyle(color: Colors.black))
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
