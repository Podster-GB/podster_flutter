import 'dart:io';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:podster_flutter/model/feed.dart';
import 'package:podster_flutter/screens/tabs/trending.dart';

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
      when(client.get(
              'https://rss.itunes.apple.com/api/v1/gb/podcasts/top-podcasts/all/10/explicit.json'))
          .thenAnswer(
              (_) async => http.Response(await file.readAsString(), 200));

      expect(await fetchFeed(client), isA<Feed>());
    });

    test('throws an exception if the http call completes with error', () async {
      final client = MockClient();

      when(client.get(
              'https://rss.itunes.apple.com/api/v1/gb/podcasts/top-podcasts/all/10/explicit.json'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => fetchFeed(client), throwsException);
    });

    test('returns title as "Top Podcasts"', () async {
      final file = File('test_resources/top_podcasts_feed.json');
      final client = MockClient();
      when(
        client.get(
          'https://rss.itunes.apple.com/api/v1/gb/podcasts/top-podcasts/all/10/explicit.json',
        ),
      ).thenAnswer(
        (_) async => http.Response(await file.readAsString(), 200),
      );

      Feed feed = await fetchFeed(client);
      expect(feed.title, 'Top Podcasts');
    });

    test('returns author as map', () async {
      final file = File('test_resources/top_podcasts_feed.json');
      final client = MockClient();
      when(
        client.get(
          'https://rss.itunes.apple.com/api/v1/gb/podcasts/top-podcasts/all/10/explicit.json',
        ),
      ).thenAnswer(
        (_) async => http.Response(await file.readAsString(), 200),
      );

      Feed feed = await fetchFeed(client);
      expect(feed.author, isA<Map>());
    });

    test('updated should be datetime', () async {
      final file = File('test_resources/top_podcasts_feed.json');
      final client = MockClient();
      when(
        client.get(
          'https://rss.itunes.apple.com/api/v1/gb/podcasts/top-podcasts/all/10/explicit.json',
        ),
      ).thenAnswer(
        (_) async => http.Response(await file.readAsString(), 200),
      );

      Feed feed = await fetchFeed(client);
      expect(feed.updated, isA<DateTime>());
    });


  });
}
