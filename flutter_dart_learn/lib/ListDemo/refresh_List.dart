
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> cityNames = [ '北京', '上海', '广州', '深圳', '杭州', '苏州', '成都', '武汉', '郑州', '洛阳', '厦门', '青岛', '拉萨' ];

class RefreshListPage extends StatefulWidget  {
  @override
  _RefreshListPageState createState() => _RefreshListPageState();
}

class _RefreshListPageState extends State<RefreshListPage> {

  ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    _scrollController.addListener((){
      // 滚动到底部的时候
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        print('上拉加载的数据');
        _loadData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // 生命周期移除掉，减少性能损耗
    _scrollController.dispose();
    super.dispose();
  }

  _loadData() async{
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      List<String> list = List<String>.from(cityNames);
      list.addAll(cityNames);
      cityNames = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下拉刷新的列表'),
        leading: GestureDetector(
          onTap: () {
            // 路由的跳出
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView(
            controller: _scrollController,
            children:_buildList()
        ),
      ),
    );
  }
  Future<void> _handleRefresh() async{
    print("下拉刷新");
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityNames = cityNames.reversed.toList();
    });
//    return null;
  }
  List<Widget> _buildList(){
    return cityNames.map((city)=>_item(city)).toList();
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
