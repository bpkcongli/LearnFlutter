import 'package:flutter/material.dart';
import 'package:photo_grid/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Gallery',
      home: MainPage(),
    );
  }
}
