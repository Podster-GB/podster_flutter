import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:podster_flutter/components/rounded_button.dart';
import 'package:podster_flutter/constants.dart';

class SignInScreen extends StatefulWidget {
  static const String id = '/signin';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              'assets/images/podster-logo.svg',
              semanticsLabel: 'Podster logo',
              height: 200.0,
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: textFieldDecoration.copyWith(
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: textFieldDecoration.copyWith(
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              color: Colors.deepPurple,
              onPressed: () {
                // TODO: impl Firebase signin.
              },
              text: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }
}