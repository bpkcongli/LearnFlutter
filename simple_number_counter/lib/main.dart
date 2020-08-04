import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _number = 0;
  var _bgcolor = Color.fromARGB(255, 255, 255, 255);
  final _random = Random();

  void addingNumber() {
    setState(() {
      _number += 1;
      _bgcolor = Color.fromARGB(255, _random.nextInt(255), _random.nextInt(255),
          _random.nextInt(255));
    });
  }

  void resetNumber() {
    setState(() {
      _number = 0;
      _bgcolor = Color.fromARGB(255, 255, 255, 255);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Number Counter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Number Counter'),
        ),
        body: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            color: _bgcolor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_number.toString(), style: TextStyle(fontSize: 24)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text('Reset'),
                        onPressed: resetNumber,
                      ),
                    ),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text('Tambah'),
                      onPressed: addingNumber,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
