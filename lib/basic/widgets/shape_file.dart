import 'package:flutter/material.dart';

class MyShapeFile extends StatelessWidget {
  const MyShapeFile({Key? key}) : super(key: key);

  ///Flutter中很多组件都有一个叫做shape的属性，类型是ShapeBorder，比如Button类、Card等组件，
  ///shape表示控件的形状，系统已经为我们提供了很多形状，
  ///对于没有此属性的组件，可以使用 Clip 类组件进行裁减。

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("形变组件"),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        children: [
          ///斜角矩形边框,BeveledRectangleBorder
          MaterialButton(
            color: Colors.cyan,
            onPressed: (){},
            child: const Text("BeveledRectangleBorder"),
            shape: BeveledRectangleBorder(
              side: const BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: (){},
            color: Colors.blue,
            child: const Text("Border"),
            ///设置四个边形状Border.all(color: ...)
            shape: const Border(
              top: BorderSide(color: Colors.red, width: 2)
            ),
          ),
          const SizedBox(height: 10),
          ///CircleBorder
          Container(
            width: 100,
            height: 100,
            color: Colors.grey.withOpacity(0.5),
            child: MaterialButton(onPressed: (){},
              color: Colors.green,
              child: const Text("CircleBorder"),
              shape: const CircleBorder(
                  side: BorderSide(
                      color: Colors.red,
                      width: 2.0
                  )
              ),
            ),
          ),
          const SizedBox(height: 10),
          ///ContinuousRectangleBorder,
          ///连续的圆角矩形，直线和圆角平滑连续的过渡，和RoundedRectangleBorder相比，圆角效果会小一些。
          MaterialButton(onPressed: (){},
            color: Colors.yellow,
            child: const Text("ContinuousRectangleBorder"),
            shape: ContinuousRectangleBorder(
              side: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(onPressed: (){},
            color: Colors.cyan,
            child: const Text("RoundedRectangleBorder"),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          const SizedBox(height: 10),
          ///StadiumBorder,类似足球场的形状，两边圆形，中间矩形
          MaterialButton(onPressed: (){},
            color: Colors.green,
            child: const Text("StadiumBorder"),
            shape: const StadiumBorder(
              side: BorderSide(
                color: Colors.red,
                width: 2.0
              ),
            ),
          ),
          const SizedBox(height: 10),
          ///OutlineInputBorder,带外边框
          MaterialButton(onPressed: (){},
            color: Colors.yellow,
            child: const Text("OutlineInputBorder"),
            shape: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2.0
              ),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          ///UnderlineInputBorder,下划线边框
          const SizedBox(height: 10),
          ///ClipRect组件使用矩形裁剪子组件，通常情况下，
          ///ClipRect作用于CustomPaint 、 CustomSingleChildLayout 、 CustomMultiChildLayout 、 Align 、 Center 、 OverflowBox 、 SizedOverflowBox组件
          ///clipBehavior参数定义了裁剪的方式，只有子控件超出父控件的范围才有裁剪的说法
          ///none：不裁剪，系统默认值，如果子组件不超出边界，此值没有任何性能消耗
          ///hardEdge：裁剪但不应用抗锯齿，速度比none慢一点，但比其他方式快
          ///antiAlias：裁剪而且抗锯齿，此方式看起来更平滑，比antiAliasWithSaveLayer快，比hardEdge慢，通常用于处理圆形和弧形裁剪
          ///antiAliasWithSaveLayer：裁剪、抗锯齿而且有一个缓冲区，此方式很慢，用到的情况比较少
          ClipRect(
            child: Align(
              alignment: Alignment.center,
              heightFactor: 0.5,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Image.asset("images/head.jpeg", fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ///ClipRRect组件可以对子组件进行圆角裁剪，默认圆角半径为0，
          ///注意ClipRRect有2个R，不是上面介绍的ClipRect
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              width: 100,
              color: Colors.red,
              child: Image.asset("images/head.jpeg", fit: BoxFit.cover),
            ),
          ),
          ///ClipOval裁剪为椭圆形，椭圆形的大小为正切父组件，因此如果父组件为正方形，切出来是圆形，
          const SizedBox(height: 20),
          ClipOval(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("images/head.jpeg", fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 20),
          ///ClipPath组件根据路径进行裁剪，我们自定义裁剪路径也可以使用系统提供的
          ///shape参数是ShapeBorder类型，系统已经定义了很多形状:
          ///RoundedRectangleBorder：圆角矩形
          ///ContinuousRectangleBorder：直线和圆角平滑连续的过渡，和RoundedRectangleBorder相比，圆角效果会小一些。
          ///StadiumBorder：类似于足球场的形状，两端半圆。
          ///BeveledRectangleBorder：斜角矩形
          ///CircleBorder：圆形
          ClipPath.shape(
            shape: const StadiumBorder(),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("images/head.jpeg", fit: BoxFit.cover),
            )
          ),
          const SizedBox(height: 20),
          ///CustomClipper并不是一个组件，而是一个abstract(抽象)类，
          ///使用CustomClipper可以绘制出任何我们想要的形状，比如三角形
          ClipPath(
            clipper: TrianglePath(),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.cyan,
            ),
          )
        ],
      ),
    );
  }
}

class TrianglePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width/2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}