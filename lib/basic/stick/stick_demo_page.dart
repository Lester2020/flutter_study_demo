import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/stick/stick_widget.dart';

class StickDemoPage extends StatefulWidget {
  const StickDemoPage({Key? key}) : super(key: key);

  @override
  _StickDemoPageState createState() => _StickDemoPageState();
}

class _StickDemoPageState extends State<StickDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("section悬浮效果"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          return Container(
            height: 200,
            color: Colors.primaries[index % 18],
            child: StickWidget(
              ///header
              stickHeader: Container(
                height: 60,
                color: Colors.red,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: (){
                    print("头部");
                  },
                  child: Text("第$index个section"),
                ),
              ),
              stickContent: InkWell(
                onTap: (){
                  print("这是表内容");
                },
                child: Container(
                  color: Colors.pink,
                  height: 140,
                  child: Center(
                    child: Text("这是$index个内容区域", style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
