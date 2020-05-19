import 'package:flutter/material.dart';

import 'banner_tile.dart';

class ReelBanner extends StatelessWidget {
  final List<BannerTile> tiles;

  ReelBanner({@required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tiles.length,
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 5.0),
        itemBuilder: (BuildContext context, int index) => null
        // tiles[index],
      ),
    );
  }
}
