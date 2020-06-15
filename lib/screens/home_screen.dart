import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1, // number of method calls to be displayed
    errorMethodCount: 8, // number of method calls if stacktrace is provided
    lineLength: 30, // width of the output
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
    printTime: false // Should each log print contain a timestamp
  ),
);

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
          : logger.w('User not signed in');
      logger.i('${signedInUser.email} signed in');
    } catch (e) {
      logger.e(e);
    }
  }

  void signOutWithGoogle() async {
    await googleSignIn.signOut();
    logger.i('Signed out using Google');
  }

  void getData() {
    String region = 'GB';
    String urlCuratedLists = 'https://api.spreaker.com/v2/explore/lists?country=$region';
    
  }

  @override
  void initState() {
    super.initState();
    fetchSignedInUser();
    getData();
  }

  void _selectBottomSheetItem(String name) {
    Navigator.pop(context); // Remove bottom sheet.

    if (googleSignIn.currentUser != null) {
      signOutWithGoogle();
      logger.i('Signed out using Google');
    } else {
      _auth.signOut();
      logger.i('${signedInUser.email} signed out');
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
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () => _onAvatarPress(),
            ),
          ],
          backgroundColor: Colors.deepPurple,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              tabs: <Widget>[
                Tab(
                  text: 'Trending',
                ),
                Tab(
                  text: 'Staff Picks',
                ),
                Tab(
                  text: 'Popular Shows',
                ),
                Tab(
                  text: 'News',
                ),
                Tab(
                  text: 'Entertainment',
                ),
                Tab(
                  text: 'Sports',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: Center(
                child: Text('Tab 1'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 2'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 3'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 4'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 5'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 6'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
