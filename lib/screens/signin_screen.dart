import 'package:google_sign_in/google_sign_in.dart';
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
  final GoogleSignIn _authGoogle = GoogleSignIn();
  bool _isLoading = false;
  String email;
  String password;
  String errorMessage;

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount _googleAccount = await _authGoogle.signIn();
    final GoogleSignInAuthentication _googleAuth =
        await _googleAccount.authentication;

    final AuthCredential _googleCredentials = GoogleAuthProvider.getCredential(
      accessToken: _googleAuth.accessToken,
      idToken: _googleAuth.idToken,
    );

    final AuthResult _authRes =
        await _auth.signInWithCredential(_googleCredentials);

    final FirebaseUser user = _authRes.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }

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
                  } catch (error) {
                    if (email == null || password == null) {
                      MessageAlert(context).build(
                        title: 'Could not sign in',
                        body:
                            'Check that you have entered a valid email address and password.',
                      );
                    }
                    print(error);
                  }
                  setState(() {
                    _isLoading = false;
                  });
                },
                text: 'Sign In',
              ),
              SizedBox(
                height: 14.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  height: 1.0,
                  width: 130.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              OutlineButton(
                onPressed: () {
                  signInWithGoogle().whenComplete(() {
                    Navigator.pushNamed(context, HomeScreen.id);
                  });
                },
                splashColor: Colors.deepPurple[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                highlightElevation: 0,
                borderSide: BorderSide(color: Colors.deepPurple[200]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: AssetImage("assets/images/google-logo.png"),
                          height: 25.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurple,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
