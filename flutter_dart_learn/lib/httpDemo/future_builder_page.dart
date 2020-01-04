import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/httpDemo/http_demo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // json的序列化和反序列化

class FutureBuilderPage extends StatefulWidget {
  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8decoder  = Utf8Decoder(); //fix 中文乱码
    // final result = json.decode(response.body);
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Future与FutureBuilder实用技巧'),
          leading: GestureDetector(
            onTap: () {
              // 路由的跳出
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FutureBuilder<CommonModel>(
            future: fetchPost(),
            builder:
                (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('Input a URL to start');
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                      return Text('');
                    case ConnectionState.done:
                      // 只能用布尔值 hasError
                      if (snapshot.hasError) {
                        return Text(
                          '${snapshot.error}',
                          style: TextStyle(color: Colors.red),
                        );
                      } else {
                        return Column(
                          children: <Widget>[
                            Text('icon:${snapshot.data.icon}'),
                            Text('statusBarColor:${snapshot.data.statusBarColor}'),
                            Text('title:${snapshot.data.title}'),
                            Text('url:${snapshot.data.url}'),
                          ],
                        );
                      }
                  }
              return Text('11');
            }),
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
