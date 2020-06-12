import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:podster_flutter/components/msg_alert.dart';
import 'package:podster_flutter/components/rounded_button.dart';
import 'package:podster_flutter/constants.dart';
import 'package:podster_flutter/screens/home_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String id = '/signin';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });

                  try {
                    AuthResult user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    user != null
                        ? Navigator.pushNamed(context, HomeScreen.id)
                        : print('Could not sign in $email');
                  } on PlatformException catch (error) {
                    switch (error.code) {
                      case "ERROR_INVALID_EMAIL":
                        errorMessage =
                            "Your email address appears to be malformed.";
                        break;
                      case "ERROR_WRONG_PASSWORD":
                        errorMessage = "Your password is wrong.";
                        break;
                      case "ERROR_USER_NOT_FOUND":
                        errorMessage = "User with this email doesn't exist.";
                        break;
                      case "ERROR_USER_DISABLED":
                        errorMessage =
                            "User with this email has been disabled.";
                        break;
                      case "ERROR_TOO_MANY_REQUESTS":
                        errorMessage = "Too many requests. Try again later.";
                        break;
                      case "ERROR_OPERATION_NOT_ALLOWED":
                        errorMessage =
                            "Signing in with Email and Password is not enabled.";
                        break;
                      default:
                        errorMessage = "An undefined Error happened.";
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
                text: 'Sign In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
