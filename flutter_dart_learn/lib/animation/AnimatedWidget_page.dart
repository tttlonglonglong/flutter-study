import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoAppAnimatedWidget extends StatefulWidget {
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

class _LogoAppState extends State<LogoAppAnimatedWidget> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    // 初始化一个controller，指定执行时间是2s，vsync：屏幕外的节能
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    // Tween：设置0-300之间的曲线变化，将Tween传递给 tween
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();

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
          title: Text('APP动画--animationWidget'),
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
              Text('animationWidget'),
               AnimatedLogo(animation: animation,)
            ],
          ),
        )
    );
  }
}
