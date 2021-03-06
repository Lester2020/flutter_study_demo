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
import 'package:flutter_study_demo/basic/demo/widget_layout_demo1.dart';
import 'package:flutter_study_demo/basic/demo/widget_layout_demo2.dart';
import 'package:flutter_study_demo/basic/demo/widget_layout_demo3.dart';
import 'package:flutter_study_demo/basic/grid_view/grid_view_builder_demo.dart';
import 'package:flutter_study_demo/basic/grid_view/grid_view_count_demo.dart';
import 'package:flutter_study_demo/basic/grid_view/grid_view_refresh_demo.dart';
import 'package:flutter_study_demo/basic/inherited/inherited_widget_file.dart';
import 'package:flutter_study_demo/basic/list_view/list_view_bulider_demo.dart';
import 'package:flutter_study_demo/basic/list_view/list_view_refresh_demo.dart';
import 'package:flutter_study_demo/basic/list_view/list_view_separated_demo.dart';
import 'package:flutter_study_demo/basic/list_view/pull_down_refresh_demo.dart';
import 'package:flutter_study_demo/basic/list_view/pull_up_refresh_demo.dart';
import 'package:flutter_study_demo/basic/short_video/short_video_page.dart';
import 'package:flutter_study_demo/basic/sliver_view/sliver_appbar_float_demo.dart';
import 'package:flutter_study_demo/basic/sliver_view/sliver_appbar_pinned_demo.dart';
import 'package:flutter_study_demo/basic/sliver_view/sliver_appbar_snap_demo.dart';
import 'package:flutter_study_demo/basic/sliver_view/sliver_basic_usage_demo.dart';
import 'package:flutter_study_demo/basic/sliver_view/sliver_custom_header_demo.dart';
import 'package:flutter_study_demo/basic/sliver_view/sliver_sticky_tabbar_demo.dart';
import 'package:flutter_study_demo/basic/stick/stick_demo_page.dart';
import 'package:flutter_study_demo/basic/third/photos_file.dart';
import 'package:flutter_study_demo/basic/third/webview_html_page.dart';
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
import 'package:flutter_study_demo/basic/widgets/future_builder_file.dart';
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
import 'package:flutter_study_demo/globe/user_event.dart';

class BasicPage extends StatelessWidget {
  const BasicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter??????"),
        // backgroundColor: const Color.fromRGBO(237, 67, 71, 1.0),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share))
        ],
        leading: IconButton(
            onPressed: (){
              ///??????????????????????????????
              eventBus.fire(UserEvent("openDrawer"));

            }, icon: const Icon(Icons.dashboard)),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: const Icon(Icons.add),
      ),
    );
  }

}

