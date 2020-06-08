import 'dart:io';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:podster_flutter/model/feed.dart';
import 'package:podster_flutter/services/feed_generator.dart';

class MockClient extends Mock implements http.Client {}

main() {
  test('returns feed title using cached file JSON string', () async {
    final file = File('test_resources/top_podcasts_feed.json');
    final json = jsonDecode(await file.readAsString());
    final feed = json['feed'];
    final title = feed['title'];

    expect(title, 'Top Podcasts');
  });

  group('fetchFeed', () {
    test('returns a feed if http call completes successfully', () async {
      final file = File('test_resources/top_podcasts_feed.json');
      final client = MockClient();
      final feedGenerator = FeedGenerator();

      when(client.get(topTenUkPodcastsUrl))
          .thenAnswer(
              (_) async => http.Response(await file.readAsString(), 200));
              
      expect(await feedGenerator.fetchFeed(client), isA<Feed>());
    });

    test('throws an exception if the http call completes with error', () async {
      final client = MockClient();
      final feedGenerator = FeedGenerator();

      when(client.get(topTenUkPodcastsUrl))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => feedGenerator.fetchFeed(client), throwsException);
    });

    test('returns title as "Top Podcasts"', () async {
      final file = File('test_resources/top_podcasts_feed.json');
      final client = MockClient();
      final feedGenerator = FeedGenerator();

      when(
        client.get(topTenUkPodcastsUrl),
      ).thenAnswer(
        (_) async => http.Response(await file.readAsString(), 200),
      );

      Feed feed = await feedGenerator.fetchFeed(client);
      expect(feed.title, 'Top Podcasts');
    });

    test('returns author as map', () async {
      final file = File('test_resources/top_podcasts_feed.json');
      final client = MockClient();
      final feedGenerator = FeedGenerator();

      when(
        client.get(topTenUkPodcastsUrl),
      ).thenAnswer(
        (_) async => http.Response(await file.readAsString(), 200),
      );

      Feed feed = await feedGenerator.fetchFeed(client);
      expect(feed.author, isA<Map>());
    });

    test('updated should be datetime', () async {
      final file = File('test_resources/top_podcasts_feed.json');
      final client = MockClient();
      final feedGenerator = FeedGenerator();

      when(
        client.get(topTenUkPodcastsUrl),
      ).thenAnswer(
        (_) async => http.Response(await file.readAsString(), 200),
      );

      Feed feed = await feedGenerator.fetchFeed(client);
      expect(feed.updated, isA<DateTime>());
    });
  });
}
