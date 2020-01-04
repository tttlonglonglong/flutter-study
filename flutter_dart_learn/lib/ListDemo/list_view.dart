
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const CITY_NAMES = [ '北京', '上海', '广州', '深圳', '杭州', '苏州', '成都', '武汉', '郑州', '洛阳', '厦门', '青岛', '拉萨' ];

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        leading: GestureDetector(
          onTap: () {
            // 路由的跳出
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
         scrollDirection: Axis.horizontal, // 默认竖直滚动，设置水平方向的滚动
        children: _buildList(),
      ),
    );
  }

 List<Widget> _buildList() {
    return CITY_NAMES.map((city)=>_item(city)).toList();
 }
 Widget _item(city){
    return Container(
      width: 160,
      height: 80,
      margin: EdgeInsets.only(bottom: 5,right: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(city,style:TextStyle(color: Colors.white, fontSize: 20),),
    );
 }
}
