import 'package:custom_colorful_button/custom_button.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Colorful Button'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomButton(Colors.indigo, Colors.purple, Icons.notifications),
            CustomButton(Colors.teal, Colors.cyan, Icons.message),
            CustomButton(Colors.orange, Colors.amber, Icons.comment),
            CustomButton(Colors.yellow, Colors.lime, Icons.thumb_up),
          ],
        ),
      ),
    );
  }
}
