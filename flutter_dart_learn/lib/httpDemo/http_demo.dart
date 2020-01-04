import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // json的序列化和反序列化

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  String showResult = '';
  Future<CommonModel> fetchPost() async{
    final response = await http.get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final result = json.decode(response.body);
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:Text('Http'),
          leading: GestureDetector(
            onTap: () {
              // 路由的跳出
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
              onTap: (){
                fetchPost().then((CommonModel value){
                  setState(() {
                    showResult = '请求结果：\nhideAppBar ${value.hideAppbar} \nicon ${value.icon}';
                  });
                });
              },
              child: Text(
                '点我',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Text(showResult),
          ],
        ),
      ),
    );
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppbar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppbar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppbar: json['hideAppbar'],
    );
  }
}
