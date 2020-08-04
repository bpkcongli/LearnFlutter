import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _pairsOfColorAndImage = {
    Colors.blue: 'images/car-blue.png',
    Colors.cyan: 'images/car-cyan.png',
    Colors.green: 'images/car-green.png',
    Colors.orange: 'images/car-orange.png',
    Colors.red: 'images/car-red.png',
    Colors.white: 'images/car-white.png'
  };
  Color _targetColor = Colors.blue;

  List<Widget> palletes() {
    var results = <Widget>[];
    _pairsOfColorAndImage.keys.forEach((element) {
      results.add(Draggable<Color>(
        data: element,
        child: SizedBox(
          width: 50,
          height: 50,
          child: Material(
            color: element,
            shape: StadiumBorder(),
            elevation: 5,
          ),
        ),
        childWhenDragging: SizedBox(
          width: 50,
          height: 50,
          child: Material(
            color: Colors.grey,
            shape: StadiumBorder(),
            elevation: 5,
          ),
        ),
        feedback: SizedBox(
          width: 50,
          height: 50,
          child: Material(
            color: element.withOpacity(0.7),
            shape: StadiumBorder(),
          ),
        ),
      ));
    });
    return results;
  }

  Widget getCar(Color color) {
    return Image(
      image: AssetImage(_pairsOfColorAndImage[color]),
      width: 300,
      height: 150,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Color Pallete',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Color Pallete'),
        ),
        body: Container(
          color: Color.fromARGB(255, 50, 50, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: palletes(),
              ),
              DragTarget<Color>(
                onWillAccept: (value) => true,
                onAccept: (value) {
                  _targetColor = value;
                },
                builder: (context, candidateData, rejectedData) {
                  return getCar(_targetColor);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
