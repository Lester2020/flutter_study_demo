import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    if(Theme.of(context).brightness == Brightness.dark){
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    return Scaffold(
      body: Column(
        children: [
          _navigationBar(context),
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          _bottomToolBar(context)
        ],
      ),
    );
  }

  _navigationBar(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Container(
      height: padding.top + 44,
      padding: EdgeInsets.only(top: padding.top, left: max(padding.left, 10), right: max(padding.right, 10)),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: Border(bottom: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 1.0
        ))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 26,
                color: Theme.of(context).textTheme.bodyText1?.color,
              )
          ),
          Expanded(
            child: Container(

            ),
          ),
          IconButton(onPressed: (){

          }, icon: Icon(
              Icons.search,
              size: 26,
            color: Theme.of(context).textTheme.bodyText1?.color,
          )
          ),
          SizedBox(width: 4),
          IconButton(onPressed: (){

          }, icon: Icon(
              Icons.more_horiz_rounded,
              size: 26,
            color: Theme.of(context).textTheme.bodyText1?.color,
          )
          )
        ],
      ),
    );
  }

  _bottomToolBar(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    Color? iconColor = Theme.of(context).textTheme?.bodyText1?.color?.withOpacity(0.7);
    return Container(
      height: padding.bottom + 50,
      padding: EdgeInsets.only(bottom: padding.bottom, left: max(padding.left, 10), right: max(padding.right, 10)),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1
          )
        )
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: (){},
              icon: Icon(
                  Icons.share,
                  size: 22,
                  color: iconColor
              )
          ),
          IconButton(onPressed: (){},
              icon: Icon(
                  Icons.thumb_up,
                  size: 22,
                  color: iconColor
              )
          ),
          IconButton(onPressed: (){},
              icon: Icon(
                  Icons.star,
                  size: 26,
                  color: iconColor
              )
          ),
          IconButton(onPressed: (){},
              icon: Icon(
                  Icons.comment,
                  size: 22,
                  color: iconColor
              )
          ),
          SizedBox(width: 5),
          Expanded(
            child: Container(
              height: 34,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(17)
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt,
                    color: iconColor,
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "写评论",
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 15
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
