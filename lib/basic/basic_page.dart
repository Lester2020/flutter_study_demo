import 'package:flutter/material.dart';
import 'package:flutter_study_demo/basic/animate/animate_widget_file.dart';
import 'package:flutter_study_demo/basic/animate/animatedlist_file.dart';
import 'package:flutter_study_demo/basic/animate/animation_demo_file.dart';
import 'package:flutter_study_demo/basic/animate/animationcontroller_file.dart';
import 'package:flutter_study_demo/basic/animate/curve_file.dart';
import 'package:flutter_study_demo/basic/animate/hero_animate_file.dart';
import 'package:flutter_study_demo/basic/animate/material_motion_file.dart';
import 'package:flutter_study_demo/basic/animate/tween_file.dart';
import 'package:flutter_study_demo/basic/animate/tween_sequence_file.dart';
import 'package:flutter_study_demo/basic/demo/animation_container_demo_page.dart';
import 'package:flutter_study_demo/basic/demo/blur_demo_page.dart';
import 'package:flutter_study_demo/basic/demo/keybord_demo_page.dart';
import 'package:flutter_study_demo/basic/demo/transform_demo_page.dart';
import 'package:flutter_study_demo/basic/stick/stick_demo_page.dart';
import 'package:flutter_study_demo/basic/widgets/alert_dialog_file.dart';
import 'package:flutter_study_demo/basic/widgets/aspectratio_file.dart';
import 'package:flutter_study_demo/basic/widgets/button_file.dart';
import 'package:flutter_study_demo/basic/widgets/checkbox_file.dart';
import 'package:flutter_study_demo/basic/widgets/circle_image_file.dart';
import 'package:flutter_study_demo/basic/widgets/column_file.dart';
import 'package:flutter_study_demo/basic/widgets/container_file.dart';
import 'package:flutter_study_demo/basic/widgets/datatable_file.dart';
import 'package:flutter_study_demo/basic/widgets/date_picker_file.dart';
import 'package:flutter_study_demo/basic/widgets/draggable_file.dart';
import 'package:flutter_study_demo/basic/widgets/expanded_file.dart';
import 'package:flutter_study_demo/basic/widgets/expansiontile_file.dart';
import 'package:flutter_study_demo/basic/widgets/fractionallysizedbox_file.dart';
import 'package:flutter_study_demo/basic/widgets/gesturedetector_file.dart';
import 'package:flutter_study_demo/basic/widgets/gridview_file.dart';
import 'package:flutter_study_demo/basic/widgets/image_demo.dart';
import 'package:flutter_study_demo/basic/widgets/image_file.dart';
import 'package:flutter_study_demo/basic/widgets/indicator_file.dart';
import 'package:flutter_study_demo/basic/widgets/inkwell_file.dart';
import 'package:flutter_study_demo/basic/widgets/interactiveviewer.dart';
import 'package:flutter_study_demo/basic/widgets/layout_demo01.dart';
import 'package:flutter_study_demo/basic/widgets/layout_demo02.dart';
import 'package:flutter_study_demo/basic/widgets/listview_file.dart';
import 'package:flutter_study_demo/basic/widgets/nestedscrollview_file.dart';
import 'package:flutter_study_demo/basic/widgets/pageview_demo.dart';
import 'package:flutter_study_demo/basic/widgets/pageview_file.dart';
import 'package:flutter_study_demo/basic/widgets/popup_menu_file.dart';
import 'package:flutter_study_demo/basic/widgets/positioned_file.dart';
import 'package:flutter_study_demo/basic/widgets/radio_file.dart';
import 'package:flutter_study_demo/basic/widgets/row_file.dart';
import 'package:flutter_study_demo/basic/widgets/scroll_notification_file.dart';
import 'package:flutter_study_demo/basic/widgets/shape_file.dart';
import 'package:flutter_study_demo/basic/widgets/singlechildscrollview.dart';
import 'package:flutter_study_demo/basic/widgets/sizebox_file.dart';
import 'package:flutter_study_demo/basic/widgets/slider_file.dart';
import 'package:flutter_study_demo/basic/widgets/sliver_view_file.dart';
import 'package:flutter_study_demo/basic/widgets/sliverappbar_file.dart';
import 'package:flutter_study_demo/basic/widgets/sliverpersistentheader_file.dart';
import 'package:flutter_study_demo/basic/widgets/slivertoboxadapter_file.dart';
import 'package:flutter_study_demo/basic/widgets/stack_file.dart';
import 'package:flutter_study_demo/basic/widgets/switch_file.dart';
import 'package:flutter_study_demo/basic/widgets/text_file.dart';
import 'package:flutter_study_demo/basic/widgets/textfield_file.dart';
import 'package:flutter_study_demo/basic/widgets/timepicker_file.dart';
import 'package:flutter_study_demo/basic/widgets/wrap_file.dart';

