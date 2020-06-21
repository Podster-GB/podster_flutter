import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double progressValue; // Range (min - max): 0.0 - 1.0
  final Function onTap;

  Cover({
    @required this.imageUrl,
    @required this.title,
    this.progressValue,
    @required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.0,
        height: 160.0,
        decoration: BoxDecoration(
          color: Color(0xFFFFF0F0),
          borderRadius: BorderRadius.circular(11.0),
        ),
        child: Column(
          children: <Widget>[
            // Show progress bar
            if(progressValue != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  imageUrl,
                  height: 100.0,
                  width: 100.0,
                ),
              ),
              Container(
                child: LinearProgressIndicator(
                  value: progressValue == null ? 0.0 : progressValue,
                  backgroundColor: Colors.purple[50],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple[200]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],

            // Do not show progress bar
            if(progressValue == null) ...[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  imageUrl,
                  height: 100.0,
                  width: 100.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
