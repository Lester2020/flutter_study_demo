import 'package:flutter/material.dart';

class CircleImageFile extends StatelessWidget {
  const CircleImageFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("圆形图片效果"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("BoxDecoration 圆角"),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage("images/head.jpeg"),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
          const SizedBox(height: 20),
          const Text("BoxDecoration 圆角对 child"),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset("images/head.jpeg", fit: BoxFit.cover, width: 50, height: 50),
            clipBehavior: Clip.antiAlias,
          ),
          const SizedBox(height: 20),
          const Text("ClipRRect 圆角对 child"),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("images/head.jpeg", fit: BoxFit.cover, width: 50, height: 50,),
          ),
          const SizedBox(height: 20),
          const Text("ClipOval实现"),
          SizedBox(
            width: 50,
            height: 50,
            child: ClipOval(
              child: Image.asset("images/head.jpeg", fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 20),
          const Text("CircleAvatar实现"),
          const SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundImage: AssetImage("images/head.jpeg"),
            ),
          ),
          const SizedBox(height: 20),
          const Text("PhysicalModel实现"),
          PhysicalModel(
            color: Colors.red,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(25),
            child: Image.network("http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg",
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          )
          
        ],
      ),
    );
  }
}
