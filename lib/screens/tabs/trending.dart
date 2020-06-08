import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';
import 'package:podster_flutter/components/list_item.dart';

class TrendingTabView extends StatefulWidget {
  final List<BannerTile> popularThisWeek;
  final List<ListItem> popularThisMonth;

  TrendingTabView(
      {@required this.popularThisWeek, @required this.popularThisMonth});

  @override
  State<StatefulWidget> createState() => _TrendingTabViewState();
}

class _TrendingTabViewState extends State<TrendingTabView> {

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
                itemCount: widget.popularThisMonth.length,
                separatorBuilder: (context, index) => SizedBox(
                      height: 5.0,
                    ),
                itemBuilder: (context, index) =>
                    widget.popularThisMonth[index].buildTile(context)),
          ),
        ],
      ),
    );
  }
}
