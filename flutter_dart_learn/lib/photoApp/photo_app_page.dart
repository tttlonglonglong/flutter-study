import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

/// 【拍照APP开发】
class PhotoApp extends StatefulWidget {
  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  List<File> _images = [];

  Future getImage(bool isTakerPhoto) async {
    // 关闭弹窗
    Navigator.pop(context);
    // 根据是不是拍照动态的传递source
    var image = await ImagePicker.pickImage(
        source: isTakerPhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _images.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP拍照'),
        leading: GestureDetector(
          onTap: () {
            // 路由的跳出
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _genImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  void _pickImage(){
    print("点击了拍照1");
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 160,
              child: Column(
                children: <Widget>[
                  _item('拍照', true),
                  _item('从相册选择', false),
                ],
              ),
            ));
  }

  _item(String title, bool isTakerPhoto) {
    print("点击了拍照2");
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakerPhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title,textDirection: TextDirection.ltr),
        onTap: () => getImage(isTakerPhoto),
      ),
    );
  }

  _genImages() {
    return _images.map((file){
      return Stack(
        children: <Widget>[
          ClipRRect(
            // 圆角效果
            borderRadius: BorderRadius.circular(5),
            child: Image.file(file, width: 120, height: 90, fit: BoxFit.fill),
          ),
          Positioned(
            right: 5,
            top: 5,
            child:GestureDetector(
              onTap: (){
                setState(() {
                  _images.remove(file);
                });
              },
              child: ClipOval(
                // 圆角删除按钮
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Icon(Icons.close, size: 18, color: Colors.white,),
                ),
              ),
            ),
          )
        ],
      );
    }).toList();
  }
}
