import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';
import 'package:podster_flutter/components/list_item.dart';

class TrendingTabView extends StatelessWidget {
  final List<BannerTile> popularThisWeek;
  final List<ListItem> popularThisMonth;

  TrendingTabView({@required this.popularThisWeek, @required this.popularThisMonth});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Popular This Week',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 180.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: popularThisWeek.length,
              itemBuilder: (context, index) => popularThisWeek[index].buildTile(context),
            ),
          ),
          Text(
            'Popular This Month',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: popularThisMonth.length,
            itemBuilder: (context, index) => popularThisMonth[index].buildTile(context)
          ),
        ],
      ),
    );
  }
}

// ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         final item = items[index];
//         return item.buildTile(context);
//       }
//     );