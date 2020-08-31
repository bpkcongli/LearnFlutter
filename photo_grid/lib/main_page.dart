import 'package:flutter/material.dart';
import 'package:photo_grid/asset_data.dart';
import 'package:photo_grid/preview_image.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        margin: EdgeInsets.all(1),
        child: ListView(
          children: displayImages(context),
        ),
      ),
    );
  }

  Widget rowImages(BuildContext context, List<List<String>> images) {
    List<Widget> result = [];
    for (var i = 0; i < images.length; i++) {
      result.add(buildImages(context, images[i]));
    }
    return Row(
      children: result,
    );
  }

  Widget buildImages(BuildContext context, List<String> imageInfo) {
    double initialHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight -
        8;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PreviewImage(imageInfo);
        }));
      },
      child: Hero(
        tag: 'Go to preview - ${imageInfo[0]}',
        child: Container(
          width: (MediaQuery.of(context).size.width - 8) / 3,
          height: initialHeight / 4,
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageInfo[1]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> displayImages(BuildContext context) {
    List<Widget> result = [];
    for (var i = 0; i < assetData.length / 3; i++) {
      result.add(rowImages(context, assetData.sublist(0 + 3 * i, 3 + 3 * i)));
    }
    return result;
  }
}
