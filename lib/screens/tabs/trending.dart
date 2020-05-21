import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';
import 'package:podster_flutter/components/list_item.dart';

class TrendingTabView extends StatelessWidget {
  final List<BannerTile> popularThisWeek;
  final List<ListItem> popularThisMonth;

  TrendingTabView(
      {@required this.popularThisWeek, @required this.popularThisMonth});

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
              itemCount: popularThisWeek.length,
              separatorBuilder: (context, index) => SizedBox(
                width: 5.0,
              ),
              itemBuilder: (context, index) =>
                  popularThisWeek[index].buildTile(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Popular This Month',
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
                itemCount: popularThisMonth.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 5.0,
                ),
                itemBuilder: (context, index) =>
                    popularThisMonth[index].buildTile(context)),
          ),
        ],
      ),
    );
  }
}
