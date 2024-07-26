import 'package:flutter/material.dart';
import 'package:flutter_api/view/home/get_api_home.dart';
import 'package:flutter_api/view/home/home.dart';
import 'package:flutter_api/view/third_method.dart/third_method.dart';
import 'package:flutter_api/view/user/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThirdMethod(),
    );
  }
}
