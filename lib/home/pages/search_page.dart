import 'package:flutter/material.dart';
import 'package:flutter_study_demo/main/web_page.dart';
import 'package:flutter_study_demo/home/request/search_dao.dart';
import 'package:flutter_study_demo/home/widgets/search_bar.dart';

import '../model/search_model.dart';

const imageTypes = [
  "channelgroup",
  "channelgs",
  "channelplane",
  "channeltrain",
  "cruise",
  "district",
  "food",
  "hotel",
  "huodong",
  "shop",
  "sight",
  "ticket",
  "travelgroup"];

class SearchPage extends StatefulWidget {

  final bool hideLeft;
  final String searchUrl;
  final String? keyword;
  final String? hint;

  const SearchPage({Key? key, this.hideLeft = false, this.searchUrl = "https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=", this.keyword, this.hint}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel? searchModel;
  String? keyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appBar(),
          NotificationListener(
            onNotification: (notification){
              //监听滚动
              if(notification is UserScrollNotification) {
                FocusScopeNode currentNode = FocusScope.of(context);
                if(!currentNode.hasPrimaryFocus && currentNode.focusedChild != null) {
                  currentNode.focusedChild?.unfocus();
                }
              }
              return true;
            },
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: searchModel?.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index){
                      return _item(index);
                    },
                  ),
                )),
          )
        ],
      ),
    );
  }

  _onChanged(String text) {
    keyword = text;
    if(text.isEmpty) {
      setState(() {
        searchModel = null;
      });
      return;
    }

    String urlStr = widget.searchUrl + text;
    SearchDao.fetch(urlStr, text).then((SearchModel model){
      //屏蔽关键字不一致的渲染
      if(model.keyword == keyword) {
        setState(() {
          searchModel = model;
        });
      }

    }).catchError((error){
      // print(error);
    });

  }

  _appBar() {
    final EdgeInsets insets = MediaQuery.of(context).padding;
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x66000000), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          child: Container(
            height: 44.0 + insets.top,
            padding: EdgeInsets.only(top: insets.top),
            decoration: const BoxDecoration(color: Colors.white),
            child: SearchBar(
              searchType: SearchType.normal,
              hideLeft: widget.hideLeft,
              placeholder: widget.hint,
              defaultText: widget.keyword,
              onChanged: _onChanged,
              leftButtonClick: (){
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  _item(int index) {
    if(searchModel == null || searchModel?.data == null) {
      return null;
    }
    SearchItem item = searchModel!.data![index];
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            WebViewPage(url: item.url, title: "详情")
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.3)
            )
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(1),
              child: Image(
                width: 26,
                height: 26,
                image: AssetImage(_typeImage(item.type)),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 300,
                  child: _title(item),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: 300,
                  child: _subTitle(item),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String _typeImage(String? type) {
    if(type == null) return "images/type_travelgroup.png";
    String path = "travelgroup";
    for(final val in imageTypes) {
      if(type.contains(val)) {
        path = val;
        break;
      }
    }
    return "images/type_$path.png";
  }

  _title(SearchItem item) {
    if(searchModel?.keyword == null || searchModel!.keyword.isEmpty) return null;
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(item.word, searchModel!.keyword));
    spans.add(TextSpan(
        text: " " + (item.districtname ?? "") + " " + (item.zonename ?? ""),
        style: const TextStyle(fontSize: 16, color: Colors.grey)
    ));

    return RichText(text: TextSpan(children: spans));
  }

  _subTitle(SearchItem item) {
    return RichText(
      text: TextSpan(
          children: [
            TextSpan(
                text: item.price ?? "",
                style: const TextStyle(fontSize: 16, color: Colors.orange)
            ),
            TextSpan(
                text: " " + (item.star ?? ""),
                style: const TextStyle(fontSize: 12, color: Colors.grey)
            )
          ]
      ),
    );
  }

  //关键字高亮处理
  _keywordTextSpans(String? word, String keyword) {
    List<TextSpan> spans = [];
    if(word == null || word.isEmpty) {
      return spans;
    }
    //搜索关键字高亮忽略大小写
    String wordL = word.toLowerCase();
    String keywordL = keyword.toLowerCase();
    List<String> arr = wordL.split(keywordL);
    TextStyle normalStyle = const TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordStyle = const TextStyle(fontSize: 16, color: Colors.orange);

    //'wordwoc'.split('w') -> [, ord, oc]
    int preIndex = 0;
    for(int i = 0; i < arr.length; i++) {
      if(i != 0) {
        //搜索关键字高亮忽略大小写
        preIndex = wordL.indexOf(keywordL, preIndex);
        spans.add(TextSpan(
            text: word.substring(preIndex, preIndex + keyword.length),
            style: keywordStyle
        ));
      }

      String val = arr[i];
      if(val.isNotEmpty) {
        spans.add(TextSpan(text: val, style: normalStyle));
      }

      return spans;
    }

  }

}
