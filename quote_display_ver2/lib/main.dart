import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _random = Random();
  final _quotes = <String>[
    'Berjuanglah sampai titik darah penghabisan. Karena jalan kehidupan masih panjang.',
    'Berhentilah mengeluh. Masih banyak orang di luar sana yang tidak seberuntung dirimu.',
    'Mundur selangkah untuk maju tiga langkah. Hidup itu bak mengatur strategi.',
    'Siapa bilang kita tidak boleh balas dendam. Balas dendamlah dengan cara yang \'cantik\'.',
    'Kita hidup di dunia di mana semua yang kamu tahu selama ini hanyalah kebohongan dan omong kosong belaka.',
    'Dan ingatlah, sejarah itu ditorehkan oleh para pemenang.',
    'Janganlah kau lari dari kenyataan, sungguh kau hanya berlari di tempat yang sama.',
    'Bahkan jalan tikus yang terlihat sempit dan kumuh, kelak menjadi jalan menuju kesuksesan.',
    'Bahkan ketika kau sedang muram, setidaknya nikmatilah sejenak dunia ciptaan Tuhan ini.',
    'Rebahkan tubuhmu sejenak, tataplah langit, dan katakanlah di dalam hatimu, aku akan mengubah dunia ini menjadi lebih baik.'
  ];
  var _quotesIndex = 0;

  void nextQuote() {
    int index;
    do {
      index = _random.nextInt(_quotes.length);
    } while (index == _quotesIndex);
    _quotesIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes Display',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quotes Display'),
        ),
        body: AnimatedContainer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    _quotes[_quotesIndex],
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                RaisedButton(
                  child: Text('Next Quotes'),
                  onPressed: () {
                    setState(() => nextQuote());
                  },
                )
              ],
            ),
          ),
          duration: Duration(seconds: 1),
          color: Color.fromARGB(255, _random.nextInt(256), _random.nextInt(256),
              _random.nextInt(256)),
        ),
      ),
    );
  }
}
