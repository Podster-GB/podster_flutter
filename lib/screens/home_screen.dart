import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podster_flutter/components/section_card.dart';
import '../mock_data.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseUser signedInUser;

  void fetchSignedInUser() async {
    try {
      final FirebaseUser _signedInUser = await _auth.currentUser();
      _signedInUser != null
          ? signedInUser = _signedInUser
          : print('User not signed in');
      print('${signedInUser.email} signed in');
    } catch (e) {
      print(e);
    }
  }

  void signOutWithGoogle() async {
    await googleSignIn.signOut();
    print('Signed out using Google');
  }

  @override
  void initState() {
    super.initState();
    fetchSignedInUser();
  }

  @override
  Widget build(BuildContext context) {
    MockData mockDataProvider = MockData(context);

    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _auth.signOut();
              signOutWithGoogle();
              print('${signedInUser.email} signed out');
              Navigator.pop(context);
            },
          ),
        ],
        title: Text('Home'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SectionCard(
              title: 'For You',
              podcasts: mockDataProvider.podcasts,
            ),
            SectionCard(
              title: 'Continue Listening',
              podcasts: mockDataProvider.podcasts,
            )
          ],
        ),
      ),
    );
  }
}
