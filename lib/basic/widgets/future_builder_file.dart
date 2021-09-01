import 'package:flutter/material.dart';

class FutureBuilderFile extends StatefulWidget {
  const FutureBuilderFile({Key? key}) : super(key: key);

  @override
  _FutureBuilderFileState createState() => _FutureBuilderFileState();
}
///很多时候我们会依赖一些异步数据来动态更新UI，
///比如在打开一个页面时我们需要先从互联网上获取数据，在获取数据的过程中我们显示一个加载框，等获取到数据时我们再渲染页面
///当然，通过StatefulWidget我们完全可以实现上述这些功能。
///但由于在实际开发中依赖异步数据更新UI的这种场景非常常见，因此Flutter专门提供了FutureBuilder和StreamBuilder两个组件来快速实现这种功能

class _FutureBuilderFileState extends State<FutureBuilderFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("异步组件FutureBuilder"),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              ///请求已结束
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasError) {
                  ///请求失败，显示错误
                  return Text("error: ${snapshot.error}");
                } else {
                  return Text("contents:${snapshot.data}");
                }
              } else {
                ///请求未结束，显示loading
                return CircularProgressIndicator();
              }
            }
        ),
      ),
    );
  }

  /// ConnectionState.none 当前没有异步任务，比如[FutureBuilder]的[future]为null时
  /// waiting 异步任务处于等待状态
  /// done 异步任务已经终止.
  /// 注意，ConnectionState.active只在StreamBuilder中才会出现。

  Future<String> getData() async {
    return Future.delayed(Duration(seconds: 2), (){
      return "这是网络请求下来的数据";
    });
  }

  /// StreamBuilder
/// 和Future 不同的是，它可以接收多个异步操作的结果，它常用于会多次读取数据的异步任务场景，
/// 如网络内容下载、文件读写等。

}
