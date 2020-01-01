import 'package:flutter/material.dart';


//
class MyPage extends StatefulWidget {
  // 需要重写 createState 方法
  @override
  _MyPageState createState()=> _MyPageState();
}

// 内部类不能被外界访问，接收一个StatefulWidget的泛型
class _MyPageState extends State<MyPage>{

  @override
  Widget build(BuildContext context){
    // TODO: implement createState
    return Scaffold(
      body: Center(
        child: Text('我的'),
      )
    );
  }
}