import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 1, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 30, // width of the output
      colors: true, // Colorful log messages
      printEmojis: false, // Print an emoji for each log message
      printTime: true // Should each log print contain a timestamp
      ),
);

class PlayerScreen extends StatelessWidget {
  static const String id = '/player';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 9,
              child: Placeholder(),
            ),
            Flexible(
              child: PlayerControls(),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerControls extends StatefulWidget {
  @override
  _PlayerControlsState createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls> {
  AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    // AudioPlayer.logEnabled = true;
    _audioPlayer = AudioPlayer(playerId: 'id-podster-001');
    super.initState();
  }

  void play(String url) async {
    int result = await _audioPlayer.play(url);
    if (result == 1) {
      // success
      logger.d('player result: $result');
    }
  }

  void pause() async {
    int result = await _audioPlayer.pause();
    logger.d('player result: $result');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () => null,
          icon: Icon(Icons.replay_10),
        ),
        IconButton(
          onPressed: () {
            final url = 'https://traffic.libsyn.com/joeroganexp/p1507.mp3';
            if (_isPlaying) {
              pause();
            } else {
              play(url);
            }
            setState(() => _isPlaying = !_isPlaying);
          },
          icon: _isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
        ),
        IconButton(
          onPressed: () => null,
          icon: Icon(Icons.forward_10),
        ),
      ],
    );
  }
}
