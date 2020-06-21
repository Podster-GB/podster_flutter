import 'package:flutter/material.dart';

class MessageAlert  {
  final BuildContext context;

  MessageAlert(this.context);

  Future build({String title, String body}) {
    return showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        title: Text(title),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {},
            child: Text(body),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
