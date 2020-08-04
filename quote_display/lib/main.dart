import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _quotes = <String>[
    'Berjuanglah sampai titik darah penghabisan. Karena jalan kehidupan masih panjang.',
    'Berhentilah mengeluh. Masih banyak orang di luar sana yang tidak seberuntung dirimu.',
    'Mundur selangkah untuk maju tiga langkah. Hidup itu bak mengatur strategi.',
    'Siapa bilang kita tidak boleh balas dendam. Balas dendamlah dengan cara yang \'cantik\'.',
    'Kita hidup di dunia di mana semua yang kamu tahu selama ini hanyalah kebohongan dan omong kosong belaka.'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quote Display',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quote Display'),
        ),
        body: Container(
          color: Color(0xFF222222),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _quotes.map((quote) {
              return Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 50.0,
                ),
                child: Text(
                  quote,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
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
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
