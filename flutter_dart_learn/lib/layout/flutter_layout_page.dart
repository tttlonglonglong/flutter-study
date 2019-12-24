import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

// 如何进行flutter布局开发
class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPage createState() => _FlutterLayoutPage();
}

class _FlutterLayoutPage extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: '如何进行flutter布局开发',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('如何进行flutter布局开发')),
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
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                      'https://img2.mukewang.com/5789ca5a00015c0401000100-100-100.jpg'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                // 方形
                                child: ClipRRect(
                                  // 圆角
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Opacity(
                                    opacity: .5,
                                    child: Image.network(
                                      'https://upload.jianshu.io/users/upload_avatars/177500/a3228303-3cfe-4539-8f72-aa8d1cdc525e.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Image.network(
                            'https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi',
                            width: 100,
                            height: 100,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              hintText: '请输入',
                              hintStyle: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                              height: 100,
                              margin: EdgeInsets.all(10),
                              decoration:
                                  BoxDecoration(color: Colors.lightBlueAccent),
                              child: PhysicalModel(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(6),
                                clipBehavior: Clip.antiAlias, // 抗锯齿
                                child: PageView(
                                  children: <Widget>[
                                    _item('Page1', Colors.deepPurple),
                                    _item('Page2', Colors.green),
                                    _item('Page3', Colors.red),
                                    _item('Page4', Colors.yellow),
                                  ],
                                ),
                              )),
                          Column(
                            children: <Widget>[
                              Container(
                                decoration:
                                    BoxDecoration(color: Colors.greenAccent),
                                child: Text('宽度撑满'),
                              ),
                              FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Colors.greenAccent),
                                  child: Text('宽度撑满'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// 图片叠加效果
                    Stack(
                      children: <Widget>[
                        Image.network(
                          'https://img-blog.csdnimg.cn/20190918140145169.png',
                          width: 100,
                          height: 100,
                        ),
                        Positioned(
                          // 全部设置成0 会拉扯成原图的大小
                          // right: 0,
                          left: 0,
                          // top: 0,
                          bottom: 0,
                          child: Image.network(
                            'https://img-blog.csdnimg.cn/20190918140129601.png',
                            width: 36,
                            height: 36,
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      // 创建一个wrap布局，从左向右进行排列，会自动换行
                      spacing: 8, // 水平边距
                      runSpacing: 6, // 垂直边距

                      children: <Widget>[
                        _chip('Chip组件'),
                        _chip('Flutter'),
                        _chip('Android'),
                        _chip('IOS'),
                        _chip('ReactNative'),
                        _chip('Phoneggap'),
                      ],
                    ),
                  ],
                ),
              )
            : Column(
                children: <Widget>[
                  Text('列表页面'),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text('拉伸填满高度'),
                    ),
                  )
                ],
              ),
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
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
