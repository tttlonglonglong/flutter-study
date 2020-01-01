
import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:url_launcher/url_launcher.dart';


/// 如何打开第三方应用？
class LaunchPage extends StatefulWidget {

  @override
  _LaunchPage createState() => _LaunchPage();
}

class _LaunchPage extends State<LaunchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何打开第三方应用？'),
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
            RaisedButton(
              onPressed: ()=>_launchURL(),
              child: Text('打开浏览器'),
            ),
            RaisedButton(
              onPressed: ()=>_openMap(),
              child: Text('打开地图'),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _launchURL() async {
//    const url = 'https://flutter.dev';
    const url = 'https://www.baidu.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _openMap() async{
    // Android : schema
    const url = 'geo:52.32.4.917'; // APP提供者提供的 schema
    if(await canLaunch(url)){
      await launch(url);
    } else {
      const url = 'http://maps.apple.com/?ll=52.32,4.917'; // APP提供者提供的 schema
      if(await canLaunch(url)){
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}


