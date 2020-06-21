import 'package:flutter/material.dart';
import 'package:podster_flutter/components/list_item.dart';
import 'package:podster_flutter/constants.dart';

import '../podcast.dart';

class BannerTile implements ListItem {
  final Function onTap;
  final Color color;
  final Podcast show;

  BannerTile(
      {@required this.onTap,
      this.color,
      @required this.show});

  @override
  Widget buildTile(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 111.0,
        width: 352.0,
        decoration: BoxDecoration(
          color: color == null ? ACCENT_COLOR : color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  show.imageUrl,
                  height: 100.0,
                  width: 100.0,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20.0, bottom: 5.0),
                      child: Text(
                        show.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text(
                        show.synopsis
                            .split(RegExp('[.!?\\-]'))[0] + '...', // matches first line
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
