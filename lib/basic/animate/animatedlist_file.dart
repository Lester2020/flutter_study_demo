import 'package:flutter/material.dart';

class MyAnimatedListFile extends StatefulWidget {
  const MyAnimatedListFile({Key? key}) : super(key: key);

  @override
  _MyAnimatedListFileState createState() => _MyAnimatedListFileState();
}

class _MyAnimatedListFileState extends State<MyAnimatedListFile> with SingleTickerProviderStateMixin {

  final List<int> _list = [0, 1];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _addItem() {
    final int _index = _list.length;
    _list.insert(_index, _index);
    _listKey.currentState?.insertItem(_index);
  }

  void _removeItem() {
    final int _index = _list.length - 1;
    var item = _list[_index].toString();
    _listKey.currentState?.removeItem(_index, (context, animation) {
      return _buildItem(context, item, animation);
    });
    _list.removeLast();
  }

  Widget _buildItem(BuildContext context, String item, Animation animation) {
    return SlideTransition(
      position: animation
          .drive(CurveTween(curve: Curves.linear))
          .drive(Tween<Offset>(begin: const Offset(1.0, 1.0), end: const Offset(0.0, 1.0))),
      child: Card(
        child: ListTile(
          title: Text(item),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表动画"),
      ),
      body: AnimatedList(
        itemBuilder: (context, index, animation){
          return _buildItem(context, _list[index].toString(), animation);
        },
        key: _listKey,
        initialItemCount: _list.length,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
              onPressed: () => _addItem(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () => _removeItem(),
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}

