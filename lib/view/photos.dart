import 'package:flutter/material.dart';

class PhotosExample extends StatelessWidget {
  PhotosExample({super.key});
  List<Photos> photoList = [];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Photos {
  String title, url;
  Photos({required this.title, required this.url});
}
