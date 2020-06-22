import 'package:flutter/material.dart';
import 'package:podster_flutter/podcast.dart';
import 'package:podster_flutter/components/link_button.dart';

import 'cover.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final List<Podcast> podcasts;

  SectionCard({@required this.title, @required this.podcasts});

  @override
  Widget build(BuildContext context) {
    List<Cover> forYouCovers = [];

    for (Podcast podcast in podcasts) {
      forYouCovers.add(
        Cover(
          imageUrl: podcast.imageUrl,
          title: podcast.title,
          onTap: () {},
        ),
      );
    }

    return Card(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title),
                LinkButton(
                  onTap: () {}, //no-op
                  label: 'View All',
                ),
              ],
            ),
          ),
          Container(
            height: 180.0,
            padding: EdgeInsets.only(
              bottom: 15.0,
              left: 10.0,
              right: 10.0,
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: forYouCovers.length,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 5.0),
              itemBuilder: (buildContext, int index) {
                return forYouCovers[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
