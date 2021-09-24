import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_demo/globe/colors.dart';
import 'package:flutter_study_demo/globe/global.dart';
import 'package:flutter_study_demo/third/model/news_model.dart';
import 'package:flutter_study_demo/third/widgets/news_detail_page.dart';

class NewsItem extends StatefulWidget {
  final NewsModel? model;
  const NewsItem({Key? key, required this.model}) : super(key: key);

  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return NewsDetailPage(docId: widget.model?.docid ?? "");
        }));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        color: Theme.of(context).backgroundColor,
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
      ),
    );
  }

  _newsItems(){
    if(widget.model == null){
      return null;
    }

    if(widget.model?.type == NewsType.video){
      return _videoNewsItem();
    }

    if(widget.model?.type == NewsType.singleImg){
      return _singleImgNewsItem();
    }

    if(widget.model?.type == NewsType.multipleImg){
      return _multipleImgNewsItem();
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
      widget.model?.title??"这是一条未知类型的新闻",
      style: Theme.of(context).textTheme.bodyText1,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  _sourceItem(){
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _tag(),
        SizedBox(width: widget.model?.tagList != null ? 10 : 0),
        Text(
          widget.model?.source??"未知来源",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        SizedBox(width: 10),
        Text(
          widget.model?.replyCountStr ?? "",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        ///撑满剩余空间
        Spacer(),
        _closeBtn(),
      ],
    );
  }

  _closeBtn() {
    if(widget.model?.tagList != null && widget.model?.tagList?.first.text == "置顶"){
      return SizedBox();
    } else {
      return InkWell(
        onTap: (){
          print("点击了");
        },
        child: Text(
          "×",
          style: TextStyle(
              fontSize: 17,
              color: Theme.of(context).textTheme.subtitle2?.color?.withOpacity(0.7)
          ),
        ),
      );
    }
  }

  _tag() {
    if(widget.model?.tagList != null){
      return Text(
        widget.model?.tagList?.first.text ?? "",
        style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).primaryColor
        ),
      );
    } else {
      return SizedBox(width: 0);
    }
  }

  /// 单图片单元格
  _singleImgNewsItem(){
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
          _radiusImage(widget.model?.imgsrc ?? "", 1.35)
        ],
      ),
    );
  }

  _radiusImage(String imgName, double ratio) {
    return AspectRatio(
      aspectRatio: ratio,
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
  _multipleImgNewsItem() {
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
              _radiusImage(widget.model?.imgsrc ?? "", 1.35),
              _radiusImage(widget.model?.imgnewextra?.first.imgsrc ?? "", 1.35),
              _radiusImage(widget.model?.imgnewextra?.last.imgsrc ?? "", 1.35),
            ],
          ),
        ),
        _sourceItem()
      ],
    );
  }

  _videoNewsItem(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleItem(),
        Container(
          padding: EdgeInsets.only(top: 6, bottom: 6),
          height: (Global.screenWidth - 30) / 1.6 + 12,
          child: Stack(
            alignment: Alignment.center,
            ///未定位widget占满Stack整个空间
            fit: StackFit.expand,
            children: [
              _radiusImage(widget.model?.videoinfo?.cover ?? "", 1.6),
              Center(
                child: Image.asset(
                  "images/player_pause_icon.png",
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
              Positioned(
                bottom: 3.5,
                right: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.model?.videoinfo?.playCount??"0次播放",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      widget.model?.videoinfo?.length??"00:00",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        _sourceItem()
      ],
    );
  }

}
