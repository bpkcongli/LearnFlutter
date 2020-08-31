import 'package:flutter/material.dart';

class PreviewImage extends StatelessWidget {
  final List<String> imageInfo;
  PreviewImage(this.imageInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      appBar: AppBar(
        title: Text('Preview Image'),
        backgroundColor: Colors.teal,
      ),
      body: Hero(
        tag: 'Go to preview - ${imageInfo[0]}',
        child: Container(
          margin: EdgeInsets.all(30),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageInfo[1]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  color: Color(0xFF232323),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    imageInfo[0],
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      shadows: <Shadow>[
                        Shadow(
                          color: Colors.black,
                          offset: Offset(3.0, 3.0),
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
