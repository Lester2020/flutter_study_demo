import 'package:flutter/material.dart';

class MyHeroFile extends StatefulWidget {
  const MyHeroFile({Key? key}) : super(key: key);

  @override
  _MyHeroFileState createState() => _MyHeroFileState();
}

class _MyHeroFileState extends State<MyHeroFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("过渡动画"),
      ),
      body: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20
      ),
        children: List.generate(30, (index) {
          return InkWell(
            child: Hero(
                tag: "$index",
                child: Container(
                  color: Colors.primaries[index % 18],
                )
            ),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                  return HeroDetailPage("$index");
                })
              );
            },
          );
        }),
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {

  final String tag;
  const HeroDetailPage(this.tag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("过渡动画详情"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Hero(
            tag: tag,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              color: Colors.primaries[int.parse(tag) % 18],
            )
        ),
      ),
    );
  }
}