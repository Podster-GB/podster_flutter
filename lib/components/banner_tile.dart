import 'package:flutter/material.dart';

class BannerTile extends StatelessWidget {
  final Function onTap;
  final Color color;
  final String image;
  final String title;
  final String synopsis;

  BannerTile(
      {@required this.onTap,
      @required this.color,
      @required this.image,
      @required this.title,
      @required this.synopsis});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 111.0,
        width: 352.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  image,
                  height: 100.0,
                  width: 100.0,
                ),
              ),
              Container(
                width: 210.0,
                margin: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Text(
                  synopsis,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
