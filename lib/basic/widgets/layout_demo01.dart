import 'package:flutter/material.dart';

class LayoutDemo1 extends StatelessWidget {
  const LayoutDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("布局demo1"),
      ),
      body: Column(
        children: const [
          _SettingItem(
            iconData: Icons.notifications,
            iconColor: Colors.blue,
            title: "消息中心",
            suffix: _NotificationsText(
              text: "2",
            ),
          ),
          Divider(),
          _SettingItem(
            iconData: Icons.thumb_up,
            iconColor: Colors.green,
            title: "我的点赞",
            suffix: _Suffix(
              text: "121篇",
            ),
          ),
          Divider(),
          _SettingItem(
            iconData: Icons.grade,
            iconColor: Colors.yellow,
            title: "我的收藏",
            suffix: _Suffix(
              text: "11个",
            ),
          ),
          Divider(),
          _SettingItem(
            iconData: Icons.account_balance_wallet,
            iconColor: Colors.orange,
            title: "我的钱包",
            suffix: _Suffix(
              text: "10万",
            ),
          ),
          Divider(),
          _SettingItem(
            iconData: Icons.local_offer,
            iconColor: Colors.red,
            title: "标签管理",
            suffix: _Suffix(
              text: "27个",
            ),
          ),
          Divider(),
          _SettingItem(
            iconData: Icons.shopping_basket,
            iconColor: Colors.pink,
            title: "已购商品",
            suffix: _Suffix(
              text: "100个",
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final IconData? iconData;
  final Color? iconColor;
  final String? title;
  final Widget? suffix;

  const _SettingItem(
      {Key? key, this.iconData, this.iconColor, this.title, this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Row(
        children: [
          Icon(iconData, color: iconColor),
          const SizedBox(width: 30),
          Expanded(
            child: Text(title ?? ""),
          ),
          suffix ?? Container(),
        ],
      ),
    );
  }
}

class _NotificationsText extends StatelessWidget {
  final String? text;

  const _NotificationsText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Colors.red
      ),
      child: Text(text??"", style: const TextStyle(color: Colors.white)),
    );
  }
}

class _Suffix extends StatelessWidget {
  final String? text;
  const _Suffix({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text??"",
      style: TextStyle(color: Colors.grey.withOpacity(0.5)),
    );
  }
}



