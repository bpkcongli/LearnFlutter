import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _captions = [
    'Formasi bebatuan vulkanik yang tandus dan indah, Cappadocia, Turkey.',
    'Kota paling utara di dunia, Longyearbyen, Norwegia.',
    'Kota kuno dengan temuan mumi dan patung Raja Horus raksasanya, Luxor, Mesir.',
    'Kota tua di Afrika Utara dengan julukan Kota Merah, Marrakesh, Maroko.',
    'Negara kecil nan kaya di selatan Prancis, Monako.'
  ];
  final _images = [
    'images/cappadocia.jpg',
    'images/longyearbyen.jpg',
    'images/luxor.jpg',
    'images/marrakech.jpg',
    'images/monaco.jpeg',
  ];
  var _imagesAndCaptionsCounter = 0;

  Widget getImagesAndCaptions(int index) {
    String images = _images[index];
    String captions = _captions[index];

    return Column(
      children: <Widget>[
        Image(
          height: 300,
          image: AssetImage(images),
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Text(
            captions,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Carousel',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Carousel'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 50, 50, 50),
                padding: EdgeInsets.all(3),
                width: 300,
                child: getImagesAndCaptions(_imagesAndCaptionsCounter),
              ),
              Container(
                width: 300,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                        child: RaisedButton(
                          child: Text('Previous'),
                          onPressed: () {
                            setState(() {
                              _imagesAndCaptionsCounter =
                                  (_imagesAndCaptionsCounter - 1 < 0)
                                      ? _images.length - 1
                                      : _imagesAndCaptionsCounter - 1;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: RaisedButton(
                          child: Text('Next'),
                          onPressed: () {
                            setState(() {
                              _imagesAndCaptionsCounter =
                                  (_imagesAndCaptionsCounter + 1 >
                                          _images.length - 1)
                                      ? 0
                                      : _imagesAndCaptionsCounter + 1;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
