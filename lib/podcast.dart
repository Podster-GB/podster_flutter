/// A podcast show. 
/// 
/// See also: 
/// * [Episode], which is the class holding all metadata on an episode.
class Podcast {

  /// the name of this show.
  final String title;

  /// the description of this show.
  final String synopsis;

  /// a network url pointing to an image representing this show's cover.
  final String imageUrl;

  /// the category this show belongs to. For example: sports.
  final String genre;

  /// episodes that belong to this show.
  final List<Episode> episodes;

  /// indicates the number of times this show has been played by all users.
  int _playCount = 0;

  Podcast({
    this.title, this.synopsis,
    this.imageUrl, this.genre,
    this.episodes,
  });

  bool isTrending() {
    return _playCount >= 5 ? true : false;
  }

  void play() {
    _playCount++;
  }
}

class Episode {
  final String title;
  final String mediaUrl;
  final String pubDate;
  final String duration;
  final String description;
  final bool isPlayed;
  final int lastPausedTimestamp;
  
  Episode({
    this.title, this.mediaUrl,
    this.pubDate, this.duration,
    this.description, this.isPlayed, 
    this.lastPausedTimestamp
  });
}