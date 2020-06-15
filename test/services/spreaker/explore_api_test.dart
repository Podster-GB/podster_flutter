import 'package:flutter_test/flutter_test.dart';
import 'package:podster_flutter/services/spreaker/explore_api.dart';

void main() {
  group('Explore API', () {
    test('curated lists length should not be 0', () async {
      final ExploreAPI api = ExploreAPI();

      final Map<String, dynamic> curatedLists = await api.getCuratedLists();

      expect(curatedLists.length, isNot(0));
    });

    test('curated list items length should not be 0', () async {
      final ExploreAPI api = ExploreAPI();

      final List<dynamic> curatedListItems = await api.getCuratedListItems(108);

      expect(curatedListItems.length, isNot(0));
    });

    test('curated list item show id is not null', () async {
      final ExploreAPI api = ExploreAPI();

      final List<dynamic> curatedListItem = await api.getCuratedListItems(108);
      var item = curatedListItem[0];
      var showId = item['show_id'];

      expect(showId, isNot(null));
    });
  });
}
