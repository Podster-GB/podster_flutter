import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:podster_flutter/podcast.dart';

class PodcastSearch extends SearchDelegate<Podcast> {
  final titles = [
    'Joe Rogan Experience',
    'GABA',
    'Monday Morning Podcast',
    'The Intelligence',
    'Naval',
    'Today in Focus',
    'Waveform: The MKBHD Podcast',
    'POLITICO Dispatch'
  ];

  final recentTitles = ['Naval', 'GABA'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? recentTitles : titles;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestions[index]),
        trailing: Transform.rotate(
          angle: 310 * math.pi / 180,
          child: InkWell(
            child: Icon(Icons.arrow_upward),
            onTap: () {
              query = suggestions[index];
            },
          ),
        ),
      ),
    );
  }
}


