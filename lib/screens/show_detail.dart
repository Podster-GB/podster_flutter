import 'package:flutter/material.dart';
import 'package:podster_flutter/components/text_button.dart';
import 'package:podster_flutter/constants.dart';

class ShowDetail extends StatelessWidget {
  final String showName = 'Philosophize This!';
  final String showAuthor = 'Stephen West';
  final String showGenre = 'Philosophy';

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
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQVyDAGxXo0sRL6yC-FEoO4PJlT4DY4dfm1_x85EJXj-Dn_3M'),
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
          Center(
            child: Text('Mid'),
          ),
          Center(
            child: Text('Bot'),
          ),
        ],
      ),
    );
  }
}
