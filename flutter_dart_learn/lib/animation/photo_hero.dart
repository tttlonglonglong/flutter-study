import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dart_learn/photoApp/photo_app_page.dart';

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  PhotoHero(this.photo, this.width, this.onTap);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          /// 让图片的背景透明
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.network(
                photo,
                fit: BoxFit.contain,
              ),
            )),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: PhotoHero(
            'https://raw.githubusercontent.com/flutter/website/master/examples/_animation/hero_animation/images/flippers-alpha.png',
            300.0, () {
          print('Hero 点击事件');
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Flippers Page'),
              ),
              body: Container(
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                child: PhotoHero(
                    'https://raw.githubusercontent.com/flutter/website/master/examples/_animation/hero_animation/images/flippers-alpha.png',
                    100.0, () {
                  print("点击了Hero的小图");
                  Navigator.of(context).pop();
                }),
              ),
            );
          }));
        }),
      ),
    );
  }
}
