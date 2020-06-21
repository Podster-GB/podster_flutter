import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final String label;
  final Function onTap;

  LinkButton({@required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}