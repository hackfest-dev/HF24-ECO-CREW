import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class DisplayPictureScreen extends StatelessWidget {
  final XFile image;
  final String imagePath;

  const DisplayPictureScreen(
      {Key? key, required this.image, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}
