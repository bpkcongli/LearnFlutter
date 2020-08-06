import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple AppBar and Card',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 60, 60, 60),
        appBar: AppBar(
          leading: Icon(Icons.flight),
          title: Text('Simple AppBar and Card'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
            IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {})
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 233, 30, 99),
                  Color.fromARGB(255, 33, 150, 243)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              image: DecorationImage(
                image: AssetImage('patterns/cube-pattern.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: Container(
          height: 150,
          child: Card(
            elevation: 5,
            margin: EdgeInsets.all(15),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconWithText(Icons.favorite_border, 'Favorite'),
                  IconWithText(Icons.music_note, 'Music'),
                  IconWithText(Icons.videocam, 'Video')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconWithText extends StatefulWidget {
  final IconData _iconData;
  final String _text;

  IconWithText(this._iconData, this._text);

  @override
  _IconWithTextState createState() => _IconWithTextState();
}

class _IconWithTextState extends State<IconWithText> {
  var _iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(widget._iconData, size: 36, color: _iconColor),
            onPressed: () {
              setState(() {
                _iconColor =
                    (_iconColor == Colors.black) ? Colors.red : Colors.black;
              });
            },
          ),
          Text(widget._text, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
