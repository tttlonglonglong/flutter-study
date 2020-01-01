import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageApp extends StatefulWidget {
  @override
  _ImageAppState createState() => _ImageAppState();
}

class _ImageAppState extends State<ImageApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('IMG--图片处理'),
          leading: GestureDetector(
            onTap: () {
              // 路由跳出
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Stack(
          children: <Widget>[
            CircularProgressIndicator(),
//            Image.network(
//              'https://www.devio.org/img/avatar.png',
//            ),
//            FadeInImage.memoryNetwork(
//              placeholder: kTransparentImage,
//              image: "https://www.devio.org/img/avatar.png",
//                width: 150.0,
//                height: 150.0,
//            ),

           CachedNetworkImage(
              imageUrl: "https://www.devio.org/img/avatar.png",
              // 图片加载出来之前显示 placeholder
              placeholder: (context, url) => CircularProgressIndicator(), // placeHold指向进度条
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Icon(Icons.android,size: 100,),
          ],
        ));
  }
}
