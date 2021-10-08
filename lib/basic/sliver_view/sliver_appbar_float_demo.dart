import 'package:flutter/material.dart';

class SliverAppBarFloatDemo extends StatelessWidget {
  const SliverAppBarFloatDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 250,
            elevation: 5,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                  'SliverAppBar效果',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              background: Image.network(
                'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg@1280w_1l_2o_100sh.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate((context, index){
                bool isOdd = index % 2 == 1;
                return Container(
                  alignment: Alignment.center,
                  color: isOdd ? Colors.white : Color(0xffeaeaea),
                  child: Text(
                    index.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                    ),
                  ),
                );
              },
                childCount: 50
              ),
              itemExtent: 100
          )
        ],
      ),
    );
  }
}
