import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  double getSmallCircleDiameter(BuildContext context) {
    return MediaQuery.of(context).size.width * 2 / 3;
  }

  double getLargeCircleDiameter(BuildContext context) {
    return MediaQuery.of(context).size.width * 7 / 8;
  }

  Widget getCustomTextField(String label, bool isPassword) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFDE6262),
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Color(0xFFDE6262),
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -getSmallCircleDiameter(context) / 3,
            top: -getSmallCircleDiameter(context) / 3,
            child: Container(
              height: getSmallCircleDiameter(context),
              width: getSmallCircleDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFDE6262), Color(0xFFFFB88C)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: -getLargeCircleDiameter(context) / 4,
            top: -getLargeCircleDiameter(context) / 4,
            child: Container(
              height: getLargeCircleDiameter(context),
              width: getLargeCircleDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFD45757), Color(0xFFFFB88C)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            right: -getLargeCircleDiameter(context) / 2,
            bottom: -getLargeCircleDiameter(context) / 2,
            child: Container(
              height: getLargeCircleDiameter(context),
              width: getLargeCircleDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFCBAB),
              ),
            ),
          ),
          Positioned(
            left: getLargeCircleDiameter(context) / 6,
            top: getLargeCircleDiameter(context) / 4,
            child: Container(
              child: Text(
                'Tumbuh\nSeribu',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: Color(0xFF942E2E),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.fromLTRB(
                    20,
                    MediaQuery.of(context).size.height * 0.4,
                    20,
                    10,
                  ),
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
                  child: Column(
                    children: <Widget>[
                      getCustomTextField('Email', false),
                      getCustomTextField('Password', true),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 20, bottom: 40),
                    child: Text(
                      'Lupa Password?',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFFDE6262),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFD45757), Color(0xFFFFB88C)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              splashColor: Color(0xFFFFCBAB),
                              borderRadius: BorderRadius.circular(7),
                              child: Center(
                                child: Text(
                                  'Masuk',
                                  style: TextStyle(
                                    color: Color(0xFF3A3A3A),
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/google.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        mini: true,
                        elevation: 0,
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/github.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        mini: true,
                        elevation: 0,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Belum punya akun? ',
                        style: TextStyle(
                          color: Color(0xFF3A3A3A),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Text(
                        'Kuy Daftar!',
                        style: TextStyle(
                          color: Color(0xFFDE6262),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
