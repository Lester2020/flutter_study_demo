import 'package:flutter/material.dart';

class MyExpandedFile extends StatelessWidget {
  const MyExpandedFile({Key? key}) : super(key: key);

  final text = "这里的文字是动态的展示多行的数据，Expanded可以包裹左边的Text组件，右边的btn控制大小";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("权重布局组件"),
      ),
      body: Column(
        children: [
          //Expanded、Flexible 和 Spacer 都是具有权重属性的组件，可以控制 Row、Column、Flex 的子控件如何布局的组件。
          //同样Flexible也可以通过flex来设置子控件比例
          //Flexible中 fit 参数表示填满剩余空间的方式，说明如下：
          //tight：必须（强制）填满剩余空间。
          //loose：尽可能大的填满剩余空间，但是可以不填满。
          //Flexible中的默认就是loose样式，
          Row(
            //Row 中有3个子组件，两边的宽是100，中间的占满剩余的空间
            //下面例子：
            //Container 默认是适配子控件大小的，但当设置对齐方式时 Container 将会填满父组件，因此是否填满剩余空间取决于子组件是否需要填满父组件。
            //设置强制tight的效果与alignment的效果都是强制撑满中间间距
            children: [
              Container(
                width: 100,
                height: 50,
                color: Colors.pink,
              ),
              Flexible(
                // fit: FlexFit.tight,
                child: Container(
                  color: Colors.brown,
                  height: 50,
                  child: const Text("container"),
                  alignment: Alignment.center,
                ),
              ),
              Container(
                width: 100,
                height: 50,
                color: Colors.yellow,
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.orange,
                  height: 50,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  height: 50,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          //Expanded使用与类似与Column，Row，Flex等展示多个组件集合的组件，Expanded包含的组件可以占据剩余的空间。
          //多个子组件还可以设置flex来控制按比例分割屏幕空间
          //Expanded 继承字 Flexible，fit 参数固定为 FlexFit.tight，也就是说 Expanded 必须（强制）填满剩余空间。
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(text),
                ),
                const SizedBox(width: 10),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 60,
                  child: MaterialButton(
                    onPressed: (){},
                    color: Colors.grey,
                    child: const Text("订购"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 60,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 60,
                  color: Colors.green,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 60,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          //因为Row和Column都继承自Flex，参数基本相同，所以能使用Flex的地方一定可以使用Row或Column
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 80,
                  color: Colors.orange,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 100,
                  color: Colors.pink,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          //Spacer 的本质也是 Expanded 的实现的，和Expanded的区别是：
          //Expanded 可以设置子控件，而 Spacer 的子控件尺寸是0，
          //因此Spacer适用于撑开 Row、Column、Flex 的子控件的空隙，用法如下：
          Row(
            children: [
              Container(
                color: Colors.green,
                width: 100,
                height: 50,
              ),
              const Spacer(
                flex: 2,
              ),
              Container(
                color: Colors.yellow,
                width: 100,
                height: 50,
              ),
              const Spacer(),
              Container(
                color: Colors.red,
                width: 100,
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
/**
 * 三个权重组建总结如下：
    Spacer 是通过 Expanded 实现的，Expanded继承自Flexible。
    填满剩余空间直接使用Expanded更方便。
    Spacer 用于撑开 Row、Column、Flex 的子组件的空隙。
 *
 * */
