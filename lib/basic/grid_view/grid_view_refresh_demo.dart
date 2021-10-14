import 'package:flutter/material.dart';

class GridViewRefreshDemo extends StatefulWidget {
  const GridViewRefreshDemo({Key? key}) : super(key: key);

  @override
  _GridViewRefreshDemoState createState() => _GridViewRefreshDemoState();
}

class _GridViewRefreshDemoState extends State<GridViewRefreshDemo> {

  final ScrollController _controller = ScrollController();
  bool _isLoading = false;
  List _list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if(!_isLoading && _controller.position.pixels >= _controller.position.maxScrollExtent){
        setState(() {
          _isLoading = true;
          footerRefresh();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future headerRefresh() {
    return Future.delayed(Duration(seconds: 2), (){
      List temp = [];
      for(int i = 0; i < 20; i++){
        temp.add(i);
      }
      setState(() {
        _list = temp;
      });
    });
  }

  Future footerRefresh() {
    return Future.delayed(const Duration(seconds: 2), (){
      List temp = [];
      for(int i = _list.length; i < _list.length + 20; i++){
        temp.add(i);
      }
      setState(() {
        _isLoading = false;
        _list.addAll(temp);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView刷新练习'),
      ),
      body: RefreshIndicator(
        onRefresh: headerRefresh,
        child: GridView.builder(
          controller: _controller,
          padding: const EdgeInsets.all(10),
          itemCount: _list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index){
            return Container(
              color: Colors.primaries[index % 18],
              alignment: Alignment.center,
              child: Text(
                  _list[index].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}
