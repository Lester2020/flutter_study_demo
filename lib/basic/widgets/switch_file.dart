import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySwitchFile extends StatefulWidget {
  const MySwitchFile({Key? key}) : super(key: key);

  @override
  _MySwitchFileState createState() => _MySwitchFileState();
}

class _MySwitchFileState extends State<MySwitchFile> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("开关组件"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Switch(value: _switchValue, onChanged: (value){
            setState(() {
              _switchValue = value;
            });
          },
            activeColor: Colors.red,
            activeTrackColor: Colors.green,
            inactiveTrackColor: Colors.cyan,
          ),
          const SizedBox(height: 20),
          /// SwitchListTile是Switch和ListTile组合控件
          SwitchListTile(value: _switchValue, onChanged: (value){
            setState(() {
              _switchValue = value;
            });
          },
            title: const Text("是否允许4G下载"),
          ),
          const SizedBox(height: 20),
          ///CupertinoSwitch是ios风格控件
          CupertinoSwitch(value: _switchValue, onChanged: (value){
            setState(() {
              _switchValue = value;
            });
          }),
          const SizedBox(height: 20),
          ///根据平台自适应风格
          SwitchListTile.adaptive(value: _switchValue, onChanged: (value){
            setState(() {
              _switchValue = value;
            });
          },
            title: const Text("主标题"),
            subtitle: const Text("子标题"),
            secondary: const Icon(Icons.message),
          )
        ],
      ),
    );
  }
}
