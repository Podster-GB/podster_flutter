import 'package:flutter/material.dart';
import 'package:podster_flutter/constants.dart';

class GenreTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onTap;

  GenreTile({@required this.label, @required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 80.0,
            width: 140.0,
            decoration: BoxDecoration(
              // design spec shows multi-coloured tiles
              // but using ACCENT_COLOR due to ambiguity
              color: ACCENT_COLOR,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(label),
                ),
                Expanded(
                  child: Icon(icon),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
