import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTimePickerFile extends StatelessWidget {
  const MyTimePickerFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("时间选择器"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 50,
            padding: const EdgeInsets.only(left: 80, right: 80),
            child: ElevatedButton(onPressed: () async{
              await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                initialEntryMode: TimePickerEntryMode.dial,
                helpText: "选择时间",
                cancelText: "取消",
                confirmText: "确定",
                builder: (context, child) {
                    return Theme(data: ThemeData.dark(), child: child ?? Container());
                }
              );

            }, child: const Text("弹出时间选择器")),
          ),
          const SizedBox(height: 30),
          Container(
            height: 200,
            color: Colors.grey.withOpacity(0.5),
            child: CupertinoTimerPicker(onTimerDurationChanged: (time){
              print('$time');
            },
              mode: CupertinoTimerPickerMode.hms,
              initialTimerDuration: Duration(
                  hours: DateTime.now().hour,
                  minutes: DateTime.now().minute,
                  seconds: DateTime.now().second),
              ///设置 分/秒 的间隔：
              minuteInterval: 1,
              secondInterval: 1,
            ),
          )
        ],
      ),
    );
  }
}
