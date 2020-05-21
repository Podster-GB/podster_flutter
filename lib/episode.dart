class Episode {
  final String title;
  final String mediaUrl;
  final String pubDate;
  final String duration;
  final String description;
  final bool isPlayed;
  final double lastPausedTimestamp;
  
  Episode({
    this.title, this.mediaUrl,
    this.pubDate, this.duration,
    this.description, this.isPlayed,
    this.lastPausedTimestamp
  });
}
