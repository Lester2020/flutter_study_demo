import 'package:flutter/material.dart';

class LayoutDemo2 extends StatelessWidget {
  const LayoutDemo2({Key? key}) : super(key: key);

  _circleImage() {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage("images/head.jpeg"), fit: BoxFit.cover)
      ),
    );
  }

  _buildCenter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Lester Flutter", style: TextStyle(fontSize: 20)),
        Text("iOS，flutter", style: TextStyle(color: Colors.grey))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("布局demo2"),
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.5),
        alignment: Alignment.topCenter,
        child: Container(
          height: 100,
          color: Colors.white,
          margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              _circleImage(),
              const SizedBox(width: 20),
              Expanded(child: _buildCenter()),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14)
            ],
          ),
        ),
      ),
    );
  }
}
