import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';
import 'package:podster_flutter/components/cover.dart';
import 'package:podster_flutter/components/link_button.dart';

class ForYouTabView extends StatelessWidget {
  final List<BannerTile> bannerTiles;
  final List<Cover> continueListening;
  final List<Cover> forYou;

  ForYouTabView({
    @required this.bannerTiles,
    @required this.continueListening,
    @required this.forYou
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // Continue listening card
        Card(
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
                    Text(
                      'Continue Listening',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
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
                  itemCount: continueListening.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(width: 5.0),
                  itemBuilder: (BuildContext context, int index) =>
                      continueListening[index],
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'For You',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    LinkButton(
                      onTap: () {},
                      label: 'View All',
                    ),
                  ],
                ),
                Container(
                  height: 180.0,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: forYou.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(width: 5.0),
                    itemBuilder: (BuildContext context, int index) =>
                        forYou[index],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
