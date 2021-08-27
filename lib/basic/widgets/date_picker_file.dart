import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDatePickerFile extends StatelessWidget {
  const MyDatePickerFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("日期选择组件"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          ///showDatePicker点击按钮弹出日期组件
          Container(
            padding: const EdgeInsets.only(left: 100, right: 100),
            height: 50,
            child: ElevatedButton(
                onPressed: (){
                  _showDatePicker(context);
                },
                child: const Text("弹出日期组件")),
          ),
          const SizedBox(height: 15),
          ///CalendarDatePicker,日期组件直接显示在页面上，而不是弹出显示,其参数和 showDatePicker 一样
          CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2050),
              ///日期选择回调
              onDateChanged: (date) {

              }
          ),
          const SizedBox(height: 10),
          ///范围日期,选择范围日期使用 showDateRangePicker,其参数和 showDatePicker 一样
          Container(
            padding: const EdgeInsets.only(left: 80, right: 80),
            height: 50,
            child: ElevatedButton(
                onPressed: () async {
                  await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2025)
                  );
                },
                child: const Text("弹出选择范围日期组件")),
          ),
          const SizedBox(height: 20),
          ///CupertinoTimerPicker 是 iOS风格的时间选择器
          Container(
            height: 200,
            color: Colors.grey.withOpacity(0.5),
            child: CupertinoDatePicker(
              onDateTimeChanged:(date){
                print('$date');
              },
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2018),
              maximumDate: DateTime(2030),
              ///模式
              mode: CupertinoDatePickerMode.date,
              ///使用24小时制
              use24hFormat: true,
            ),
          )
        ],
      ),
    );
  }

  _showDatePicker(BuildContext context) async {
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2060),
      ///设置日期选择器对话框的模式
      initialEntryMode: DatePickerEntryMode.calendar,
      ///设置日历日期选择器的初始显示
      // initialDatePickerMode: DatePickerMode.,
      helpText: "选则日期",
      cancelText: "取消",
      confirmText: "确定",
      errorFormatText: "错误的日期格式",
      errorInvalidText: "错误的日期格式",
      fieldLabelText: "填写日期",
      fieldHintText: "月/日/年",
      ///设置可选日期范围
      selectableDayPredicate: (date){
          return date.difference(DateTime(1960)).inMilliseconds > 0;
      },
        ///设置主题
      builder: (context, child){
          return Theme(
              data: ThemeData.light(),
              child: child ?? Container(),
          );
      }
    );
  }
}
