import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      :super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  void initState() {
    super.initState();
    // 初始化一个controller，指定执行时间是2s，vsync：屏幕外的节能
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    // Tween：设置0-300之间的曲线变化，将Tween传递给 tween
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() { // 等价于..相当于表达式的返回值，animation.addListener
        // 动画值发生变化的监听器
        // 必须在addListener 里面setState，才能触发页面的重新渲染，可以setState空值
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((AnimationStatus state) {
        // 动画状态变化的监听器
        setState(() {
          animationStatus = state;
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('APP拍照'),
          leading: GestureDetector(
            onTap: () {
              // 路由的跳出
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  controller.reset();
                  controller.forward();
                },
                child: Text('Start', textDirection: TextDirection.ltr,),
              ),
              Text('State' + animationStatus.toString(),
                textDirection: TextDirection.ltr,),
              Text('Value' + animationValue.toString(),
                textDirection: TextDirection.ltr,),
              Container(
                height: animation.value,
                width: animation.value,
                child: FlutterLogo(),
              )
            ],
          ),
        )
    );
  }
}
