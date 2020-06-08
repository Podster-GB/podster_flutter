import 'dart:convert';

import 'package:podster_flutter/model/feed.dart';
import 'package:http/http.dart' as http;

const String topTenUkPodcastsUrl =
    'https://rss.itunes.apple.com/api/v1/gb/podcasts/top-podcasts/all/10/explicit.json';

class FeedGenerator {

  Future<Feed> fetchFeed(http.Client client) async {
    final response = await client.get(topTenUkPodcastsUrl);

    if (response.statusCode == 200) {
      return Feed.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load feed as http response was not 200');
    }
  }
}
