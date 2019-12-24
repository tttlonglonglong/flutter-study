import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';


class LessGroupPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title:Text('StatelessWidget与基础组件'),
          leading: GestureDetector(
            onTap: () {
              // 路由的跳出
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('这是一个文本组件', style: textStyle,),
              Icon(Icons.android, size: 50,color: Colors.red,),
              CloseButton(),
              BackButton(),
              // 材料中有趣的小部件

              Chip(
                  avatar: Icon(Icons.people),
                  label: Text('StatelessWidget与基础组件')
              ),
              Divider(
                height: 10,// 容器的高度
                indent: 50, // 左侧间距
                color: Colors.orange,
              ),
              Card(
                // 带有圆角、阴影、边框等效果的卡片
                color: Colors.blue,
                elevation: 5, // 阴影
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('I am Card', style: textStyle,),
                ),
              ),
              AlertDialog(
                title: Text("弹窗"),
                content: Text('糟老头子坏的很'),
              )

            ],
          ),
        ),
      ),
    );
  }
}

