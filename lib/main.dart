import 'package:flutter/material.dart';
import 'package:podster_flutter/screens/for_you.dart';
import 'package:podster_flutter/screens/landing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podster',
      theme: ThemeData(
        primaryColor: Colors.purple[50],
        accentColor: Colors.purple[200],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Landing(),
        '/for_you': (context) => ForYou(),
      },
    );
  }
}
