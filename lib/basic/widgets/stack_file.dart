import 'package:flutter/material.dart';

class MyStackFile extends StatelessWidget {
  const MyStackFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("叠加布局组件"),
      ),

      //IndexedStack 是 Stack 的子类，Stack 是将所有的子组件叠加显示，而 IndexedStack 通过 index 只显示指定索引的子组件

      body: Center(
        child: Stack(
          //Stack 对未定位（不被 Positioned 包裹）子组件的对齐方式由 alignment 控制，默认左上角对齐，
          alignment: AlignmentDirectional.center,
          //Stack 对未定位（不被 Positioned 包裹）子组件的大小由 fit 参数决定，默认值是 StackFit.loose ，表示子组件自己决定，StackFit.expand 表示尽可能的大
          fit: StackFit.loose,
          //超出边界裁剪方式：默认是裁剪，none表示不裁剪
          clipBehavior: Clip.antiAlias,
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.red,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.green,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.orange,
            ),
            Positioned(
              left: 210,
              top: 250,
              width: 50,
              height: 50,
              child: Container(
                color: Colors.purple,
              ),
            ),
            Positioned(
              right: 210,
              bottom: 210,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
