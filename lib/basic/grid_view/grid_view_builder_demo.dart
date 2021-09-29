import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/grid_view/mock_data.dart';
import 'package:flutter_study_demo/basic/grid_view/programme_item.dart';

class GridViewBuilderDemo extends StatelessWidget {
  const GridViewBuilderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Builder用法"),
      ),
      body: ListView(
        children: [
          renderHeader(),
          renderBody()
        ],
      ),
    );
  }

  Widget renderHeader(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '猜你喜欢',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff333333),
            ),
          ),
          Row(
            children: [
              Text(
                '更多',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff666666)
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 20,
                color: Color(0xff999999),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget renderBody() {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7
        ),
        itemBuilder: (context, index){
          return ProgrammeItem(model: programmeList[index]);
        },
      itemCount: programmeList.length,
    );
  }
}
