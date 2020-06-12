import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
                  } catch (error) {
                    print(error);
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
