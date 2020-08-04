import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _random = Random();

  Widget generateBox() {
    return Flexible(
      flex: 1 + _random.nextInt(3),
      child: AnimatedContainer(
        margin: EdgeInsets.all(5),
        color: Color.fromARGB(255, _random.nextInt(256), _random.nextInt(256),
            _random.nextInt(256)),
        duration: Duration(seconds: 1),
      ),
    );
  }

  Widget generateRow() {
    return Flexible(
      flex: 1 + _random.nextInt(3),
      child: Row(
        children: <Widget>[
          generateBox(),
          generateBox(),
          generateBox(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible and Gesture',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flexible and Gesture'),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                generateRow(),
                generateRow(),
                generateRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
