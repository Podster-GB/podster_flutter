import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podster_flutter/components/rounded_button.dart';

import '../constants.dart';

class WelcomeScreen extends StatefulWidget {
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
            SvgPicture.asset(
              'assets/images/podster-logo.svg',
              semanticsLabel: 'Podster Logo',
              height: 150.0,
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
              color: Colors.purple[900],
              onPressed: () {},
              text: 'Sign In',
            ),
            RoundedButton(
              color: Colors.deepPurple[200],
              onPressed: () {},
              text: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}
