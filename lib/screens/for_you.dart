import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';

class ForYou extends StatelessWidget {
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
                      image: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQ839xFUO1W7b0oJYM0FbDDFaBrhxOqrP83mPbskdAIaAaym2tt',
                      title: 'Ear Hustle',
                      synopsis: 'Ear Hustle brings you the daily realities of life inside prison shared by those living it, and stories from the outside, post-incarceration.',
                    ),
                  ),
                  BannerTile(
                    onTap: () {},
                    color: Color(0xFFFBE6A7),
                    image: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTOyakdJqxziOy1PQC-FCUYFZ2OFFn00LJYofecw2WX8KrbZ5Q',
                    title: 'The Good News Podcast',
                    synopsis: 'The Good News Podcast is your daily reminder that not all news is bad, produced by Colleen and Neil. 👁',
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Continue Listening',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {}, // no-op
                          child: Text('View All'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 170.0,
                    margin: EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            children: <Widget>[
                              Image(
                                height: 120.0,
                                width: 120.0,
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8V9mc_pL9b6-Lt7TKzYn-fb9mQI9YfcF53g0_WKHKkUIn8qc'
                                ),
                              ),
                              Container(
                                height: 37.0,
                                width: 115.0,
                                color: Color(0xFFc0b3c2),
                                child: Text(
                                  'Off The Vine with Kaitlyn Bristowe',
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
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVP184m-gDYYTWu_Z1gCjaKPwcMrOoyXjDN9Vu5xBiFtp0Bys'
                                ),
                              ),
                              Container(
                                height: 37.0,
                                width: 115.0,
                                color: Color(0xFFc0b3c2),
                                child: Text(
                                  'Monday Morning Podcast',
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
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOBPc8TQZS8dxe_bxHqw-EiNb1o1z_3NRKpdCg6DFX7HoJdIM'
                                ),
                              ),
                              Container(
                                height: 37.0,
                                width: 115.0,
                                color: Color(0xFFc0b3c2),
                                child: Text(
                                  'Waveform: The MKBHD Podcast',
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
                                        'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSA4UAGuB3gvriNe_BGPDBGN8lyzquSFzbicYEesg6EqsswVjT5'
                                    )
                                ),
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
                                      'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQPXsNEWh1HaLwWDRYzZrafOrBhLCB6z-fiPCgJcaLKS53n-lo'
                                  ),
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
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvwsoU6E59qLDDTdQ31q13aw3yICENA0V_MCFqQNZTNpcJrcmj'
                                  ),
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
          backgroundColor: Colors.purple[50],
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
