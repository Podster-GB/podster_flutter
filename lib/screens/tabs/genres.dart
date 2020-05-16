import 'package:flutter/material.dart';
import 'package:podster_flutter/components/cover.dart';
import 'package:podster_flutter/components/genre_tile.dart';

class GenresTabView extends StatelessWidget {
  final List<Cover> topCategories;
  final List<GenreTile> genres;

  GenresTabView({this.topCategories, this.genres});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10.0),
          height: 35.0,
          child: Text(
            'Playlists of our top \ncategories',
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          height: 180.0,
          padding: EdgeInsets.all(10.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) =>
            topCategories[index],
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 5.0),
            itemCount: topCategories.length,
          ),
        ),
        Container(
          height: 256.0,
          child: GridView.count(
            // https://github.com/flutter/flutter/issues/18503
            primary: false, // disable nested scrolling
            crossAxisCount: 2,
            // excess horizontal margin, need to fix this
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 4),
            children: genres,
          ),
        ),
      ],
    );
  }
}
