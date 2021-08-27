import 'package:flutter/material.dart';

class MyCheckBoxFile extends StatefulWidget {
  const MyCheckBoxFile({Key? key}) : super(key: key);

  @override
  _MyCheckBoxFileState createState() => _MyCheckBoxFileState();
}

class _MyCheckBoxFileState extends State<MyCheckBoxFile> {
  var _checkValue = false;
  bool _flag = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("复选组件"),
      ),
      body: Column(
        children: [
          Checkbox(value: _checkValue, onChanged: (value){
            setState(() {
              _checkValue = value!;
            });
          },
            activeColor: Colors.red,
            checkColor: Colors.green,
          ),
          const SizedBox(height: 20),
          ///通常情况下，我们不直接使用Checkbox，而是使用CheckboxListTile，因为我们需要Checkbox后面添加说明
          Container(
            ///CheckboxListTile默认是充满父组件的，因此需要Container限制其宽度，效果如下：
            width: 300,
            height: 100,
            padding: const EdgeInsets.all(15),
            child: CheckboxListTile(value: _flag, onChanged: (value){
              setState(() {
                _flag = value!;
              });
            },
            title: const Text("主标题"),
              subtitle: const Text("副标题"),
              selected: true,
              checkColor: Colors.orange,
              tileColor: Colors.purple,
              selectedTileColor: Colors.cyan,
              /// 勾选框位置
              /// leading：勾选框在开头位置。
              /// trailing：勾选框在结尾位置，
              /// platform：根据平台确定
              controlAffinity: ListTileControlAffinity.leading,
              secondary: const Icon(Icons.person, size: 30, color: Colors.yellow),
            ),
          )
        ],
      ),
    );
  }
}