class BasicPage extends StatelessWidget {
  const BasicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter基础"),
        backgroundColor: const Color.fromRGBO(237, 67, 71, 1.0),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: itemRouters.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => itemRouters.values.toList()[index])
                );
              },
              child: Card(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                  child: Text(itemRouters.keys.toList()[index]),
                ),
              ),
            );
          },
        ),
      )
    );
  }

}

Map<String, Widget> itemRouters = {
  "文本组件-Text" : const MyTextFile(),
  "按钮组件-Button" : const MyButtonFile(),
  "布局组件-Row" : const MyRowFile(),
  "布局组件-Column" : const MyColumnFile(),
  "布局组件-Stack" : const MyStackFile(),
  "布局组件-Positioned" : const MyPositionedFile(),
  "布局组件-Wrap" : const MyWrapFile(),
  "权重布局组件-Expanded&Flexible&Spacer" : const MyExpandedFile(),
  "布局demo1" : const LayoutDemo1(),
  "装饰组件-Container" : const MyContainerFile(),
  "固定宽高组件-SizeBox" : const MySizeBoxFile(),
  "宽高比组件-AspectRatio" : const MyAspectRatioFile(),
  "相对父组件尺寸-FractionallySizedBox" : const MyFractionallySizedBoxFile(),
  "布局demo2" : const LayoutDemo2(),
  "输入框组件-TextField" : const MyTextFieldFile(),
  "单选组件-Radio" : const MyRadioFile(),
  "复选组件-CheckBox" : const MyCheckBoxFile(),
  "滑块组件-Slider" : const MySliderFile(),
  "开关组件-Switch" : const MySwitchFile(),
  "进度组件-Indicator" : const MyIndicatorFile(),
  "图片组件-Image" : const MyImageFile(),
  "图片demo" : const ImageDemo(),
  "图片圆角" : const CircleImageFile(),
  "滚动组件-ListView" : const MyListViewFile(),
  "滚动组件-GridView" : const MyGridViewFile(),
  "滚动组件-SingleChildScrollView" : const MySingleChildScrollView(),
  "滚动组件-PageView" : const MyPageViewFile(),
  "表格组件-DataTable" : const MyDataTableFile(),
  "闭合组件-ExpansionTile" : const MyExpansionTileFile(),
  "PageViewDemo" : const MyPageViewDemo(),
  "滚动监听-ScrollNotification" : const MyScrollNotification(),
  "手势识别组件-GestureDetector" : const MyGestureDetectorFile(),
  "手势识别组件-InkWell" : const MyInkWellFile(),
  "滚动组件-SliverList&SliverGrid" : const MySliverViewFile(),
  "滚动组件-SliverAppBar" : const MySliverAppBarFile(),
  "滚动组件-SliverPersistentHeader" : const MySliverPersistentHeader(),
  "滚动组件-SliverToBoxAdapter" : const MySliverToBoxAdapter(),
  "滚动组件-NestedScrollView" : const MyNestedScrollView(),
  "日期组件-DatePicker" : const MyDatePickerFile(),
  "时间组件-TimePicker" : const MyTimePickerFile(),
  "菜单组件-PopupMenu" : const MyPopupMenuFile(),
  "警告框组件-AlertDialog" : const MyAlertDialogFile(),
  "形状组件-Shape" : const MyShapeFile(),
  "拖拽组件-Draggable" : const MyDraggableFile(),
  "缩放平移组件-InteractiveViewer" : const MyInteractiveViewer(),
  "核心动画-AnimationController" : const MyAnimationController(),
  "核心动画-Tween" : const MyTweenFile(),
  "核心动画-Curve" : const MyCurveFile(),
  "核心动画demo" : const MyAnimationControllerDemo(),
  "动画序列-TweenSequence" : const MyTweenSequenceFile(),
  "系统动画组件" : const MyAnimateWidgetFile(),
  "列表动画-AnimatedList" : const MyAnimatedListFile(),
  "过渡动画组件-Hero" : const MyHeroFile(),
  "系统动画插件—Animations" : const MyMaterialMotionFile(),
  "表头悬浮效果" : const StickDemoPage(),
  "偏移设置" : const TransformDemoPage(),
  "键盘弹起收起监听" : const KeyboardDemoPage(),
  "高斯模糊组件-ImageFilter" : const MyBlurDemoPage(),
  "形变动画组件-AnimatedContainer" : const AnimationContainerDemoPage(),
};
