import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySliderFile extends StatefulWidget {
  const MySliderFile({Key? key}) : super(key: key);

  @override
  _MySliderFileState createState() => _MySliderFileState();
}

class _MySliderFileState extends State<MySliderFile> {
  double _sliderValue = 0;
  RangeValues _rangeValues = const RangeValues(0, 25);
  double _value = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("滑块组件"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text("值: $_sliderValue"),
          Slider(value: _sliderValue, onChanged: (value){
            setState(() {
              _sliderValue = value;
            });
          },
            min: 0,
            max: 100,
            ///设置离散的
            divisions: 5,
            ///设置标签，滑动过程中在其上方显示
            label: "$_sliderValue",
            activeColor: Colors.red,
            inactiveColor: Colors.green,
            // thumbColor: Colors.orange,//master版本
          ),
          const SizedBox(height: 20),
          RangeSlider(values: _rangeValues, onChanged: (value){
            setState(() {
              _rangeValues = value;
            });
          },
            min: 0,
            max: 100,
          ),
          const SizedBox(height: 20),
          CupertinoSlider(value: _value, onChanged: (value){
            setState(() {
              _value = value;
            });
          }),
          const SizedBox(height: 20),
          ///也可以根据平台显示不同风格的Slider，ios平台显示CupertinoSlider效果，其他平台显示Material风格，
          Slider.adaptive(value: _value, onChanged: (value){
            setState(() {
              _value = value;
            });
          })
        ],
      ),
    );
  }
}
