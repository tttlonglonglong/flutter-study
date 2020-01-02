import 'package:flutter/material.dart';


//
class HttpPractice extends StatefulWidget {
  // 需要重写 createState 方法
  @override
  _HttpPracticeState createState()=> _HttpPracticeState();
}

// 内部类不能被外界访问，接收一个StatefulWidget的泛型
class _HttpPracticeState extends State<HttpPractice>{

  @override
  Widget build(BuildContext context){
    // TODO: implement createState
    return Scaffold(
        body: Center(
          child: Text('http练习'),
        )
    );
  }
}