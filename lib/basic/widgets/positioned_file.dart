import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPositionedFile extends StatelessWidget {
  const MyPositionedFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("绝对布局组件"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(15),
        child: Stack(
          children: [
            MaterialButton(
                onPressed: (){},
              child: const Text("MaterialButton"),
              color: Colors.blue,
            ),
            Positioned(
              left: 50,
              top: 150,
              child: CupertinoButton(
                onPressed: (){},
                child: const Text("CupertinoButton"),
                color: Colors.green,
              ),
            ),

            Positioned(
              left: MediaQuery.of(context).size.width/5,
              top: MediaQuery.of(context).size.width * 3 / 4,
              child: MaterialButton(
                onPressed: (){},
                color: Colors.red,
              ),
            ),

            Positioned(
              bottom: 100,
              right: 100,
              child: MaterialButton(
                color: Colors.orange,
                onPressed: (){},
              ),
            )
          ],
        ),
      ),
    );
  }
}
