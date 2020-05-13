import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final String label;
  final Function onTap;

  TextButton({@required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        height: 45.0,
        width: 256.0,
        decoration: BoxDecoration(
          color: Color(0xFFE5E3FF),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
