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
              child: ControlButtons(),
            ),
          ],
        ),
      ),
    );
  }
}

class ControlButtons extends StatelessWidget {
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
          onPressed: () => null,
          icon: Icon(Icons.play_arrow),
        ),
        IconButton(
          onPressed: () => null,
          icon: Icon(Icons.forward_10),
        ),
      ],
    );
  }
}
