import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
const APPBAR_SCROLL_OFFSET = 100;

//
class HomePage extends StatefulWidget {
  // 需要重写 createState 方法
  @override
  _HomePageState createState() => _HomePageState();
}

// 内部类不能被外界访问，接收一个StatefulWidget的泛型
class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    "https://tse3-mm.cn.bing.net/th/id/OIP.M_QsSmVzkwmEllg8FBjv_gHaHp?w=192&h=197&c=7&o=5&dpr=2&pid=1.7",
    "https://tse2-mm.cn.bing.net/th/id/OIP.q8X3ajDZqueGRj1RZRNihAHaLH?w=192&h=288&c=7&o=5&dpr=2&pid=1.7",
    "http://pic127.nipic.com/file/20170416/21447645_165339425923_2.jpg",
    "http://pics.sc.chinaz.com/files/pic/pic9/201504/apic10778.jpg"
  ];
  double appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    return Scaffold(
//      appBar:AppBar(title: Text("自带的AppBar")) ,// 自带的appBar不便于灵活的控制拓展
    // Stack 下、前面的元素会堆叠在下面
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              // ListView自动适配了iphone-x
              child: NotificationListener(
                // 列表每次滚动的时候都会回调这个回调函数，会检查所有子child和widget是否滚动，会监听很多的widget
                // app库加载的时候，也会回传onNotification，但是不是 ScrollUpdateNotification
                onNotification: (scrollNotification){
                  // 滚动距离是0的时候也会触发这个函数
                  // ListView滚动且只是ListView滚动(不然ListView内的Swiper 也会滚动)
                  if(scrollNotification is ScrollUpdateNotification
                      && scrollNotification.depth==0){
                    // 滚动且是列表滚动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                  return true;
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160,
                      child: new Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        pagination: new SwiperPagination(),
//                    control: new SwiperControl(),
                        itemBuilder: (BuildContext context, int index) {
                          print("flutter-swipper--$index");
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 800,
                      child: ListTile(title: Text('哈哈'),),
                    )
                  ],
                ),
              )
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onScroll(offset) {
    double alpha = offset/ APPBAR_SCROLL_OFFSET;
    if( alpha < 0){
      alpha = 0;
    } else if(alpha >1){
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print('滚动的距离 $offset appBarAlpha $appBarAlpha');
  }
}
