
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const CITY_NAMES = [ '北京', '上海', '广州', '深圳', '杭州', '苏州', '成都', '武汉', '郑州', '洛阳', '厦门', '青岛', '拉萨' ];

class GridViewPage extends StatefulWidget  {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView网格布局'),
        leading: GestureDetector(
          onTap: () {
            // 路由的跳出
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: GridView.count(crossAxisCount: 2, children: _buildList(),),
    );
  }

  List<Widget> _buildList(){
    return CITY_NAMES.map((city)=>_item(city)).toList();
  }

  Widget _item(String city){
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(city, style: TextStyle(color: Colors.white, fontSize: 20),),
    );
  }
}
