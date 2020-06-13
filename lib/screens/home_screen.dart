import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  void _selectBottomSheetItem(String name) {
    Navigator.pop(context); // Remove bottom sheet.

    if (googleSignIn.currentUser != null) {
      signOutWithGoogle();
      print('Signed out using Google');
    } else {
      _auth.signOut();
      print('${signedInUser.email} signed out');
    }
    
    Navigator.pop(context); // Go to sign in screen.
  }

  void _onAvatarPress() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Container(
            child: _buildBottomSheetMenuItems(),
          ),
        );
      },
    );
  }

  Column _buildBottomSheetMenuItems() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.close),
          title: Text('Sign Out'),
          onTap: () => _selectBottomSheetItem('signout'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () => _onAvatarPress(),
            ),
            // GestureDetector(
            //   onTap: () => _onAvatarPress(),
            //   child: CircleAvatar(
            //     radius: 20.0,
            //     backgroundColor: Colors.deepPurple[200],
            //     child: ClipOval(
            //       child: _getProfilePic(),
            //     ),
            //   ),
            // ),
          ],
          title: Text('Home'),
          backgroundColor: Colors.deepPurple[200],
        ),
        body: Center(
          child: Text('Tap avatar for more options.'),
        ),
      ),
    );
  }
}
