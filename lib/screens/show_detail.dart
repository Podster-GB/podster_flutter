import 'package:flutter/material.dart';
import 'package:podster_flutter/components/text_button.dart';
import 'package:podster_flutter/constants.dart';

class ShowDetail extends StatelessWidget {
  final String showName;
  final String showAuthor;
  final String showGenre;
  final String showSynopsis;
  final String showImageUrl;

  ShowDetail({
    @required this.showName, @required this.showAuthor,
    @required this.showGenre, @required this.showSynopsis,
    @required this.showImageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Text(showName),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15.0, top: 15.0,),
                child: Image.network(showImageUrl),
                width: 140.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                      child: Text(
                        showName,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      child: Text(
                        showAuthor,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        showGenre,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 35.0,
                  width: 120.0,
                  margin: EdgeInsets.only(right: 55.0),
                  child: TextButton(
                    onTap: () {},
                    label: 'Subscribe',
                  ),
                ),
                Text('Download Episodes'),
                IconButton(
                  onPressed: () {},
                  color: ACCENT_COLOR,
                  icon: Icon(Icons.file_download),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              showSynopsis,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'In This Podcast',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5.0, 5.0, 0),
                      height: 35.0,
                      width: 95.0,
                      child: TextButton(
                        onTap: () {},
                        label: showGenre,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5.0, 5.0, 0),
                      height: 35.0,
                      width: 95.0,
                      child: TextButton(
                        onTap: () {},
                        label: 'Education',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
