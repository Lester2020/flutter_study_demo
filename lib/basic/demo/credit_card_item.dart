import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditCardItem extends StatelessWidget {
  const CreditCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.only(left: 20, top: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xfff17b68), Color(0xffe95f66)]
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 4,
            color: Color.fromARGB(20, 0, 0, 0)
          )
        ]
      ),
      child: Stack(
        children: [
          Positioned(
            right: -100,
            bottom: -100,
            child: Image.asset(
              "images/bank_zs.png",
              width: 250,
              height: 250,
              color: Colors.white10,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "images/bank_zs.png",
                        width: 36,
                        height: 36,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 15)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "招商银行",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        Text(
                          "储蓄卡",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(200, 255, 255, 255)
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 65, top: 20),
                  child: Text(
                      '6210  ****  ****  1426',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Farrington",
                      letterSpacing: 3,
                      color: Colors.white
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 65, top: 15),
                  child: Text(
                    "10/27",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
