import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/dart/function_learn.dart';
import 'package:flutter_dart_learn/dart/generic_learn.dart';
import 'package:flutter_dart_learn/layout/less_group_page.dart';
import 'package:flutter_dart_learn/dart/oop_learn.dart';
import 'package:flutter_dart_learn/layout/plugin_use.dart';
import 'package:flutter_dart_learn/layout/statefull_group_page.dart';

import 'dart/data_type.dart';
import 'layout/flutter_layout_page.dart';

void main() => runApp(MyApp());
//void main() => runApp(PluginUse());
//void main() => runApp(LessGroupPage());
//void main() => runApp(StatefulGroup());
//void main() => runApp(FlutterLayoutPage());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter 必备Dart基础',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
//      home: MyHomePage(title: 'Flutter 必备Dart基础'),
        home: Scaffold(
          appBar: AppBar(
            title: Text('如何创建和使用Flutter的路由与导航？'),
            leading: GestureDetector(
              onTap: (){
                // 路由的跳出
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          body: RouteNavigator(),
        ),
        routes: <String, WidgetBuilder>{
          'plugin': (BuildContext context) => PluginUse(),
          'less': (BuildContext context) => LessGroupPage(),
          'ful': (BuildContext context) => StatefulGroup(),
          'layout': (BuildContext context) => FlutterLayoutPage(),
        });
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${byName ? '' : '不'}通过路由名跳转'),
            value: byName,
            onChanged: (value) {
              print('点了路由跳转的Switch开关:${value}');
              setState(() {
                byName = value;
              });
              print('点了路由跳转的Switch开关byName:${byName}');
            },
          ),
          _item('StatelessWidget与基础件', StatefulGroup(), 'ful'),
          _item('StatelessWidget与无状态基础件', LessGroupPage(), 'less'),
          _item('如何进行Flutter布局开发？', FlutterLayoutPage(), 'layout'),
          _item('如何使用Flutter包和插件', PluginUse(), 'plugin'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          print('点击了RaisedButton跳转按钮');
          if(byName){
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
