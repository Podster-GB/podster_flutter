import 'package:podster_flutter/podcast.dart';

/// Represents a curated list.
class Playlist {
  /// The curated list id.
  int id;

  /// The curated list name.
  String name;

  /// The podcasts belonging to this curated list.
  List<Podcast> podcasts;

  Playlist({this.id, this.name, this.podcasts});
}
