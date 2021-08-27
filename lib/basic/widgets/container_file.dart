import 'package:flutter/material.dart';

class MyContainerFile extends StatelessWidget {
  const MyContainerFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("装饰组件"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          //Container 是最常用的组件之一，它是单容器类组件，即仅能包含一个子组件，用于装饰和定位子组件，例如设置背景颜色、形状等。
          Container(
            child: const Text("Container"),
            color: Colors.cyan,
          ),
          const SizedBox(height: 20),
          //设置内间距和外边距
          Container(
            color: Colors.yellow,
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
              padding: const EdgeInsets.all(10),
              color: Colors.orange,
              child: const Text("间距设置"),
            ),
          ),
          const SizedBox(height: 20),
          //decoration 属性设置子组件的背景颜色、形状等。
          Container(
            child: const Text("lester是一个iOS开发者"),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.pink,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.green,
                width: 1
              )
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 60,
            // color: Colors.orange,
            //color与decoration.color不能同时设置
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            decoration: const BoxDecoration(
              color: Colors.blue,
              border: Border(
                bottom: BorderSide(color: Colors.red, width: 5),
              )
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"),
                fit: BoxFit.cover
              ),
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          const SizedBox(height: 20),
          //对齐方式
          //Alignment center = Alignment(0.0, 0.0);
          //Alignment topLeft、topRight....
          //通过 constraints 属性设置最大/小宽、高来确定大小，
          //如果不设置，默认最小宽高是0，最大宽高是无限大（double.infinity），约束width代码如下：
          Container(
            color: Colors.purple,
            child: const Text("这是一个container，是一个单容器组件"),
            alignment: Alignment.bottomRight,
            constraints: const BoxConstraints(
              minWidth: 30,
              maxWidth: 150,
              minHeight: 50,
              maxHeight: 100
            ),
          )
        ],
      ),
    );
  }
}
