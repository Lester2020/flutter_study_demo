import 'package:flutter/material.dart';
import 'package:flutter_study_demo/main/web_page.dart';
import 'package:flutter_study_demo/home/model/common_model.dart';
import 'package:flutter_study_demo/home/model/sales_box_model.dart';


class SalesBox extends StatelessWidget {
  final SalesBoxModel? salesBoxModel;
  const SalesBox({Key? key, this.salesBoxModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: _items(context),
    );
  }

  _items(BuildContext context) {
    if (salesBoxModel == null) return null;
    List<Widget> items = [];

    items.add(_doubleItem(context, salesBoxModel!.bigCard1, salesBoxModel!.bigCard2, true, false));
    items.add(_doubleItem(context, salesBoxModel!.smallCard1, salesBoxModel!.smallCard2, false, false));
    items.add(_doubleItem(context, salesBoxModel!.smallCard3, salesBoxModel!.smallCard4, false, true));

    return Column(
      children: [
        Container(
          height: 44,
          margin: const EdgeInsets.only(left: 10),
          decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xfff2f2f2), width: 1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(salesBoxModel!.icon, height: 15, fit: BoxFit.fill),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 8, 1),
                margin: const EdgeInsets.only(right: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                        colors: [Color(0xffff4e63), Color(0xffff6cc9)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight
                    )
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WebViewPage(url: salesBoxModel!.moreUrl, title: "更多活动"))
                    );
                  },
                  child: const Text("获取更多福利 >", style: TextStyle(fontSize: 12, color: Colors.white)),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(0, 1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(1, 2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(2, 3),
        )
      ],
    );
  }

  Widget _doubleItem(BuildContext context, CommonModel leftModel, CommonModel rightModel, bool isBig, bool isLast) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _item(context, leftModel, isBig, true, false),
        _item(context, rightModel, isBig, false, true)
      ],
    );
  }

  Widget _item(BuildContext context, CommonModel model, bool isBig, bool isLeft, bool isLast) {
    BorderSide borderSide = const BorderSide(width: 0.8, color: Color(0xfff2f2f2));
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WebViewPage(url: model.url ?? "", statusBarColor: model.statusBarColor, hideAppBar: model.hideAppBar, title: model.title,))
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              right: isLeft ? borderSide : BorderSide.none,
              bottom: isLast ? BorderSide.none : borderSide
          ),

        ),
        child: Image.network(
          model.icon ?? "",
          width: MediaQuery.of(context).size.width / 2 - 10,//屏幕宽度一半,减去内边距和分割线
          height: isBig ? 129 : 80,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

