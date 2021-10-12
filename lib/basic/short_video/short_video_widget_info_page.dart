import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShortVideoWidgetInfoPage extends StatefulWidget {
  const ShortVideoWidgetInfoPage({Key? key}) : super(key: key);

  @override
  _ShortVideoWidgetInfoPageState createState() => _ShortVideoWidgetInfoPageState();
}

class _ShortVideoWidgetInfoPageState extends State<ShortVideoWidgetInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      margin: const EdgeInsets.only(left: 10),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: _getTimeRankLayout(),
          ),
          Positioned(
            right: 0,
            child: _getChannelLayout(),
          ),
          Positioned(
            right: 20,
            bottom: 0,
            child: _getAdLayout(),
          )
        ],
      ),
    );
  }

  _getTimeRankLayout() {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(50),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'images/tag_bg.webp',
            width: 18,
            height: 18,
            color: const Color.fromARGB(255, 255, 211, 18),
          ),
          Text(
            '小时榜',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withAlpha(150)
            ),
          )
        ],
      ),
    );
  }

  _getChannelLayout() {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 2, 10, 2),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(50),
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(20))
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'images/game_tag.webp',
            width: 18,
            height: 18,
          ),
          const SizedBox(width: 5),
          Text(
            '游戏频道',
            style: TextStyle(
              color: Colors.white.withAlpha(150),
              fontSize: 12
            ),
          ),
          const SizedBox(width: 5),
          Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: Colors.white.withAlpha(150),
          )
        ],
      ),
    );
  }

  _getAdLayout() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 10, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color.fromARGB(200, 192, 117, 118)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '热血航线集结',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
              Text(
                '开播看播拿大奖',
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.grey.shade400
                ),
              )
            ],
          ),
          Image.asset(
            'images/suolong.png',
            width: 30,
          )
        ],
      ),
    );
  }

}
