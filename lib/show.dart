import 'package:flutter/material.dart';

/// A podcast show.
class Show {
  final String title;
  final String author;
  final String imageUrl;
  final String synopsis;
  final String genre;

  Show({
    @required this.title,
    this.author,
    @required this.imageUrl,
    this.synopsis,
    this.genre
  });
}
