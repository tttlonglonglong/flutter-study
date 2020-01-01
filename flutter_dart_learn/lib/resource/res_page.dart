
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';


/// 如何导入flutter静态资源文件
class ResPage extends StatefulWidget {

  @override
  _ResPageState createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何导入flutter静态资源'),
        leading: GestureDetector(
          onTap: () {
            // 路由的跳出
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              width: 100,
              height: 100,
              image: AssetImage('images/daoli.jpeg'),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
