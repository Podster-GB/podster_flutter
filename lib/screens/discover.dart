import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:podster_flutter/constants.dart';
import 'package:podster_flutter/mock_data.dart';
import 'package:podster_flutter/podcast.dart';

class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MockData mockDataProvider = MockData(context);
    mockDataProvider.init();
    List<Podcast> podcasts = mockDataProvider.getTrendingThisWeek();

    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Discover',
                      style: darkHeadlineTextstyle,
                    ),
                    FaIcon(
                      searchIcon,
                      color: darkAccentInactiveColor,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(22.0),
                height: 180.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: podcasts.length,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 5.0,
                  ),
                  itemBuilder: (context, index) => DarkCoverItem(
                    title: podcasts[index].title,
                    subtitle: podcasts[index].author,
                    imageUrl: podcasts[index].imageUrl,
                  ).build(context),
                ),
              ),
              Container(
                padding: EdgeInsets.all(26.0),
                width: 260.0,
                child: LinearProgressIndicator(
                  value: 0.3,
                  backgroundColor: darkAccentInactiveColor,
                  valueColor: AlwaysStoppedAnimation<Color>(darkAccentColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Recently Played',
                      style: darkHeadlineTextstyle,
                    ),
                    Text(
                      'See all',
                      style: darkLinkTextstyle,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(22.0),
                height: 180.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: podcasts.length,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 5.0,
                  ),
                  itemBuilder: (context, index) => DarkCoverItem(
                    title: podcasts[index].title,
                    subtitle: podcasts[index].author,
                    imageUrl: podcasts[index].imageUrl,
                  ).build(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Trending',
                      style: darkHeadlineTextstyle,
                    ),
                    Text(
                      'See all',
                      style: darkLinkTextstyle,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(22.0),
                height: 180.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 50,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 5.0,
                  ),
                  itemBuilder: (context, index) => Text(
                    'Item $index',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: darkBackgroundColor,
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: darkAccentColor,
          unselectedItemColor: darkAccentInactiveColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: homeIcon,
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(newsIcon),
              title: Text('Radio'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(commentIcon),
              title: Text('Listening Party'),
            ),
            BottomNavigationBarItem(icon: userIcon, title: Text('Profile')),
          ],
        ),
      ),
    );
  }
}

class DarkCoverItem {
  final String title;
  final String subtitle;
  final String imageUrl;

  DarkCoverItem({this.title, this.subtitle, this.imageUrl});

  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.topCenter,
            width: 150,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[
                  Colors.black.withAlpha(0),
                  Colors.black38, // middle
                  Colors.black54, // top
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                color: darkHeadlineColor,
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 60.0, 5.0, 5.0),
            alignment: Alignment.topLeft,
            child: Text(
              subtitle,
              style: TextStyle(
                color: darkHeadlineColor,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
