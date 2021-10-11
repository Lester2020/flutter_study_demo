import 'dart:ui';
import 'package:flutter/material.dart';

class ShortVideoWidgetTopPage extends StatefulWidget {
  final Function onClose;
  const ShortVideoWidgetTopPage({Key? key, required this.onClose}) : super(key: key);

  @override
  _ShortVideoWidgetTopPageState createState() => _ShortVideoWidgetTopPageState();
}

class _ShortVideoWidgetTopPageState extends State<ShortVideoWidgetTopPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getLeftLayout(),
          const Expanded(child: SizedBox()),
          _getHead('images/star_1.jpeg', '6838', 0),
          const SizedBox(width: 2),
          _getHead('images/star_2.jpeg', '5678', 1),
          const SizedBox(width: 2),
          _getHead('images/star_3.jpeg', '5679', 2),
          const SizedBox(width: 5),
          Container(
            height: 30,
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(50),
              borderRadius: BorderRadius.circular(20)
            ),
            child: const Text(
              '5670',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white
              ),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Image.asset(
              'images/cross.webp',
              width: 22,
              height: 22,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
    );
  }

  _getLeftLayout() {
    double headerSize = 36;
    return Container(
      padding: const EdgeInsets.only(left: 1, right: 4),
      height: headerSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(headerSize),
        color: Colors.black.withAlpha(50)
      ),
      child: Row(
        children: [
          Container(
            width: headerSize,
            height: headerSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(headerSize/2),
              image: const DecorationImage(
                image: AssetImage('images/star_5.jpeg')
              )
            ),
          ),
          const SizedBox(width: 4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '彭于晏',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 1),
              Text(
                '88.8万个点赞',
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 9,
                ),
              )
            ],
          ),
          const SizedBox(width: 5),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 254, 43, 84),
              borderRadius: BorderRadius.circular(headerSize/2)
            ),
            child: const Text(
              '关注',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w500
              ),
            ),
          )
        ],
      ),
    );
  }

  _getHead(String img, String num, int index) {
    double headerSize = 30;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: headerSize,
          height: headerSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(headerSize/2),
            image: DecorationImage(image: AssetImage(img)),
            border: Border.fromBorderSide(BorderSide(
              color: Colors.black.withAlpha(100),
              width: 1
            ))
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: _getTopColor(index),
              borderRadius: BorderRadius.circular(headerSize)
            ),
            child: Text(
              num,
              style: const TextStyle(
                fontSize: 8,
                color: Colors.white
              ),
            ),
          ),
        )
      ],
    );
  }

  _getTopColor(int index) {
    if(index == 0) {
      return const Color.fromARGB(255, 255, 203, 72).withAlpha(200);
    } else if(index == 1) {
      return const Color.fromARGB(255, 182, 180, 181).withAlpha(200);
    }
    return const Color.fromARGB(255, 174, 146, 107).withAlpha(200);
  }
}
