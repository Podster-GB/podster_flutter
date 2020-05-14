import 'package:flutter/material.dart';
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
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: mockDataProvider.getBannerTilesLength(),
                separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 5.0),
                itemBuilder: (BuildContext context, int index) =>
                    mockDataProvider.popBannerTile(),
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
                      itemBuilder: (BuildContext context, int index) =>
                          mockDataProvider.popContinueListening(),
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
                            fontSize: 18.0,
                          ),
                        ),
                        LinkButton(
                          onTap: () {},
                          label: 'View All',
                        ),
                      ],
                    ),
                    Container(
                      height: 180.0,
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: mockDataProvider.getForYouLength(),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(width: 5.0),
                        itemBuilder: (BuildContext context, int index) =>
                            mockDataProvider.popForYou(),
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
