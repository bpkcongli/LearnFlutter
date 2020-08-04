import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _displayNumber = '0';
  double _inputNumber;
  String _operator;

  void pressNumber(String number) {
    if (_displayNumber == '0' ||
        (double.parse(_displayNumber) == _inputNumber && _operator != null)) {
      _displayNumber = number;
    } else {
      _displayNumber += number;
    }
  }

  void clearDisplay() {
    _displayNumber = '0';
    _inputNumber = null;
    _operator = null;
  }

  void deleteNumber() {
    if (_displayNumber.length > 1) {
      _displayNumber = _displayNumber.substring(0, _displayNumber.length - 1);
    } else {
      _displayNumber = '0';
    }
  }

  void addComma() {
    if (!_displayNumber.contains('.')) _displayNumber += '.';
  }

  void setOperator(String op) {
    if (_operator == null) {
      _operator = op;
      _inputNumber = double.parse(_displayNumber);
    } else {
      calculate();
      _operator = op;
    }
  }

  num removeDotZero(double number) {
    var numberSplitted = number.toString().split('.');
    if (numberSplitted[1] == '0')
      return int.parse(numberSplitted[0]);
    else
      return number;
  }

  void plusMinus() {
    if (_displayNumber != '0') {
      if (!_displayNumber.contains('-')) {
        _displayNumber = '-' + _displayNumber;
      } else {
        _displayNumber = _displayNumber.substring(1);
      }
    }
  }

  void calculate() {
    switch (_operator) {
      case '+':
        _inputNumber += double.parse(_displayNumber);
        break;
      case '-':
        _inputNumber -= double.parse(_displayNumber);
        break;
      case 'X':
        _inputNumber *= double.parse(_displayNumber);
        break;
      case '/':
        _inputNumber /= double.parse(_displayNumber);
        break;
    }
    _displayNumber = removeDotZero(_inputNumber).toString();
    _operator = null;
  }

  Widget generateButton(String content,
      {int flexBasis = 1, Function onTapFunc}) {
    return Flexible(
      flex: flexBasis,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (onTapFunc == null) {
              pressNumber(content);
            } else if (onTapFunc == setOperator) {
              setOperator(content);
            } else {
              onTapFunc();
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            content,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Calculator'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    _displayNumber,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  color: Colors.black,
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            generateButton('C', onTapFunc: clearDisplay),
                            generateButton('Del', onTapFunc: deleteNumber),
                            generateButton('+/-', onTapFunc: plusMinus),
                            generateButton('/', onTapFunc: setOperator)
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            generateButton('7'),
                            generateButton('8'),
                            generateButton('9'),
                            generateButton('X', onTapFunc: setOperator)
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            generateButton('4'),
                            generateButton('5'),
                            generateButton('6'),
                            generateButton('-', onTapFunc: setOperator)
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            generateButton('1'),
                            generateButton('2'),
                            generateButton('3'),
                            generateButton('+', onTapFunc: setOperator)
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            generateButton('0', flexBasis: 2),
                            generateButton('.', onTapFunc: addComma),
                            generateButton('=', onTapFunc: calculate)
                          ],
                        ),
                      ),
                    ],
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
