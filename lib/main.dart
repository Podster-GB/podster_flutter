import 'package:flutter/material.dart';
import 'package:podster_flutter/constants.dart';
import 'package:podster_flutter/screens/home.dart';
import 'package:podster_flutter/screens/landing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podster Alpha',
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
        accentColor: ACCENT_COLOR,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Landing(),
        '/for_you': (context) => Home(),
      },
    );
  }
}
