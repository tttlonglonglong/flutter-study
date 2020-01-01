import 'package:flutter/material.dart';


//
class SearchPage extends StatefulWidget {
  // 需要重写 createState 方法
  @override
  _SearchPageState createState()=> _SearchPageState();
}

// 内部类不能被外界访问，接收一个StatefulWidget的泛型
class _SearchPageState extends State<SearchPage>{

  @override
  Widget build(BuildContext context){
    // TODO: implement createState
    return Scaffold(
      body: Center(
        child: Text('搜索'),
      )
    );
  }
}