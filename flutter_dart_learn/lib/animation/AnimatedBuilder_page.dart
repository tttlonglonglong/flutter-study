import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogoAppAnimatedBuilder extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class LogoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return  Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: FlutterLogo(),
       
    );
  }
}

class GrowTransition  extends StatelessWidget {
  GrowTransition(this.child, this.animation);

  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          height: animation.value,
          width: animation.value,
          child: child,
        ),
        child: child
    );
  }


}


class _LogoAppState extends State<LogoAppAnimatedBuilder> with SingleTickerProviderStateMixin {
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
  Widget build(BuildContext context) =>
      Scaffold(
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
              GrowTransition(
                LogoWidget(),
                animation,
              )
            ],
          ),
        )
    );
}
