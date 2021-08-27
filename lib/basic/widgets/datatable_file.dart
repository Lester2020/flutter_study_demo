import 'package:flutter/material.dart';

class MyDataTableFile extends StatefulWidget {
  const MyDataTableFile({Key? key}) : super(key: key);

  @override
  _MyDataTableFileState createState() => _MyDataTableFileState();
}

class _MyDataTableFileState extends State<MyDataTableFile> {

  var _sortAscending = true;
  List<User> data = [
    User("钱大", 24, 88.8, "男"),
    User("徐二", 27, 100, "女"),
    User("张三", 20, 78.5, "男"),
    User("李四", 22, 66.0, "女"),
    User("王五", 19, 88.2, "男"),
    User("赵六", 24, 92.7, "女"),
    User("陈七", 18, 55.3, "男"),
    User("吴八", 27, 66.5, "女"),
    User("孙九", 23, 72.0, "女"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("表格组件"),
      ),
      body: DataTable(
        ///参数表示表格显示排序图标的索引
        sortColumnIndex: 1,
        ///升序或者降序
        sortAscending: _sortAscending,
        columns: [
          ///默认情况下数据是左对齐的，让某一列右对齐只需设置DataColumn中numeric参数true，
          ///当表格列比较多的时候，可以使用SingleChildScrollView包裹DataTable，显示不全时滚动显示
          const DataColumn(label: Text("姓名")),
          DataColumn(label: const Text("年龄"), tooltip: "长按提示", onSort: (int columnIndex, bool ascending){
            //排序算法
            setState(() {
              _sortAscending = ascending;
              if(ascending) {
                data.sort((a, b){
                  return a.age.compareTo(b.age);
                });
              } else {
                data.sort((a, b){
                  return b.age.compareTo(a.age);
                });
              }
            });
          }),
          const DataColumn(label: Text("分数")),
          const DataColumn(label: Text("性别"), numeric: true),
        ],
        rows: data.map((user){
          return DataRow(
            cells: [
              DataCell(Text(user.name)),
              DataCell(Text("${user.age}")),
              DataCell(Text("${user.score}")),
              DataCell(Text(user.sex)),
            ],
            ///点击每一行数据时的回调
            onSelectChanged: (selected){

            }
          );
        }).toList(),
      ),
    );
  }
}

class User {
  final String name;
  final int age;
  final double score;
  final String sex;

  User(this.name, this.age, this.score, this.sex);

}