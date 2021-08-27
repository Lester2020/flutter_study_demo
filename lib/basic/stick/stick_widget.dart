import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/stick/stick_render.dart';

class StickWidget extends MultiChildRenderObjectWidget {
  ///顺序添加 stickHeader 和 stickContent
  StickWidget({
    Key? key,
    required stickHeader,
    required stickContent,
  }) : super(key: key,
    ///如果反过来，会有意想不到的效果哦
    children: [stickContent, stickHeader],
  );

  @override
  StickRender createRenderObject(BuildContext context) {
    ///传入 ScrollableState
    return StickRender(scrollable: Scrollable.of(context));
  }

  @override
  void updateRenderObject(BuildContext context, StickRender renderObject) {
    renderObject.scrollable = Scrollable.of(context);
  }
}
