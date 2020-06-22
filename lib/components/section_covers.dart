import 'package:flutter/material.dart';
import 'package:podster_flutter/mock_data.dart';
import 'package:podster_flutter/components/cover.dart';

import '../podcast.dart';

class SectionCovers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MockData mockDataProvider = MockData(context);
    final List<Podcast> podcasts = mockDataProvider.podcasts;
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

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: forYouCovers.length,
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(width: 5.0),
      itemBuilder: (buildContext, int index) {
        return forYouCovers[index];
      },
    );
  }
}
