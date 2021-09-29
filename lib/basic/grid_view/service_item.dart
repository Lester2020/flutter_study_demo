import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/grid_view/service_item_model.dart';

class ServiceItem extends StatelessWidget {
  final ServiceItemViewModel model;
  const ServiceItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Expanded(
            child: model.icon,
          ),
          Text(
            model.title,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff333333),
            ),
          )
        ],
      ),
    );
  }
}
