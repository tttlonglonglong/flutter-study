import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  @override
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferencesPage'),
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
          RaisedButton(
            onPressed: _incrementCounter,
            child: Text('Increment Counter'),
          ),
          RaisedButton(
            onPressed: _getCounter,
            child: Text('get Counter'),
          ),
          Text(countString,style: TextStyle(fontSize: 20),),
          Text(localCount,style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int counter = (prefs.getInt('counter') ?? 0) + 1;
    setState(() {
      countString = countString + '1';
    });
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }

  void _getCounter() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();
    });
  }
}
