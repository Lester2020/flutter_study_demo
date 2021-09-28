import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/demo/credit_card_item.dart';

class CreditCardDemo extends StatelessWidget {
  const CreditCardDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局练习2"),
      ),
      body: ListView(
        children: [
          CreditCardItem(),
          CreditCardItem(),
          CreditCardItem(),
        ],
      ),
    );
  }
}
