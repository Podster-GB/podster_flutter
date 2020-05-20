import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';
import 'package:podster_flutter/components/genre_tile.dart';
import 'package:podster_flutter/podcast.dart';

import 'components/cover.dart';

/// A source for generating UI components with dummy data. This class should
/// only be used in the prototyping phase of development.
class MockData {
  final BuildContext context;

  List<Cover> _continueListening;
  List<Cover> _forYou;
  List<BannerTile> _bannerTiles;
  List<ListTile> _trendingTiles;
  List<GenreTile> _genres;
  List<BannerTile> _trendingBannerTiles;

  MockData({@required this.context});

  final List<Podcast> podcasts = [
    Podcast(
      title: 'Off The Vine with Kaitlyn Bristowe',
      synopsis: 'Ready to shake things up? Kaitlyn is creating a space where girls (and gents) can feel empowered ' + 
      'to be themselves... because there\'s more to life than Instagram, right? Kaitlyn isn\'t afraid to keep it real ' + 
      'as she talks with her amazing guests! Get ready for lots of laughs, candid convo, taboo topics, unfiltered advice, ' + 
      'and wine... lots of wine!',
      imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8V9mc_pL9b6-Lt7TKzYn-fb9mQI9YfcF53g0_WKHKkUIn8qc',
      genre: 'Lifestyle',
    ),
    Podcast(
      title: 'Monday Morning Podcast',
      synopsis: 'Bill Burr rants about relationship advice, sports and the Illuminati.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVP184m-gDYYTWu_Z1gCjaKPwcMrOoyXjDN9Vu5xBiFtp0Bys',
      genre: 'Lifestyle',
    ),
    Podcast(
      title: 'GABA',
      synopsis: 'Next generation meditation that unfolds like a beautiful dream. @gabapodcast // Instagram See acast.com/privacy for privacy and opt-out information.',
      imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQnaZITezlX9XGJYxRBPO3ZN9We-j-S60fF1olFDnnelAkBAiPg',
      genre: 'Health',
    ),
    Podcast(
      title: 'The Intelligence',
      synopsis: 'Get a daily burst of global illumination from The Economist’s worldwide network of correspondents as they dig past the headlines to get to the stories ' +
      'beneath—and to stories that aren’t making headlines, but should be.',
      imageUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQohyX0X3gEmIhndOXa5CymYAgDKz5ns7lxUfO0niGVN4vJqps',
      genre: 'News',
    ),
    Podcast(
      title: 'Joe Rogan Experience',
      synopsis: 'The podcast of Comedian Joe Rogan..',
      imageUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSA4UAGuB3gvriNe_BGPDBGN8lyzquSFzbicYEesg6EqsswVjT5',
      genre: 'Entertainment',
    ),
    Podcast(
      title: 'Naval',
      synopsis: 'Naval on wealth and happiness. On Twitter at @naval.',
      imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQBdVtsi7BSmC7NtOf4aASKngwnofd4EvNAIt_096X-9sdtvsl6',
      genre: 'Self-Improvement',
    ),
    Podcast(
      title: 'Today in Focus',
      synopsis: 'Hosted by Anushka Asthana, Today in Focus brings you closer to Guardian journalism. Combining personal storytelling ' +
      'with insightful analysis, this podcast takes you behind the headlines for a deeper understanding of the news, every weekday',
      imageUrl: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRycwVO2CUYCsMjJXLdvslRbQAuK73CWRp8CKGRvVzymaUGXD70',
      genre: 'News',
    ),
    Podcast(
      title: 'Waveform: The MKBHD Podcast',
      synopsis: 'A tech podcast for the gadget lovers and tech heads among us from the mind of Marques Brownlee, better known as MKBHD. ' + 
      'MKBHD has made a name for himself on YouTube reviewing everything from the newest smartphones to cameras to electric cars. Pulling from ' + 
      'over 10 years of experience covering the tech industry, MKBHD will keep you informed and entertained as he takes a deep dive into the latest ' + 
      'and greatest in tech and what deserves your hard earned cash. New episodes every other week. Link to survey: https://bit.ly/2EcYbu4',
      imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOBPc8TQZS8dxe_bxHqw-EiNb1o1z_3NRKpdCg6DFX7HoJdIM',
      genre: 'Tech',
    ),
    Podcast(
      title: 'Business Wars',
      synopsis: 'Netflix vs. HBO. Nike vs. Adidas. Business is war. Sometimes the prize is your wallet or your attention. ' + 
      'Sometimes, it’s just the fun of beating the other guy. The outcome of these battles shapes what we buy and how we live.' + 
      ' Business Wars gives you the unauthorized, real story of what drives these companies and their leaders, inventors, investors ' + 
      'and executives to new heights -- or to ruin. Hosted by David Brown, former anchor of Marketplace. From Wondery, the network ' + 
      'behind Dirty John and American History Tellers.',
      imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTJHAxRZ5vxm_2QpXvurSr5OfC6yjEbHWFiTzhsoJlbh8McRRU',
      genre: 'Business',
    ),
    Podcast(
      title: 'POLITICO Dispatch',
      synopsis: 'We take you inside POLITICO, where journalists break news, work sources and pull back the curtain on politics and policy. Fast. Short. Daily.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvwsoU6E59qLDDTdQ31q13aw3yICENA0V_MCFqQNZTNpcJrcmj',
      genre: 'News',
    ),
  ];

