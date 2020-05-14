import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';
import 'package:podster_flutter/components/reel_banner.dart';

class TrendingTabView extends StatelessWidget {
  final List<BannerTile> bannerTiles;
  final List<ListTile> bodyTiles;

  TrendingTabView({@required this.bannerTiles, @required this.bodyTiles});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ReelBanner(
          tiles: bannerTiles,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) => 
                bodyTiles[index],
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 10.0,),
            itemCount: bodyTiles.length,
          ),
        ),
      ],
    );
  }
}
