import 'package:flutter/material.dart';
import 'package:flutter_study_demo/main/web_page.dart';
import 'package:flutter_study_demo/home/model/common_model.dart';

class SubNav extends StatelessWidget {

  final List<CommonModel> subNavList;
  const SubNav({Key? key, required this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //此处不要高度
      // height: 64,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (subNavList.isEmpty) return null;
    List<Widget> items = [];
    for (var model in subNavList) {
      items.add(_item(context, model));
    }

    int rowCount = (subNavList.length / 2 + 0.5).toInt();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0, rowCount),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(rowCount, subNavList.length),
        )
      ],
    );
  }

  Widget _item(BuildContext context, CommonModel model) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WebViewPage(url: model.url ?? "", statusBarColor: model.statusBarColor, hideAppBar: model.hideAppBar, title: model.title,))
          );
        },
        child: Column(
          children: [
            Image.network(model.icon ?? "", width: 18, height: 18),
            const SizedBox(height: 3),
            Text(model.title ?? "", style: const TextStyle(fontSize: 12))
          ],
        ),
      ),
    );
  }
}
