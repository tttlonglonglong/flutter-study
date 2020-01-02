import 'package:flutter/material.dart';
import 'package:flutter_journey_app/httpPractice/http_practice.dart';
import 'package:flutter_journey_app/pages/home_page.dart';
import 'package:flutter_journey_app/pages/my_page.dart';
import 'package:flutter_journey_app/pages/search_page.dart';
import 'package:flutter_journey_app/pages/travel_page.dart';


//
class TabNavigator extends StatefulWidget {
  // 需要重写 createState 方法
  @override
  _TabNavgatorState createState()=> _TabNavgatorState();
}

// 内部类不能被外界访问，接收一个StatefulWidget的泛型
class _TabNavgatorState extends State<TabNavigator>{
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller  = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context){
    // TODO: implement createState
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
          HttpPractice(),
        ],
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: _defaultColor,),
            activeIcon:Icon(Icons.home, color: _activeColor,),
            title: Text('首页', style: TextStyle(
              color: _currentIndex != 0 ? _defaultColor : _activeColor,
            ),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,color: _defaultColor,),
              activeIcon:Icon(Icons.search, color: _activeColor,),
              title: Text('搜索', style: TextStyle(
                color: _currentIndex != 1 ? _defaultColor : _activeColor,
              ),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt,color: _defaultColor,),
              activeIcon:Icon(Icons.camera_alt, color: _activeColor,),
              title: Text('旅拍', style: TextStyle(
                color: _currentIndex != 2 ? _defaultColor : _activeColor,
              ),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,color: _defaultColor,),
              activeIcon:Icon(Icons.account_circle, color: _activeColor,),
              title: Text('我的', style: TextStyle(
                color: _currentIndex != 3 ? _defaultColor : _activeColor,
              ),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,color: _defaultColor,),
              activeIcon:Icon(Icons.account_circle, color: _activeColor,),
              title: Text('http练习', style: TextStyle(
                color: _currentIndex != 4 ? _defaultColor : _activeColor,
              ),)
          ),
      ])
    );
  }
}