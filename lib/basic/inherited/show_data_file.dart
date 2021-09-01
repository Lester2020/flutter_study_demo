import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/inherited/share_data_file.dart';

class ShowDataFile extends StatefulWidget {
  const ShowDataFile({Key? key}) : super(key: key);

  @override
  _ShowDataFileState createState() => _ShowDataFileState();
}

///InheritedWidget是Flutter中非常重要的一个功能型组件，它提供了一种数据在widget树中从上到下传递、共享的方式，
///比如我们在应用的根widget中通过InheritedWidget共享了一个数据，那么我们便可以在任意子widget中来获取该共享的数据！
///如Flutter SDK中正是通过InheritedWidget来共享应用主题（Theme）和Locale (当前语言环境)信息的
///InheritedWidget和逐级传递数据相比，它们能实现组件跨级传递数据

class _ShowDataFileState extends State<ShowDataFile> {
  @override
  Widget build(BuildContext context) {
    ///使用InheritedWidget中的共享数据
    return Text(
      ShareDataWidget.of(context)?.data.toString() ?? ""
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }

  /**

      一般来说，子widget很少会重写此方法，因为在依赖改变后framework也都会调用build()方法。
      但是，如果你需要在依赖改变后执行一些昂贵的操作，比如网络请求，
      这时最好的方式就是在此方法中执行，这样可以避免每次build()都执行这些昂贵操作

   * */

}
