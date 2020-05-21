import 'package:flutter/material.dart';
import 'package:podster_flutter/components/list_item.dart';

class EpisodeItem implements ListItem {
  final String title;
  final String pubDate;
  final String duration;
  final String description;
  final bool isPlayed;
  final int lastPausedTimestamp;

  EpisodeItem({
    @required this.title, @required this.pubDate,
    @required this.duration, @required this.description,
    this.isPlayed, this.lastPausedTimestamp
  });

  @override
  Widget buildTile(BuildContext context) {
    // Custom list tile will be used in a future version to accomodate all metadata such as duration.
    return ListTile(
      title: Text(title),
      subtitle: Text(description.substring(0, 35) + '...'), // Limit to 30 chars.
      trailing: isPlayed ? Icon(Icons.more_vert) : Icon(Icons.cloud_download),
    );
  }
}