  List<Podcast> getTrendingThisWeek() {
    return podcasts.where((podcast) => podcast.isTrending()).toList();
  }

  List<Podcast> getTrendingThisMonth() {
    return podcasts.where((podcast) => !podcast.isTrending()).toList();
  }

  /// Convenience method for invoking all of the following methods:
  /// ```
  /// buildBannerTiles();
  /// buildContinueListening();
  /// buildForYou();
  /// buildGenre();
  /// buildTrendingBannerTiles();
  /// buildTrendingTiles();
  /// ```
  void init() {
    buildContinueListening();
    buildForYou();
    buildGenre();
    buildTrendingTiles();

    // Play some podcasts a few times to get them to trend.
    for(int i=0; i<6; i++) {
      podcasts[2].play();
      podcasts[podcasts.length-1].play();
      podcasts[4].play();
    }
  }

  void buildContinueListening() {
    _continueListening = [
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
  }

  void buildForYou() {
    _forYou = [
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
  }

  void buildTrendingTiles() {
    _trendingTiles = [
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
  }

  void buildGenre() {
    _genres = [
      GenreTile(
        onTap: () {},
        label: 'Art',
        icon: Icons.palette,
      ),
      GenreTile(
        onTap: () {},
        label: 'Business',
        icon: Icons.show_chart,
      ),
      GenreTile(
        onTap: () {},
        label: 'Comedy',
        icon: Icons.child_care,
      ),
      GenreTile(
        onTap: () {},
        label: 'Economics',
        icon: Icons.timeline,
      ),
      GenreTile(
        onTap: () {},
        label: 'Education',
        icon: Icons.chrome_reader_mode,
      ),
      GenreTile(
        onTap: () {},
        label: 'Fitness',
        icon: Icons.fitness_center,
      ),
    ];
  }

  List<BannerTile> trendingBannerTiles() => _trendingBannerTiles;

  int getContinueListeningLength() => _continueListening.length;

  Cover popContinueListening() => _continueListening.removeLast();

  int getForYouLength() => _forYou.length;

  Cover popForYou() => _forYou.removeLast();

  int getBannerTilesLength() => _bannerTiles.length;

  BannerTile popBannerTile() => _bannerTiles.removeLast();

  List<Cover> getContinueListening() => _continueListening;

  List<Cover> getForYou() => _forYou;

  List<BannerTile> getBannerTiles() => _bannerTiles;

  List<ListTile> getTrendingTiles() => _trendingTiles;

  List<GenreTile> getGenreTiles() => _genres;
}