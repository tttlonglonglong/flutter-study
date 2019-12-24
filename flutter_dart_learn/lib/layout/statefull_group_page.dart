import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class StatefulGroup extends StatefulWidget {
  @override
  _StatefulGroupState createState() => _StatefulGroupState();
}

class _StatefulGroupState extends State<StatefulGroup> {
  int _currentIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StateGroupPage与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('StateGroupPage与基础组件')),
        // 导航栏Tab
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                title: Text('首页'),
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
              ),
              BottomNavigationBarItem(
                title: Text('列表'),
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
              ),
            ]),
        // 悬浮按钮
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('点击了悬浮按钮');
          },
          child: Text('点我'),
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                onRefresh: _handleRefresh,
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            'https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi',
                            width: 100,
                            height: 100,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              hintText:'请输入',
                              hintStyle: TextStyle(fontSize:15),
                            ),
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.only(top:10),
                            decoration: BoxDecoration(color: Colors.lightBlueAccent),
                            child: PageView(
                              children: <Widget>[
                                _item('Page1',Colors.deepPurple),
                                _item('Page2',Colors.green),
                                _item('Page3',Colors.red),
                                _item('Page4',Colors.yellow),
                              ],
                            ),

                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Text('列表页面'),
      ),
    );
  }

  // 返回Future 的方法
  Future<Null> _handleRefresh() async {
    // flutter中的timeOut
    await Future.delayed(Duration(milliseconds: 2000));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white),),
    );
  }
}