Map<String, Widget> itemRouters = {
  "????????????-Text" : const MyTextFile(),
  "????????????-Button" : const MyButtonFile(),
  "????????????-Row" : const MyRowFile(),
  "????????????-Column" : const MyColumnFile(),
  "????????????-Stack" : const MyStackFile(),
  "????????????-Positioned" : const MyPositionedFile(),
  "????????????-Wrap" : const MyWrapFile(),
  "??????????????????-Expanded&Flexible&Spacer" : const MyExpandedFile(),
  "??????demo1" : const LayoutDemo1(),
  "????????????-Container" : const MyContainerFile(),
  "??????????????????-SizeBox" : const MySizeBoxFile(),
  "???????????????-AspectRatio" : const MyAspectRatioFile(),
  "?????????????????????-FractionallySizedBox" : const MyFractionallySizedBoxFile(),
  "??????demo2" : const LayoutDemo2(),
  "???????????????-TextField" : const MyTextFieldFile(),
  "????????????-Radio" : const MyRadioFile(),
  "????????????-CheckBox" : const MyCheckBoxFile(),
  "????????????-Slider" : const MySliderFile(),
  "????????????-Switch" : const MySwitchFile(),
  "????????????-Indicator" : const MyIndicatorFile(),
  "????????????-Image" : const MyImageFile(),
  "??????demo" : const ImageDemo(),
  "????????????" : const CircleImageFile(),
  "????????????-ListView" : const MyListViewFile(),
  "????????????-GridView" : const MyGridViewFile(),
  "????????????-SingleChildScrollView" : const MySingleChildScrollView(),
  "????????????-PageView" : const MyPageViewFile(),
  "????????????-DataTable" : const MyDataTableFile(),
  "????????????-ExpansionTile" : const MyExpansionTileFile(),
  "PageViewDemo" : const MyPageViewDemo(),
  "????????????-ScrollNotification" : const MyScrollNotification(),
  "??????????????????-GestureDetector" : const MyGestureDetectorFile(),
  "??????????????????-InkWell" : const MyInkWellFile(),
  "????????????-SliverList&SliverGrid" : const MySliverViewFile(),
  "????????????-SliverAppBar" : const MySliverAppBarFile(),
  "????????????-SliverPersistentHeader" : const MySliverPersistentHeader(),
  "????????????-SliverToBoxAdapter" : const MySliverToBoxAdapter(),
  "????????????-NestedScrollView" : const MyNestedScrollView(),
  "????????????-DatePicker" : const MyDatePickerFile(),
  "????????????-TimePicker" : const MyTimePickerFile(),
  "????????????-PopupMenu" : const MyPopupMenuFile(),
  "???????????????-AlertDialog" : const MyAlertDialogFile(),
  "????????????-Shape" : const MyShapeFile(),
  "????????????-Draggable" : const MyDraggableFile(),
  "??????????????????-InteractiveViewer" : const MyInteractiveViewer(),
  "????????????-AnimationController" : const MyAnimationController(),
  "????????????-Tween" : const MyTweenFile(),
  "????????????-Curve" : const MyCurveFile(),
  "????????????demo" : const MyAnimationControllerDemo(),
  "????????????-TweenSequence" : const MyTweenSequenceFile(),
  "??????????????????" : const MyAnimateWidgetFile(),
  "????????????-AnimatedList" : const MyAnimatedListFile(),
  "??????????????????-Hero" : const MyHeroFile(),
  "?????????????????????Animations" : const MyMaterialMotionFile(),
  "??????????????????" : const StickDemoPage(),
  "????????????" : const TransformDemoPage(),
  "????????????????????????" : const KeyboardDemoPage(),
  "??????????????????-ImageFilter" : const MyBlurDemoPage(),
  "??????????????????-AnimatedContainer" : const AnimationContainerDemoPage(),
  "????????????-FutureBuilder" : const FutureBuilderFile(),
  "????????????-InheritedWidget" : const InheritedWidgetFile(),
  "?????????????????????????????????" : const PhotosFile(),
  "????????????-WebView??????HTML" : const WebViewHtmlPage(),
  "????????????1" : const PitLayoutDemo(),
  "????????????2" : const CreditCardDemo(),
  '????????????3' : const WidgetLayoutDemo3(),
  '??????????????????' : const PullDownRefreshDemo(),
  '??????????????????' : const PullUpRefreshDemo(),
  'ListView????????????' : const ListViewRefreshDemo(),
  'ListView Builder??????' : const ListViewBuilderDemo(),
  'ListView Separated??????' : const ListViewSeparatedDemo(),
  'GridView Count??????' : const GridViewCountDemo(),
  'GridView Builder??????' : const GridViewBuilderDemo(),
  'GridView????????????' : const GridViewRefreshDemo(),
  'Sliver????????????' : const SliverBasicUsageDemo(),
  'SliverCustomHeader??????' : const SliverCustomHeaderDemo(),
  'SliverAppBarFloat??????' : const SliverAppBarFloatDemo(),
  'SliverAppBarPinned??????' : const SliverAppBarPinnedDemo(),
  'SliverAppBarSnap??????' : const SliverAppBarSnapDemo(),
  'SliverStickyTabBar??????' : const SliverStickyTabBarDemo(),
  'PageView????????????????????????' : const ShortVideoPage(),
};
