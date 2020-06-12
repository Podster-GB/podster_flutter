import 'package:flutter/material.dart';

const PRIMARY_COLOR = Color(0xFFF2F1FF);
const ACCENT_COLOR = Color(0xFF8886B4);

const SHOW_DETAIL_HEADING_TEXTSTYLE = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const textFieldDecoration = InputDecoration(
  hintText: 'Type here...',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
