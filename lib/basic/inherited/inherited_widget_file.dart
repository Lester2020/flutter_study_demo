import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/inherited/share_data_file.dart';
import 'package:flutter_study_demo/basic/inherited/show_data_file.dart';

class InheritedWidgetFile extends StatefulWidget {
  const InheritedWidgetFile({Key? key}) : super(key: key);

  @override
  _InheritedWidgetFileState createState() => _InheritedWidgetFileState();
}

class _InheritedWidgetFileState extends State<InheritedWidgetFile> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("数据共享组件"),
      ),
      body: Center(
        child: ShareDataWidget(
            data: count,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                    padding: EdgeInsets.all(20),
                  child: ShowDataFile(),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    count++;
                  });
                }, child: const Text("增加一次"))
              ],
            )
        ),
      ),
    );
  }
}
