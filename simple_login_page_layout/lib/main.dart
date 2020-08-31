import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_login_page_layout/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Login Page Layout',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
