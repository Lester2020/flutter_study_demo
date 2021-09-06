import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_demo/globe/colors.dart';
import 'package:flutter_study_demo/globe/global.dart';
import 'package:flutter_study_demo/third/model/news_model.dart';

class NewsItem extends StatefulWidget {
  final NewsModel? model;
  const NewsItem({Key? key, required this.model}) : super(key: key);

  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      color: bodyColor,
      child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
              color: dividerColor,
              width: 0.5,
            )),
          ),
          child: _newsItems()),
    );
  }

  _newsItems(){
    if(widget.model == null){
      return null;
    }

    if(widget.model?.type == NewsType.singleImg){
      return _singleImgItem();
    }

    if(widget.model?.type == NewsType.multipleImg){
      return _multipleImgItem();
    }

    return _textNewsItem();
  }

  /// 文本单元格
  _textNewsItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleItem(),
        SizedBox(height: 4),
        _sourceItem()
      ],
    );
  }

  _titleItem() {
    return Text(
      widget.model?.title??"",
      style: TextStyle(
        fontSize: 18,
        color: mainTextColor,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  _sourceItem(){
    return Row(
      children: [
        _tag(),
        SizedBox(width: widget.model?.tagList != null ? 10 : 0),
        Text(
          widget.model?.source??"未知来源",
          style: TextStyle(
              fontSize: 12,
              color: subTextColor
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.model?.replyCountStr ?? "",
          style: TextStyle(
              fontSize: 12,
              color: subTextColor
          ),
        )
      ],
    );
  }

  _tag() {
    if(widget.model?.tagList != null){
      return Text(
        widget.model?.tagList?.first.text ?? "",
        style: TextStyle(
            fontSize: 12,
            color: themeColor
        ),
      );
    } else {
      return SizedBox(width: 0);
    }
  }

  /// 单图片单元格
  _singleImgItem(){
    return Container(
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleItem(),
                SizedBox(height: 4),
                _sourceItem()
              ],
            ),
          ),
          SizedBox(width: 8),
          _radiusImage(widget.model?.imgsrc ?? "")
        ],
      ),
    );
  }

  _radiusImage(String imgName) {
    return AspectRatio(
      aspectRatio: 1.35,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          imgName,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// 多图片单元格
  _multipleImgItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleItem(),
        Container(
          height: (Global.screenWidth - 30 - 10) / 3 / 1.35 + 12,
          padding: EdgeInsets.only(top: 6, bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _radiusImage(widget.model?.imgsrc ?? ""),
              _radiusImage(widget.model?.imgnewextra?.first.imgsrc ?? ""),
              _radiusImage(widget.model?.imgnewextra?.last.imgsrc ?? ""),
            ],
          ),
        ),
        _sourceItem()
      ],
    );
  }

}
