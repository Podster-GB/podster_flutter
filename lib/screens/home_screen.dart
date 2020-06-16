import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:podster_flutter/components/chip_bar.dart';
import 'package:podster_flutter/services/spreaker/explore_api.dart';

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
  List<dynamic> _curatedListItems = [];
  List<String> _curatedListNames = [];

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

  void getData() async {
    final ExploreAPI exploreAPI = ExploreAPI();
    var httpClient = http.Client();
    _curatedListItems = await exploreAPI.getCuratedLists(httpClient);
    logger.d(_curatedListItems);
    setState(() {});
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
  void initState() {
    super.initState();
    fetchSignedInUser();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.graphic_eq),
          onPressed: () => _onAvatarPress(), // TODO: show bottom modal.
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {}, // TODO: Implement search podcast by show name
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {}, // TODO: Navigate to notifications screen
          ),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ChipBar(
          chipTitles: _curatedListItems
              .map((mapItem) => mapItem['name'].toString())
              .toList(),
        ),
      ),
    );
  }
}
