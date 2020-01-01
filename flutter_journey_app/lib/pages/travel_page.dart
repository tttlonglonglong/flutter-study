import 'package:flutter/material.dart';


//
class TravelPage extends StatefulWidget {
  // 需要重写 createState 方法
  @override
  _TravelPageState createState()=> _TravelPageState();
}

// 内部类不能被外界访问，接收一个StatefulWidget的泛型
class _TravelPageState extends State<TravelPage>{

  @override
  Widget build(BuildContext context){
    // TODO: implement createState
    return Scaffold(
      body: Center(
        child: Text('旅拍'),
      )
    );
  }
}