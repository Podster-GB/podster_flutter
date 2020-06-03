import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:podster_flutter/model/search_result.dart';

Future<SearchResult> fetchSearchResult(http.Client client) async {
  final response = await client.get(
    'https://itunes.apple.com/lookup?id=1508985962',
  );
  if (response.statusCode == 200) {
    return SearchResult.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load search result as http response was not 200');
  }
}

class SearchResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Search Result Screen'),
    );
  }
}