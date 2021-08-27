import 'package:flutter/material.dart';

class MyRadioFile extends StatefulWidget {
  const MyRadioFile({Key? key}) : super(key: key);

  @override
  _MyRadioFileState createState() => _MyRadioFileState();
}

class _MyRadioFileState extends State<MyRadioFile> {

  var _radioGroupValue = "1";
  String _groupValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("单选组件"),
      ),
      body: Column(
        children: [
          ///Radio为单选控件,其本身没有State状态，当value的值和groupValue值相等时，Radio显示选中状态
          Row(
            children: [
              Radio(value: "1", groupValue: _radioGroupValue, onChanged: (value){
                setState(() {
                  _radioGroupValue = value as String;
                });
              }),
              Radio(value: "2", groupValue: _radioGroupValue, onChanged: (value){
                setState(() {
                  _radioGroupValue = value as String;
                });
              }),
              Radio(value: "3", groupValue: _radioGroupValue, onChanged: (value){
                setState(() {
                  _radioGroupValue = value as String;
                });
              },
                activeColor: Colors.red,
              )
            ],
          ),
          const SizedBox(height: 20),
          /// RadioListTile
          /// 通常情况下，需要在Radio控件的后面添加说明，用户需要知道自己选择的是什么，当然我们可以直接在Radio后面添加Text控件，
          /// 不过，Flutter已经为我们提供了相应的控件，就是RadioListTile，通过名字我们就知道这是一个Radio和ListTile 组合的控件
          Row(
            children: [
              Flexible(
                child: RadioListTile(
                  title: const Text("语文"),
                  value: "语文",
                  groupValue: _groupValue,
                  onChanged: (value){
                    setState(() {
                      _groupValue = value as String;
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile(value: "数学", groupValue: _groupValue, onChanged: (value){
                  setState(() {
                    _groupValue = value as String;
                  });
                },
                  title: const Text("数学"),
                ),
              ),
              Flexible(
                child: RadioListTile(
                  title: const Text("英语"),
                  value: "英语",
                  activeColor: Colors.green,
                  groupValue: _groupValue,
                  onChanged: (value){
                    setState(() {
                      _groupValue = value as String;
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

