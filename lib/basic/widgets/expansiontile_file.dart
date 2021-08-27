import 'package:flutter/material.dart';

class MyExpansionTileFile extends StatelessWidget {
  const MyExpansionTileFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("闭合组件ExpansionTile"),
      ),
      body: ListView(
        children: _mainItems(),
      ),
    );
  }

  _mainItems() {
    List<Widget> lists = [];
    for(int i = 0; i < 20; i++){
      lists.add(_mainItem(i));
    }
    return lists;
  }

  Widget _mainItem(int index) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: ExpansionTile(
        title: Text("第$index个section", style: const TextStyle(fontSize: 18)),
        children: _subItems(index),
        ///默认是否展开
        initiallyExpanded: false,
        leading: const Icon(Icons.favorite),
      ),
    );
  }

  _subItems(int index) {
    List<Widget> lists = [];
    for(int i = 0; i < 10; i++){
      lists.add(ListTile(
        title: Text("这是$index个section-$i个row"),
        subtitle: const Text("子标题"),
      ));
    }
    return lists;
  }

}
