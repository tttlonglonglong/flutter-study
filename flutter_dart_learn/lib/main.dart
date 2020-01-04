import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/animation/AnimatedBuilder_page.dart';
import 'package:flutter_dart_learn/animation/logo_app.dart';
import 'package:flutter_dart_learn/dart/function_learn.dart';
import 'package:flutter_dart_learn/dart/generic_learn.dart';
import 'package:flutter_dart_learn/httpDemo/http_demo.dart';
import 'package:flutter_dart_learn/launcher/launch_page.dart';
import 'package:flutter_dart_learn/layout/less_group_page.dart';
import 'package:flutter_dart_learn/dart/oop_learn.dart';
import 'package:flutter_dart_learn/layout/plugin_use.dart';
import 'package:flutter_dart_learn/layout/statefull_group_page.dart';
import 'package:flutter_dart_learn/photoApp/photo_app_page.dart';
import 'package:flutter_dart_learn/resource/res_page.dart';
import 'package:flutter_dart_learn/sharedPreferences/shared_preferences.dart';

import 'ImageApp/image_app_page.dart';
import 'ListDemo/expand_list.dart';
import 'ListDemo/grid_view.dart';
import 'ListDemo/list_view.dart';
import 'ListDemo/refresh_List.dart';
import 'animation/AnimatedWidget_page.dart';
import 'animation/photo_hero.dart';
import 'animation/photo_radial_hero.dart';
import 'dart/data_type.dart';
import 'gesture/gesture_page.dart';
import 'httpDemo/future_builder_page.dart';
import 'layout/flutter_layout_page.dart';
import 'lifecycle/app_lifecycle.dart';
import 'lifecycle/flutter_widget_lifecycle.dart';
import 'navigator/drawer_navigator.dart';
import 'navigator/tab_navigator.dart';
import 'navigator/tabbed_app_bar_sample.dart';

//void main() => runApp(MyApp());
void main() => runApp(DynamicTheme());
//void main() => runApp(PluginUse());
//void main() => runApp(LessGroupPage());
//void main() => runApp(StatefulGroup());
//void main() => runApp(FlutterLayoutPage());

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter 必备Dart基础',
        theme: ThemeData(
          /// 全局字体
          // fontFamily: 'RubikMonoOne', // 将该字体应用到全局
          brightness: _brightness,
          primarySwatch: Colors.blue,
        ),
