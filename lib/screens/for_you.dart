import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';
import 'package:podster_flutter/components/link_button.dart';
import 'package:podster_flutter/constants.dart';
import 'package:podster_flutter/mock_data.dart';

class ForYou extends StatelessWidget {
  MockData mockDataProvider = MockData();

  @override
  Widget build(BuildContext context) {
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
        body: ListView(
          children: <Widget>[
            // Banner cards
            Container(
              height: 200.0,
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 5.0),
                    child: BannerTile(
                      onTap: () {},
                      color: Colors.purple[200],
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQVyDAGxXo0sRL6yC-FEoO4PJlT4DY4dfm1_x85EJXj-Dn_3M',
                      title: 'Philosophize This!',
                      synopsis:
                          'Beginner friendly if listened to in order! For anyone interested in an educational podcast about philosophy where you don\'t need to be a graduate-level philosopher to understand it. In chronological order, the thinkers and ideas that forged the world we live in are broken down and explained.',
                    ),
                  ),
                  BannerTile(
                    onTap: () {},
                    color: Color(0xFFFBE6A7),
                    image:
                        'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTOyakdJqxziOy1PQC-FCUYFZ2OFFn00LJYofecw2WX8KrbZ5Q',
                    title: 'The Good News Podcast',
                    synopsis:
                        'The Good News Podcast is your daily reminder that not all news is bad, produced by Colleen and Neil. 👁',
                  ),
                ],
              ),
            ),
            // Continue listening card
            Card(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Continue Listening',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        LinkButton(
                          onTap: () {}, //no-op
                          label: 'View All',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 180.0,
                    padding: EdgeInsets.only(
                      bottom: 15.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: mockDataProvider.getContinueListeningLength(),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(width: 5.0),
                      itemBuilder: (BuildContext context, int index) {
                        return mockDataProvider.popContinueListening();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'For You',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text('View All'),
                        ),
                      ],
                    ),
                    Container(
                      height: 180.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Column(
                              children: <Widget>[
                                Image(
                                    height: 120.0,
                                    width: 100.0,
                                    image: NetworkImage(
                                        'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSA4UAGuB3gvriNe_BGPDBGN8lyzquSFzbicYEesg6EqsswVjT5')),
                                Container(
                                  height: 37.0,
                                  width: 115.0,
                                  color: Color(0xFFc0b3c2),
                                  child: Text(
                                    'Joe Rogan Experience',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 115.0,
                                  child: LinearProgressIndicator(
                                    value: 0.3,
                                    backgroundColor: Colors.purple[50],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.purple[200]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Column(
                              children: <Widget>[
                                Image(
                                  height: 120.0,
                                  width: 120.0,
                                  image: NetworkImage(
                                      'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQPXsNEWh1HaLwWDRYzZrafOrBhLCB6z-fiPCgJcaLKS53n-lo'),
                                ),
                                Container(
                                  height: 37.0,
                                  width: 115.0,
                                  color: Color(0xFFc0b3c2),
                                  child: Text(
                                    'Office Ladies',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 115.0,
                                  child: LinearProgressIndicator(
                                    value: 0.7,
                                    backgroundColor: Colors.purple[50],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.purple[200]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Column(
                              children: <Widget>[
                                Image(
                                  height: 120.0,
                                  width: 120.0,
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvwsoU6E59qLDDTdQ31q13aw3yICENA0V_MCFqQNZTNpcJrcmj'),
                                ),
                                Container(
                                  height: 37.0,
                                  width: 115.0,
                                  color: Color(0xFFc0b3c2),
                                  child: Text(
                                    'Dog Grooming with Javier',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 115.0,
                                  child: LinearProgressIndicator(
                                    value: 0.1,
                                    backgroundColor: Colors.purple[50],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.purple[200]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
              icon: Icon(Icons.notifications),
              title: Text('Notifications'),
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
