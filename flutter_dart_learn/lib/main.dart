import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/dart/function_learn.dart';
import 'package:flutter_dart_learn/dart/generic_learn.dart';
import 'package:flutter_dart_learn/layout/less_group_page.dart';
import 'package:flutter_dart_learn/dart/oop_learn.dart';
import 'package:flutter_dart_learn/layout/plugin_use.dart';
import 'package:flutter_dart_learn/layout/statefull_group_page.dart';

import 'dart/data_type.dart';
import 'layout/flutter_layout_page.dart';

//void main() => runApp(MyApp());
//void main() => runApp(PluginUse());
//void main() => runApp(LessGroupPage());
//void main() => runApp(StatefulDroup());
void main() => runApp(FlutterLayoutPage());




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 必备Dart基础',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter 必备Dart基础'),
      routes:<String, WidgetBuilder>{
        'less':(BuildContext context)=>LessGroupPage(),
        'ful':(BuildContext context)=>StatefulGroup(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // _oopLearn();
    // _functionLearn();
    _genericLearn();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
//              DateType()
            ],
          ),
        ));
  }

  void _oopLearn() {
    print('------_oopLearn--------');
    Logger log1 = Logger();
    Logger log2 = Logger();
    print(log1 == log2);
    Student.doPrint('_oopLearn');
    // 创建Student 的对象
    Student stu1 = Student('清华', 'Jack', 18);
    print('getter获取私有字段属性：${stu1.school}');
    // setter设置私有字段的值
    stu1.school = '985';
    print('getter获取私有字段属性：${stu1.school}');
    print(stu1.toString());


    Student stu2  =Student('北大', 'Tom', 16, city:'上海', country:'中国');
    print(stu2.toString());

    StudyFlutter studyFlutter =StudyFlutter();
    studyFlutter.study();

    print('------_oopLearn--end--------');
  }

  void _functionLearn() {
    TestFunction testFunction  = TestFunction();
    testFunction.start();
  }

  void _genericLearn() {
    TestGeneric testGeneric  = TestGeneric();
    testGeneric.start();
  }
}
