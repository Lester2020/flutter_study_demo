import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class MyMaterialMotionFile extends StatefulWidget {
  const MyMaterialMotionFile({Key? key}) : super(key: key);

  @override
  _MyMaterialMotionFileState createState() => _MyMaterialMotionFileState();
}

class _MyMaterialMotionFileState extends State<MyMaterialMotionFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: OpenContainer(
          transitionDuration: const Duration(seconds: 1),
          closedBuilder: (context, _){
            return Container(
              width: 300,
              height: 45,
              padding: const EdgeInsets.only(left: 5),
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.5))
              ),
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.search, color: Colors.black),
            );
          },
          openBuilder: (context, _){
            return const _DetailPage();
          },
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemBuilder: (context, index){
            return OpenContainer(
                closedBuilder: (BuildContext context, VoidCallback openContainer){
                  return Image.asset("images/head.jpeg", fit: BoxFit.cover);
                },
                openBuilder: (context, _){
                  return const _DetailPage();
                },
              transitionDuration: const Duration(seconds: 1),
            );
          },
        itemCount: 50,
        padding: const EdgeInsets.all(10),
      ),
      floatingActionButton: OpenContainer(
          closedBuilder: (context, _){
            return const SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: Icon(Icons.add, color: Colors.red),
              ),
            );
          },
          openBuilder: (context, _){
            return const _DetailPage();
          },
        closedColor: Colors.green,
        closedElevation: 6.0,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        transitionDuration: const Duration(seconds: 1),
      ),
    );
  }
}

class _DetailPage extends StatelessWidget {
  const _DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("详情页面"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset("images/head.jpeg", fit: BoxFit.cover),
      ),
    );
  }
}

/**
 *
 * 设置底部tabbar切换动画
 * body: PageTransitionSwitcher(
    duration: const Duration(milliseconds: 1500),
    reverse: false,
    transitionBuilder: (
    Widget child,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    ) {
    return SharedAxisTransition(
    child: child,
    animation: animation,
    transitionType: SharedAxisTransitionType.horizontal,
    secondaryAnimation: secondaryAnimation,
    );
    },
    child: _child,
    ),


    官方demo：
    @override
    Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text('Fade through')),
    body: PageTransitionSwitcher(
    transitionBuilder: (
    Widget child,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    ) {
    return FadeThroughTransition(
    animation: animation,
    secondaryAnimation: secondaryAnimation,
    child: child,
    );
    },
    child: pageList[pageIndex],
    ),
    bottomNavigationBar: BottomNavigationBar(
    currentIndex: pageIndex,
    onTap: (int newValue) {
    setState(() {
    pageIndex = newValue;
    });
    },
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.photo_library),
    title: Text('Albums'),
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.photo),
    title: Text('Photos'),
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.search),
    title: Text('Search'),
    ),
    ],
    ),
    );
    }

 *
 * */
