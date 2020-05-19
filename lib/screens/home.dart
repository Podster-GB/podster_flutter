import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';
import 'package:podster_flutter/components/list_item.dart';
import 'package:podster_flutter/components/show_item.dart';
import 'package:podster_flutter/constants.dart';
import 'package:podster_flutter/screens/tabs/for_you.dart';
import 'package:podster_flutter/screens/tabs/trending.dart';
import 'package:podster_flutter/screens/tabs/genres.dart';

import '../mock_data.dart';
import '../podcast.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MockData mockDataProvider = MockData(context: context);
    mockDataProvider.init();
    List<Podcast> trendingThisWeek = mockDataProvider.getTrendingThisWeek();
    List<Podcast> trendingThisMonth = mockDataProvider.getTrendingThisMonth();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {}, // no-op
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {}, // no-op
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'For You',
              ),
              Tab(
                text: 'Trending',
              ),
              Tab(
                text: 'Genres',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ForYouTabView(
              bannerTiles: mockDataProvider.getBannerTiles(),
              continueListening: mockDataProvider.getContinueListening(),
              forYou: mockDataProvider.getForYou(),
            ),
            TrendingTabView(
              popularThisWeek: List<BannerTile>.generate(
                trendingThisWeek.length,
                (i) => BannerTile(
                  onTap: () {},
                  show: trendingThisWeek[i],
                ),
              ),
              popularThisMonth: List<ListItem>.generate(
                trendingThisMonth.length,
                (i) => ShowItem(
                  imageUrl: trendingThisMonth[i].imageUrl,
                  title: trendingThisMonth[i].title,
                ),
              ),
            ),
            GenresTabView(
              topCategories: mockDataProvider.getForYou(),
              genres: mockDataProvider.getGenreTiles(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: PRIMARY_COLOR,
          selectedItemColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.audiotrack),
              title: Text('Listening Party'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text('Library'),
            ),
          ],
        ),
      ),
    );
  }
}
