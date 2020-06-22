import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podster_flutter/components/section_card.dart';
import 'package:logger/logger.dart';
import 'package:podster_flutter/components/chip_bar.dart';
import 'package:podster_flutter/playlist.dart';
import 'package:podster_flutter/podcast.dart';
import 'package:podster_flutter/services/spreaker/explore_api.dart';

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 1, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 30, // width of the output
      colors: true, // Colorful log messages
      printEmojis: false, // Print an emoji for each log message
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

  final ExploreAPI _exploreAPI = ExploreAPI();
  List<Playlist> _playlists = [];

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

  void _showBottomBar() {
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

  Future<List<Podcast>> getPodcasts(int playlistId) async {
    List<Podcast> podcasts = [];
    var httpClient = http.Client();
    List<dynamic> playlistPodcasts =
        await _exploreAPI.getCuratedListItems(httpClient, playlistId);
    for (var playlistPodcast in playlistPodcasts) {
      podcasts.add(
        Podcast(
          title: playlistPodcast['title'],
          imageUrl: playlistPodcast['image_url'],
        ),
      );
    }
    httpClient.close();
    return podcasts;
  }

  Future<List<Playlist>> getPlaylists() async {
    List<Playlist> playlists = [];
    var httpClient = http.Client();
    List<dynamic> curatedLists = await _exploreAPI.getCuratedLists(httpClient);
    for (var curatedList in curatedLists) {
      playlists.add(
        Playlist(
          id: curatedList['list_id'],
          name: curatedList['name'],
        ),
      );
    }
    httpClient.close();
    return playlists;
  }

  void getData() async {
    _playlists = await getPlaylists();
    for (Playlist playlist in _playlists) {
      playlist.podcasts = await getPodcasts(playlist.id);
    }
    logger.d('${_playlists.length} playlists initialised');
    setState(() {});
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.graphic_eq),
              onPressed: () => _showBottomBar(),
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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30.0),
              child: ChipBar(
                chips: _playlists,
                onChipSelect: (Playlist selectedPlaylist) async {
                  logger.d('\'${selectedPlaylist.name}\' selected on chip bar');
                  logger.d(
                      '${selectedPlaylist.podcasts.length} podcasts found in this playlist');
                  setState(() {});
                },
              ),
            ),
            backgroundColor: Colors.deepPurple,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (_playlists[index].podcasts == null) {
                  logger.e('Failed to show podcasts.');
                  return Center(
                    child: Text('No podcasts found.'),
                  );
                }

                return SectionCard(
                  title: _playlists[index].name,
                  podcasts: _playlists[index].podcasts,
                );
              },
              childCount: _playlists.length,
            ),
          ),
        ],
      ),
    );
  }
}
