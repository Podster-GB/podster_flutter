import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podster_flutter/components/rounded_button.dart';
import 'package:podster_flutter/screens/signin_screen.dart';
import 'package:podster_flutter/screens/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: SvgPicture.asset(
                'assets/images/podster-logo.svg',
                semanticsLabel: 'Podster Logo',
                height: 150.0,
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextLiquidFill(
                      text: 'PODSTER',
                      waveColor: Colors.deepPurple[200],
                      boxBackgroundColor: Colors.white,
                      textStyle: TextStyle(
                        fontSize: 65.0,
                        fontWeight: FontWeight.w900,
                      ),
                      boxHeight: 250.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.deepPurple,
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.id);
              },
              text: 'Sign In',
            ),
            RoundedButton(
              color: Colors.deepPurple[200],
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.id);
              },
              text: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}
