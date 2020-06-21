import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podster_flutter/components/msg_alert.dart';
import 'package:podster_flutter/components/rounded_button.dart';
import 'package:podster_flutter/constants.dart';
import 'package:podster_flutter/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = '/signup';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  String email;
  String password;
  String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/podster-logo.svg',
                semanticsLabel: 'Podster Logo',
                height: 200.0,
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
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
                textAlign: TextAlign.center,
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
                color: Colors.deepPurple[200],
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  try {
                    final AuthResult newUser =
                        await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    newUser != null
                        ? Navigator.pushNamed(context, HomeScreen.id)
                        : print('Failed to register $email');
                  } on PlatformException catch (error) {
                    switch (error.code) {
                      case 'ERROR_EMAIL_ALREADY_IN_USE':
                        errorMessage = error.message;
                        break;
                      default:
                        errorMessage = 'An unknown error occurred';
                    }
                    MessageAlert(context).build(
                      title: 'Sorry',
                      body: errorMessage,
                    );
                  }
                  setState(() {
                    _isLoading = false;
                  });
                },
                text: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
