import 'package:flutter/material.dart';
import 'package:podster_flutter/podcast.dart';

class PodcastSearch extends SearchDelegate<Podcast> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Icon(Icons.clear),
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
    return Container();
  }
}
