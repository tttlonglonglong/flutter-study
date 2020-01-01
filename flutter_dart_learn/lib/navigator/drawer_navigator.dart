
import 'package:flutter/material.dart';

class DrawerNavigator extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(title),
//        leading: GestureDetector(
//          onTap: () {
//            // 路由的跳出
//            Navigator.pop(context);
//          },
//          child: Icon(Icons.arrow_back),
//        ),
//      ),
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('跳转去其他路由页面-image'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
//                Navigator.pop(context);
//              print('TabbedAppBarSample');
//                Navigator.pushNamed(context, "image");
                Navigator.popAndPushNamed(context, "image");
              },
            ),
          ],
        ),
      ),
    );
  }
}