//      home: MyHomePage(title: 'Flutter 必备Dart基础'),
        home: Scaffold(
          appBar: AppBar(
            title: Text('如何创建和使用Flutter的路由与导航？'),
            leading: GestureDetector(
              onTap: (){
                // 路由的跳出
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          body: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: ((){
                  print('点击切换了---日间模式');
                  setState(() {
                    if(_brightness == Brightness.dark){
                      _brightness = Brightness.light;
                    } else {
                      _brightness = Brightness.dark;
                    }
                  });
                }),
                child: Text('切换主题', style: TextStyle(fontFamily: 'RubikMonoOne'),),
              ),
              RouteNavigator()
            ],
          ),
        ),
        routes: <String, WidgetBuilder>{
          'plugin': (BuildContext context) => PluginUse(),
          'less': (BuildContext context) => LessGroupPage(),
          'ful': (BuildContext context) => StatefulGroup(),
          'layout': (BuildContext context) => FlutterLayoutPage(),
          'gesture': (BuildContext context) => GesturePage(),
          'res': (BuildContext context) => ResPage(),
          'launch': (BuildContext context) => LaunchPage(),
          'lifecycle': (BuildContext context) => WidgetLifecycle(),
          'appLifecycle': (BuildContext context) => AppLifecycle(),
          'photo': (BuildContext context) => PhotoApp(),
          'image': (BuildContext context) => ImageApp(),
          'animation': (BuildContext context) => LogoApp(),
          'animation-widget': (BuildContext context) => LogoAppAnimatedWidget(),
          'animation-builder': (BuildContext context) => LogoAppAnimatedBuilder(),
          'animation-hero': (BuildContext context) => HeroAnimation(),
          'animation-radial': (BuildContext context) => RadialExpansionDemo(),
          'TabbedAppBarSample': (BuildContext context) => TabbedAppBarSample(),
          'DrawerNavigator': (BuildContext context) => DrawerNavigator(),
          'TabNavigator': (BuildContext context) => TabNavigator(),
          'HttpDemo': (BuildContext context) => HttpDemo(),
          'FutureBuilderPage': (BuildContext context) => FutureBuilderPage(),
          'SharedPreferencesPage': (BuildContext context) => SharedPreferencesPage(),
          'ListViewPage': (BuildContext context) => ListViewPage(),
          'ExpandListPage': (BuildContext context) => ExpandListPage(),
          'GridViewPage': (BuildContext context) => GridViewPage(),
          'RefreshListPage': (BuildContext context) => RefreshListPage(),
        });
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter 必备Dart基础',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
//      home: MyHomePage(title: 'Flutter 必备Dart基础'),
        home: Scaffold(
          appBar: AppBar(
            title: Text('如何创建和使用Flutter的路由与导航？'),
            leading: GestureDetector(
              onTap: (){
                // 路由的跳出
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          body: RouteNavigator(),
        ),
        routes: <String, WidgetBuilder>{
          'plugin': (BuildContext context) => PluginUse(),
          'less': (BuildContext context) => LessGroupPage(),
          'ful': (BuildContext context) => StatefulGroup(),
          'layout': (BuildContext context) => FlutterLayoutPage(),
          'gesture': (BuildContext context) => GesturePage(),
          'res': (BuildContext context) => ResPage(),
          'launch': (BuildContext context) => LaunchPage(),
          'lifecycle': (BuildContext context) => WidgetLifecycle(),
          'appLifecycle': (BuildContext context) => AppLifecycle(),
          'photo': (BuildContext context) => PhotoApp(),
          'image': (BuildContext context) => ImageApp(),
          'animation': (BuildContext context) => LogoApp(),
          'animation-widget': (BuildContext context) => LogoAppAnimatedWidget(),
          'animation-builder': (BuildContext context) => LogoAppAnimatedBuilder(),
          'animation-hero': (BuildContext context) => HeroAnimation(),
          'animation-radial': (BuildContext context) => RadialExpansionDemo(),
          'TabbedAppBarSample': (BuildContext context) => TabbedAppBarSample(),
          'DrawerNavigator': (BuildContext context) => DrawerNavigator(),
          'TabNavigator': (BuildContext context) => TabNavigator(),
          'HttpDemo': (BuildContext context) => HttpDemo(),
          'FutureBuilderPage': (BuildContext context) => FutureBuilderPage(),
          'SharedPreferencesPage': (BuildContext context) => SharedPreferencesPage(),
          'ListViewPage': (BuildContext context) => ListViewPage(),
          'ExpandListPage': (BuildContext context) => ExpandListPage(),
          'GridViewPage': (BuildContext context) => GridViewPage(),
          'RefreshListPage': (BuildContext context) => RefreshListPage(),
        });
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = true;

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.blue,
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${byName ? '' : '不'}通过路由名跳转'),
            value: byName,
            onChanged: (value) {
              print('点了路由跳转的Switch开关:${value}');
              setState(() {
                byName = value;
              });
              print('点了路由跳转的Switch开关byName:${byName}');
            },
          ),
          _item('StatelessWidget与基础件', StatefulGroup(), 'ful'),
//          _item('StatelessWidget与无状态基础件', LessGroupPage(), 'less'),
//          _item('如何进行Flutter布局开发？', FlutterLayoutPage(), 'layout'),
          _item('如何使用Flutter包和插件', PluginUse(), 'plugin'),
          _item('如何检测用户手势以及处理点击事件', GesturePage(), 'gesture'),
          _item('如何导入flutter静态资源文件', ResPage(), 'res'),
          _item('如何打开第三方应用', LaunchPage(), 'launch'),
          _item('Flutter页面生命周期方法', WidgetLifecycle(), 'lifecycle'),
          _item('Flutter应用的生命周期', AppLifecycle(), 'appLifecycle'),
//          _item('APP拍照', PhotoApp(), 'photo'),
//          _item('Image图片处理', ImageApp(), 'image'),
//          _item('Flutter动画', LogoApp(), 'animation'),
//          _item('Flutter动画animation-widget', LogoAppAnimatedWidget(), 'animation-widget'),
//          _item('Flutter动画animation-builder', LogoAppAnimatedBuilder(), 'animation-builder'),
//          _item('Flutter动画animation-hero', HeroAnimation(), 'animation-hero'),
//          _item('Flutter动画animation-radial', RadialExpansionDemo(), 'animation-radial'),
//          _item('Flutter顶部导航', TabbedAppBarSample(), 'TabbedAppBarSample'),
//          _item('Flutter动画底部导航', TabNavigator(), 'TabNavigator'),
//          _item('Flutter动画底部导航', TabNavigator(), 'TabNavigator'),
          _item('Flutter-HttpDemo', HttpDemo(), 'HttpDemo'),
          _item('Flutter-FutureBuilder', FutureBuilderPage(), 'FutureBuilderPage'),
          _item('Flutter-SharedPreferencesPage', SharedPreferencesPage(), 'SharedPreferencesPage'),
          _item('Flutter-ListViewPage', ListViewPage(), 'ListViewPage'),
          _item('Flutter-ListViewPage', ListViewPage(), 'ListViewPage'),
          _item('Flutter-GridView网格布局', ExpandListPage(), 'GridViewPage'),
          _item('Flutter-Refresh下拉刷新', RefreshListPage(), 'RefreshListPage'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          print('点击了RaisedButton跳转按钮');
          if(byName){
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
