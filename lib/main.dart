import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:podster_flutter/constants.dart';
import 'package:podster_flutter/screens/home_screen.dart';
import 'package:podster_flutter/screens/player_screen.dart';
import 'package:podster_flutter/screens/signin_screen.dart';
import 'package:podster_flutter/screens/signup_screen.dart';
import 'package:podster_flutter/screens/welcome_screen.dart';
import 'package:logger/logger.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Logger.level = Level.verbose;
    // Force portrait orientation.
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return MaterialApp(
      title: 'Podster',
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
        accentColor: ACCENT_COLOR,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        PlayerScreen.id: (context) => PlayerScreen(),
      },
    );
  }
}
