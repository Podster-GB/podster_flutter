import 'dart:io';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:podster_flutter/model/search_result.dart';
import 'package:podster_flutter/screens/search_results_screen.dart';

class MockClient extends Mock implements http.Client {}

main() {
  test('file returns result count without using client', () async {
    final file = File('test_resources/search_result_podcast.json');
    final json = jsonDecode(await file.readAsString());
    expect(json['resultCount'], 1);
  });
  group('searchResult', () {
    test('returns a result if http call completes successfully', () async {
      final file = File('test_resources/search_result_podcast.json');
      final client = MockClient();
      when(
        client.get(
          'https://itunes.apple.com/lookup?id=1508985962',
        ),
      ).thenAnswer(
        (_) async => http.Response(await file.readAsString(), 200),
      );

      expect(await fetchSearchResult(client), isA<SearchResult>());
    });

    test('throws an exception if the http call completes with error', () async {
      final client = MockClient();
      when(
        client.get('https://itunes.apple.com/lookup?id=1508985962'),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => fetchSearchResult(client), throwsException);
    });

    test('results should be list', () {
      final file = File('test_resources/search_result_podcast.json');
      final client = MockClient();
      when(
        client.get(
          'https://itunes.apple.com/lookup?id=1508985962',
        ),
      ).thenAnswer(
        (_) async => http.Response(await file.readAsString(), 200),
      );
    });
  });
}
