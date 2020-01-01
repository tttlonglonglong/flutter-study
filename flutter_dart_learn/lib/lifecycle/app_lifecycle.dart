import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// flutter应用的生命周期
/// 如何获取Flutter应用的生命周期
/// WidgetBindingObserver：是一个Widget绑定的观察器，通过它我们可以监听应用的生命周期、语言
class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver {

  @override
  void initState() {
    /// 添加一个监听器
    print('添加一个app应用生命周期的监听器');
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter应用生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Text('Flutter应用生命周期'),
      ),
    );
  }

  /// app生命周期发生变化，调用此方法
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
    if(state == AppLifecycleState.paused){
      print('App进入后台运行');
    } else if(state ==   AppLifecycleState.resumed){
      print('App进去前台');
    } else if(state ==   AppLifecycleState.inactive){
      // 不常用：应用程序处于非活跃状态，并且未接收用户输入调用的时候，比如：来了个电话

    } else if(state == AppLifecycleState.detached){
      // suspending：废弃； 不常用：应用暂时被挂起，在 iOS 上没有这一事件

      // 该应用程序仍托管在Flutter引擎上，但与任何主机视图均分离。
      // 当应用程序处于此状态时，引擎将在没有视图的情况下运行。
      // 引擎首次初始化时，或者在由于导航器弹出而销毁视图之后，可能正在附加视图。

    }

  }

  // 组件销毁的时候移除掉，防止不必要的资源消耗
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
