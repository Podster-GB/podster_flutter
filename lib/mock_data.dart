import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';

import 'components/cover.dart';

class MockData {
  final List<Cover> _continueListening = [
    Cover(
      onTap: () {},
      title: 'Off The Vine with Kaitlyn Bristowe',
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8V9mc_pL9b6-Lt7TKzYn-fb9mQI9YfcF53g0_WKHKkUIn8qc',
      progressValue: 0.3,
    ),
    Cover(
      onTap: () {},
      title: 'Monday Morning Podcast',
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVP184m-gDYYTWu_Z1gCjaKPwcMrOoyXjDN9Vu5xBiFtp0Bys',
      progressValue: 0.7,
    ),
    Cover(
      onTap: () {},
      title: 'Waveform: The MKBHD Podcast',
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOBPc8TQZS8dxe_bxHqw-EiNb1o1z_3NRKpdCg6DFX7HoJdIM',
      progressValue: 0.1,
    ),
    Cover(
      onTap: () {},
      title: 'GABA',
      imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQnaZITezlX9XGJYxRBPO3ZN9We-j-S60fF1olFDnnelAkBAiPg',
      progressValue: 0.86,
    ),
    Cover(
      onTap: () {},
      title: 'Naval',
      imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQBdVtsi7BSmC7NtOf4aASKngwnofd4EvNAIt_096X-9sdtvsl6',
      progressValue: 0.34,
    ),
    Cover(
      onTap: () {},
      title: 'The Intelligence',
      imageUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQohyX0X3gEmIhndOXa5CymYAgDKz5ns7lxUfO0niGVN4vJqps',
      progressValue: 0.22,
    )
  ];

  final _forYou = [
    Cover(
      onTap: () {},
      title: 'Today, Explained',
      imageUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTzQrylRlUVXYMGvGxv7S9yIgSJiELCI-9MfgasCgVL849lfnMq',
    ),
    Cover(
      onTap: () {},
      title: 'POLITICO Dispatch',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvwsoU6E59qLDDTdQ31q13aw3yICENA0V_MCFqQNZTNpcJrcmj',
    ),
    Cover(
      onTap: () {},
      title: 'Business Wars',
      imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTJHAxRZ5vxm_2QpXvurSr5OfC6yjEbHWFiTzhsoJlbh8McRRU',
    ),
    Cover(
      onTap: () {},
      title: 'Joe Rogan Experience',
      imageUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSA4UAGuB3gvriNe_BGPDBGN8lyzquSFzbicYEesg6EqsswVjT5',
    ),
    Cover(
      onTap: () {},
      title: 'Office Ladies',
      imageUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQPXsNEWh1HaLwWDRYzZrafOrBhLCB6z-fiPCgJcaLKS53n-lo',
    ),
  ];

  final List<BannerTile> _bannerTiles = [
    BannerTile(
      onTap: () {},
      color: Colors.purple[200],
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQVyDAGxXo0sRL6yC-FEoO4PJlT4DY4dfm1_x85EJXj-Dn_3M',
      title: 'Philosophize This!',
      synopsis:
      'Beginner friendly if listened to in order! For anyone interested in an educational podcast about philosophy where you don\'t need to be a graduate-level philosopher to understand it. In chronological order, the thinkers and ideas that forged the world we live in are broken down and explained.',
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
  ];

  final _trendingTiles = [
    ListTile(
      leading: Image.network('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSA4UAGuB3gvriNe_BGPDBGN8lyzquSFzbicYEesg6EqsswVjT5'),
      title: Text('Joe Rogan Experience'),
    ),
    ListTile(
      leading: Image.network('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQohyX0X3gEmIhndOXa5CymYAgDKz5ns7lxUfO0niGVN4vJqps'),
      title: Text('The Intelligence'),
    ),
    ListTile(
      leading: Image.network('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQvWRhYcJbWw4w6a9CFskUnb0-McmhM1QTyfq0omvEuVZyrA6Y'),
      title: Text('TED Talks Daily'),
    ),
    ListTile(
      leading: Image.network('https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSZjUqEeWy3uxifXhfyI4zLCpvbxU5ZLllhjyE_sThNAwHT40I'),
      title: Text('Freakonomics Radio'),
    ),
    ListTile(
      leading: Image.network('https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRycwVO2CUYCsMjJXLdvslRbQAuK73CWRp8CKGRvVzymaUGXD70'),
      title: Text('Today in Focus'),
    ),
    ListTile(
      leading: Image.network('https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSjX_jkYkYpDyXvS4MlOPv9zUByWgTGUGwCUo-DH40OajeDcjQ'),
      title: Text('The One In Which...'),
    )
  ];

  int getContinueListeningLength() {
    return _continueListening.length;
  }

  Cover popContinueListening() {
    return _continueListening.removeLast();
  }

  int getForYouLength() {
    return _forYou.length;
  }

  Cover popForYou() {
    return _forYou.removeLast();
  }

  int getBannerTilesLength() {
    return _bannerTiles.length;
  }

  BannerTile popBannerTile() {
    return _bannerTiles.removeLast();
  }

  List<Cover> getContinueListening() {
    return _continueListening;
  }

  List<Cover> getForYou() {
    return _forYou;
  }

  List<BannerTile> getBannerTiles() {
    return _bannerTiles;
  }

  List getTrendingTiles() {
    return _trendingTiles;
  }
}