import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';
import 'package:podster_flutter/components/episode_item.dart';
import 'package:podster_flutter/components/list_item.dart';
import 'package:podster_flutter/components/show_item.dart';
import 'package:podster_flutter/constants.dart';
import 'package:podster_flutter/screens/show_detail.dart';
import 'package:podster_flutter/screens/tabs/for_you.dart';
import 'package:podster_flutter/screens/tabs/trending.dart';
import 'package:podster_flutter/screens/tabs/genres.dart';

import '../mock_data.dart';
import '../podcast.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MockData mockDataProvider = MockData(context);
    mockDataProvider.init();
    List<Podcast> trendingThisWeek = mockDataProvider.getTrendingThisWeek();
    List<Podcast> trendingThisMonth = mockDataProvider.getTrendingThisMonth();
    List<Podcast> forYouHighlights = mockDataProvider.getForYouHighlights();

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
              highlights: List<BannerTile>.generate(
                forYouHighlights.length,
                (i) => BannerTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowDetail(
                          showName: forYouHighlights[i].title,
                          showSynopsis: forYouHighlights[i].synopsis,
                          showAuthor: forYouHighlights[i].author,
                          showImageUrl: forYouHighlights[i].imageUrl,
                          showGenre: forYouHighlights[i].genre,
                          showEpisodes: List<EpisodeItem>.generate(
                            forYouHighlights[i].episodes.length,
                            (j) => EpisodeItem(
                              title: forYouHighlights[i].episodes[j].title,
                              description:
                                  forYouHighlights[i].episodes[j].description,
                              pubDate: forYouHighlights[i].episodes[j].pubDate,
                              duration:
                                  forYouHighlights[i].episodes[j].duration,
                              isPlayed:
                                  forYouHighlights[i].episodes[j].isPlayed,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  show: forYouHighlights[i],
                ),
              ),
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
