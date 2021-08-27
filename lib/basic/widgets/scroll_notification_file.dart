import 'package:flutter/material.dart';

class MyScrollNotification extends StatefulWidget {
  const MyScrollNotification({Key? key}) : super(key: key);

  @override
  _MyScrollNotificationState createState() => _MyScrollNotificationState();
}

class _MyScrollNotificationState extends State<MyScrollNotification> {

  final ScrollController _controller = ScrollController();
  bool isEnd = false;
  double offset = 0;
  String notify = "";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        offset = _controller.offset;
        isEnd = _controller.position.pixels == _controller.position.maxScrollExtent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("滚动监听"),
      ),
      body: NotificationListener(
        onNotification: (notification){
          String notify = "";
          if (notification is ScrollEndNotification) {
            notify = "ScrollEnd";
          } else if (notification is ScrollStartNotification) {
            notify = "ScrollStart";
          } else if (notification is UserScrollNotification) {
            notify = " UserScroll";
          } else if (notification is ScrollUpdateNotification) {
            notify = "ScrollUpdate";
          }
          setState(() {
            this.notify = notify;
          });
          return false;
        },
        child: ListView.separated(
          controller: _controller,
            itemBuilder: (context, index){
              return Container(
                height: 60,
                color: Colors.primaries[index%18],
                child: Text("第$index个"),
              );
            },
            separatorBuilder: (context, index){
              return const Divider();
            },
            itemCount: 100),
      ),
      persistentFooterButtons: [
        TextButton(onPressed: (){
          _controller.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear);
        }, child: Text("position: ${offset.floor()}")),
        TextButton(onPressed: (){}, child: Text(notify)),
        Visibility(
          visible: isEnd,
          child: TextButton(onPressed: (){}, child: const Text("到达底部")),
        )
      ],
    );
  }
}
