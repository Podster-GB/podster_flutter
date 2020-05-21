import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:podster_flutter/constants.dart';

class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      threeDotsIcon,
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
                  itemCount: 50,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 5.0,
                  ),
                  itemBuilder: (context, index) => DiscoverItem(
                    title: 'Today In Focus',
                    subtitle: 'The Guardian',
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
              icon: broadcastIcon,
              title: Text('Radio'),
            ),
            BottomNavigationBarItem(
              icon: searchIcon,
              title: Text('Search'),
            ),
            BottomNavigationBarItem(icon: userIcon, title: Text('Profile')),
          ],
        ),
      ),
    );
  }
}

class DiscoverItem {
  final String title;
  final String subtitle;

  DiscoverItem({this.title, this.subtitle});

  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            width: 290,
            height: 250,
            color: darkAccentInactiveColor,
          ),
          Container(
            padding: EdgeInsets.all(25.0),
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
            padding: EdgeInsets.fromLTRB(25.0, 55.0, 5.0, 5.0),
            alignment: Alignment.topLeft,
            child: Text(
              subtitle,
              style: TextStyle(
                color: darkHeadlineColor,
                fontSize: 16.0,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: darkAccentColor,
              ),
              child: IconButton(
                onPressed: () => null,
                icon: FaIcon(
                  playIcon,
                  color: darkHeadlineColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
