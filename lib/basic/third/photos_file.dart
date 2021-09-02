import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotosFile extends StatefulWidget {
  const PhotosFile({Key? key}) : super(key: key);

  @override
  _PhotosFileState createState() => _PhotosFileState();
}

class _PhotosFileState extends State<PhotosFile> {
  bool _isHasData = false;
  late File _albumImage;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("访问原生相册"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _isHasData == false ? Text("暂无图片") : Image.file(_albumImage),
            ElevatedButton(
                onPressed: _getImage,
                child: Text("从相册获取图片")
            )
          ],
        ),
      ),
    );
  }

  ///通过ImageSource.gallery/ImageSource.camera来切换相册和相机
  Future _getImage() async {
    final pickerFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(pickerFile != null){
        _albumImage = File(pickerFile.path);
        _isHasData = true;
      } else {
        print("No image selected.");
      }
    });
  }
}

