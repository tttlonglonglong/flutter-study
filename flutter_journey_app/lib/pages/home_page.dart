import 'package:flutter/material.dart';


//
class HomePage extends StatefulWidget {
  // 需要重写 createState 方法
  @override
  _HomePageState createState()=> _HomePageState();
}

// 内部类不能被外界访问，接收一个StatefulWidget的泛型
class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context){
    // TODO: implement createState
    return Scaffold(
      body: Center(
        child: Text('首页'),
      )
    );
  }
}