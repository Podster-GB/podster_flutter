import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:podster_flutter/services/spreaker/explore_api.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('Explore API', () {
    test('returns curated lists if http call completes successfully', () async {
      final mockClient = MockClient();
      final file = File('test_resources/curated_lists.json');
      final ExploreAPI api = ExploreAPI();
      String endpointUrl =
          '$baseUrl/$version/$endpointName/$contentFormat?country=$country';

      when(mockClient.get(endpointUrl)).thenAnswer(
          (_) async => http.Response(await file.readAsString(), 200));

      expect(
          await api.getCuratedLists(mockClient), isA<Map<String, dynamic>>());
    });

    test('curated lists length should not be 0', () async {
      final mockClient = MockClient();
      final file = File('test_resources/curated_lists.json');
      final ExploreAPI api = ExploreAPI();
      String endpointUrl =
          '$baseUrl/$version/$endpointName/$contentFormat?country=$country';

      when(mockClient.get(endpointUrl)).thenAnswer(
          (_) async => http.Response(await file.readAsString(), 200));

      Map<String, dynamic> response = await api.getCuratedLists(mockClient);
      List<dynamic> items = response['response']['items'];
      expect(items.length, isNot(0));
    });

    test('curated lists item should have type shows', () async {
      final mockClient = MockClient();
      final file = File('test_resources/curated_lists.json');
      final ExploreAPI api = ExploreAPI();
      String endpointUrl =
          '$baseUrl/$version/$endpointName/$contentFormat?country=$country';

      when(mockClient.get(endpointUrl)).thenAnswer(
          (_) async => http.Response(await file.readAsString(), 200));

      final Map<String, dynamic> curatedListItems =
          await api.getCuratedLists(mockClient);
      List<dynamic> items = curatedListItems['response']['items'];
      String type = items[0]['type'];

      expect(type, 'shows');
    });

    test('curated list items length should not be 0', () async {
      final mockClient = MockClient();
      final file = File('test_resources/curated_list_items.json');
      final ExploreAPI api = ExploreAPI();
      final int listId = 108; // id for "Featured This Week"
      String endpointUrl =
          '$baseUrl/$version/$endpointName/$contentFormat/$listId/items';

      when(mockClient.get(endpointUrl)).thenAnswer(
          (_) async => http.Response(await file.readAsString(), 200));

      final List<dynamic> curatedListItems =
          await api.getCuratedListItems(mockClient, listId);

      expect(curatedListItems.length, isNot(0));
    });

    test('curated list item show id is not null', () async {
      final mockClient = MockClient();
      final file = File('test_resources/curated_list_items.json');
      final ExploreAPI api = ExploreAPI();
      final int listId = 108; // id for "Featured This Week"
      String endpointUrl =
          '$baseUrl/$version/$endpointName/$contentFormat/$listId/items';

      when(mockClient.get(endpointUrl)).thenAnswer(
          (_) async => http.Response(await file.readAsString(), 200));
      
      final List<dynamic> curatedListItem = await api.getCuratedListItems(mockClient, listId);
      var item = curatedListItem[0];
      var showId = item['show_id'];

      expect(showId, isNot(null));
    });
  });
}
