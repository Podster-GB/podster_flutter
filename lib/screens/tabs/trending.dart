import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';
import 'package:podster_flutter/components/list_item.dart';
import 'package:podster_flutter/model/feed.dart';
import 'package:podster_flutter/podcast.dart';
import 'package:podster_flutter/services/feed_generator.dart';

import 'package:http/http.dart' as http;

class TrendingTabView extends StatefulWidget {
  final List<BannerTile> popularThisWeek;
  final List<ListItem> popularThisMonth;

  TrendingTabView(
      {@required this.popularThisWeek, @required this.popularThisMonth});

  @override
  State<StatefulWidget> createState() => _TrendingTabViewState();
}

class _TrendingTabViewState extends State<TrendingTabView> {
  FeedGenerator feedGenerator = FeedGenerator();
  List<Podcast> topPodcasts = [];

  void updateUI() async {
    List<dynamic> feedItems;
    http.Client httpClient = http.Client();
    Feed feed = await feedGenerator.fetchFeed(httpClient);
    feed != null
        ? feedItems = feed.results
        : print('[ERROR] Feed returned no results!');
    for (Map<String, dynamic> feedItem in feedItems) {
      topPodcasts.add(
        Podcast(
          title: feedItem['name'],
          author: feedItem['artistName'],
          imageUrl: feedItem['artworkUrl100'],
          genre: feedItem['genres'][0]['name'],
        ),
      );
    }
    setState((){});
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Popular This Week',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            height: 180.0,
            padding: EdgeInsets.all(15.0),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: widget.popularThisWeek.length,
              separatorBuilder: (context, index) => SizedBox(
                width: 5.0,
              ),
              itemBuilder: (context, index) =>
                  widget.popularThisWeek[index].buildTile(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Top Podcasts',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15.0),
            child: ListView.separated(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: topPodcasts.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 5.0,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(topPodcasts[index].imageUrl),
                    title: Text(topPodcasts[index].title),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
