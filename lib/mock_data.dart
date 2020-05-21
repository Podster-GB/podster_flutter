import 'package:flutter/material.dart';
import 'package:podster_flutter/components/banner_tile.dart';
import 'package:podster_flutter/components/genre_tile.dart';
import 'package:podster_flutter/episode.dart';
import 'package:podster_flutter/podcast.dart';
import 'package:podster_flutter/components/cover.dart';

/// A source for generating UI components with dummy data. This class should
/// only be used in the prototyping phase of development.
class MockData {
  final BuildContext context;

  List<Cover> _continueListening;
  List<Cover> _forYou;
  List<ListTile> _trendingTiles;
  List<GenreTile> _genres;
  List<BannerTile> _trendingBannerTiles;

  MockData(this.context);

  final List<Podcast> podcasts = [
    Podcast(
      title: 'Off The Vine with Kaitlyn Bristowe',
      synopsis: 'Ready to shake things up? Kaitlyn is creating a space where girls (and gents) can feel empowered ' +
          'to be themselves... because there\'s more to life than Instagram, right? Kaitlyn isn\'t afraid to keep it real ' +
          'as she talks with her amazing guests! Get ready for lots of laughs, candid convo, taboo topics, unfiltered advice, ' +
          'and wine... lots of wine!',
      author: 'PodcastOne',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8V9mc_pL9b6-Lt7TKzYn-fb9mQI9YfcF53g0_WKHKkUIn8qc',
      genre: 'Lifestyle',
    ),
    Podcast(
      title: 'Monday Morning Podcast',
      synopsis:
          'Bill Burr rants about relationship advice, sports and the Illuminati.',
      author: 'All Things Comedy | Wondery',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVP184m-gDYYTWu_Z1gCjaKPwcMrOoyXjDN9Vu5xBiFtp0Bys',
      genre: 'Lifestyle',
    ),
    Podcast(
      title: 'GABA',
      synopsis:
          'Next generation meditation that unfolds like a beautiful dream. @gabapodcast // Instagram See acast.com/privacy for privacy and opt-out information.',
      author: 'Adam Martin',
      imageUrl:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQnaZITezlX9XGJYxRBPO3ZN9We-j-S60fF1olFDnnelAkBAiPg',
      genre: 'Health',
    ),
    Podcast(
      title: 'The Intelligence',
      synopsis:
          'Get a daily burst of global illumination from The Economist’s worldwide network of correspondents as they dig past the headlines to get to the stories ' +
              'beneath—and to stories that aren’t making headlines, but should be.',
      author: 'The Economist',
      imageUrl:
          'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQohyX0X3gEmIhndOXa5CymYAgDKz5ns7lxUfO0niGVN4vJqps',
      genre: 'News',
      episodes: [
        Episode(
            title: 'Politics trumps co-operation: the WHO’s annual meeting',
            pubDate: '14 hours ago',
            duration: '23 min',
            description: 'Rhetoric and posturing at the World Health Organisation’s annual assembly ' +
                'reveal an agency under geopolitical stresses just when global co-operation is needed most. ' +
                'Illegal logging has become an existential threat for the Amazon; under the cover of covid-19, a ' +
                'new bill in Brazil could hasten its decline. And reflections on the vast musical legacy of Kraftwerk’s Florian Schneider.'
                    'For full access to print, digital and audio editions of The Economist, subscribe here www.economist.com/radiooffer',
            isPlayed: false,
            lastPausedTimestamp: 0),
        Episode(
            title: 'Extreme measures: America’s far right',
            pubDate: '2 days ago',
            duration: '21 min',
            description: 'Extremists are cropping up at protests and expanding their reach online. ' +
                'They see the pandemic as proof of their worldview, and as an opportunity to spread their messages. ' +
                'After systematically ignoring mental-health concerns for decades, China’s authorities are at last tackling the issue—somewhat. ' +
                'And lockdowns prove that Britain is a nation of gardeners. For full access to print, digital and audio editions of The Economist, ' +
                'subscribe here www.economist.com/radiooffer',
            isPlayed: false,
            lastPausedTimestamp: 0),
        Episode(
            title:
                'Carriers and the disease: the airlines set for hard landings',
            pubDate: '3 days ago',
            duration: '22 min',
            description: 'Which firms will fly above the covid-19 clouds? ' +
                'Big, low-cost carriers with strong finances seem likeliest, but either way consolidation is inevitable. ' +
                'The Indian state of Kerala seems to be handling its outbreak far better than others; ' +
                'blame an unassuming but wildly popular health minister. ' +
                'And whether New York’s beloved Irish pubs will craic on past the pandemic.' +
                'For full access to print, digital and audio editions of The Economist, subscribe here www.economist.com/radiooffer',
            isPlayed: false,
            lastPausedTimestamp: 0),
      ],
    ),
    Podcast(
      title: 'Joe Rogan Experience',
      synopsis: 'The podcast of Comedian Joe Rogan..',
      author: 'Joe Rogan',
      imageUrl:
          'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSA4UAGuB3gvriNe_BGPDBGN8lyzquSFzbicYEesg6EqsswVjT5',
      genre: 'Entertainment',
    ),
    Podcast(
      title: 'Naval',
      synopsis: 'Naval on wealth and happiness. On Twitter at @naval.',
      author: 'Naval',
      imageUrl:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQBdVtsi7BSmC7NtOf4aASKngwnofd4EvNAIt_096X-9sdtvsl6',
      genre: 'Self-Improvement',
    ),
    Podcast(
      title: 'Today in Focus',
      synopsis:
          'Hosted by Anushka Asthana, Today in Focus brings you closer to Guardian journalism. Combining personal storytelling ' +
              'with insightful analysis, this podcast takes you behind the headlines for a deeper understanding of the news, every weekday',
      author: 'The Guardian',
      imageUrl:
          'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRycwVO2CUYCsMjJXLdvslRbQAuK73CWRp8CKGRvVzymaUGXD70',
      genre: 'News',
      episodes: [
        Episode(
          title: 'Will millions of children really be returning to school in June?- podcast',
          pubDate: '2 hours ago',
          duration: '27 min',
          description: 'Oliver de Botton is a headteacher of a large state school in Newham, east London. ' + 
          'Like many teachers across the country, he is tackling the daunting task of getting ready for the return ' + 
          'of some of his students in early June. Sally Weale, the Guardian education correspondent, ' + 
          'looks at the backlash against this drive to return some year groups to school. ' + 
          'Help support our independent journalism at theguardian.com/infocus',
          isPlayed: true,
          lastPausedTimestamp: 0,
        ),
        Episode(
          title: 'The scientific race to understand Covid-19',
          pubDate: '23 hours ago',
          duration: '25 min',
          description: 'In the five months since the world learned about Covid-19, ' + 
          'it has killed hundreds of thousands of people. In that time, what have scientists found out ' + 
          '– and what do they still not know? Coronavirus – latest updates See all our coronavirus coverage. ' + 
          'Help support our independent journalism at theguardian.com/infocus',
          isPlayed: true,
          lastPausedTimestamp: 0,
        ),
        Episode(
          title: 'How coronavirus led to rough sleepers being housed in hotels',
          pubDate: '2 days ago',
          duration: '22 min',
          description: 'Amelia Gentleman reports on life inside the hotels that are now ' + 
          'housing some of the more than 5,400 homeless people across England and Wales. ' + 
          'It is part of an unprecedented emergency operation to get all rough sleepers off the streets. ' + 
          'Help support our independent journalism at theguardian.com/infocus',
          isPlayed: false,
          lastPausedTimestamp: 0,
        ),
      ],
    ),
    Podcast(
      title: 'Waveform: The MKBHD Podcast',
      synopsis: 'A tech podcast for the gadget lovers and tech heads among us from the mind of Marques Brownlee, better known as MKBHD. ' +
          'MKBHD has made a name for himself on YouTube reviewing everything from the newest smartphones to cameras to electric cars. Pulling from ' +
          'over 10 years of experience covering the tech industry, MKBHD will keep you informed and entertained as he takes a deep dive into the latest ' +
          'and greatest in tech and what deserves your hard earned cash. New episodes every other week. Link to survey: https://bit.ly/2EcYbu4',
      author: 'Studio71',
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
      author: 'Wondery',
      imageUrl:
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTJHAxRZ5vxm_2QpXvurSr5OfC6yjEbHWFiTzhsoJlbh8McRRU',
      genre: 'Business',
    ),
    Podcast(
      title: 'POLITICO Dispatch',
      synopsis:
          'We take you inside POLITICO, where journalists break news, work sources and pull back the curtain on politics and policy. Fast. Short. Daily.',
      author: 'POLITICO',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvwsoU6E59qLDDTdQ31q13aw3yICENA0V_MCFqQNZTNpcJrcmj',
      genre: 'News',
    ),
    Podcast(
      title: 'Hip Hop Saved My Life with Romesh Ranganathan',
      synopsis: 'A comedy podcast about hip hop presented by award winning comedian Romesh Ranganathan. ' + 
      'Edited by James Torrance. Co-produced by RangaBee Productions and Mr Box (mrbox.tv) www.romeshranganathan.co.uk/podcast',
      author: 'RangaBee Productions and Mr Box',
      imageUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRZqBHii7SfzZJZfvOMFlakPlHNR9LdvlzTbBTUYG-1PnUozGeu',
      genre: 'Comedy',
      episodes: [
        Episode(
          title: 'S2 - Episode 30: Stephen Merchant',
          pubDate: '7 days ago',
          duration: '53 min',
          description: 'Our very special guest this week is comedy legend Stephen Merchant. ' + 
          'He talks us through some of his favourite rappers, current album listens and the classic hip hop bangers he grew up with. Enjoy!',
          isPlayed: false,
          lastPausedTimestamp: 0,
        ),
        Episode(
          title: 'S2 - Episode 29: Tiffany Calver',
          pubDate: '7 May 2020',
          duration: '50 min',
          description: 'It’s another great guest for you this week as we’re joined by none other than Tiffany Calver - DJ, presenter and host of The Radio 1 Rap Show!',
          isPlayed: false,
          lastPausedTimestamp: 0,
        ),
        Episode(
          title: 'S2 - Episode 28: R.A. the Rugged Man',
          pubDate: '30 Apr 2020',
          duration: '45 min',
          description: 'We’ve got one hell of a show for you this week as we’re joined by one of the best rappers ' + 
          'in the game: R.A. the Rugged Man. And after you’ve listened, make sure to check out his brand new album All My Heroes Are Dead - it\'s an absolute banger!',
          isPlayed: true,
          lastPausedTimestamp: 0,
        ),
        Episode(
          title: 'S2 - Episode 27: Hugo Chegwin',
          pubDate: '23 Apr 2020',
          duration: '42 min',
          description: 'Man like Beats in the house! ' + 
          'Yes that\'s right - music producer, actor and People Just Do Nothing star Hugo Chegwin joins Rom and Rumaj this week for another of our lockdown episodes.',
          isPlayed: true,
          lastPausedTimestamp: 0,
        ),
      ],
    ),
  ];

  List<Podcast> getTrendingThisWeek() {
    return podcasts.where((podcast) => podcast.isTrending()).toList();
  }

  List<Podcast> getTrendingThisMonth() {
    return podcasts.where((podcast) => !podcast.isTrending()).toList();
  }

  List<Podcast> getForYouHighlights() {
    return podcasts.where((podcast) => podcast.genre == 'News' || podcast.genre == 'Comedy').toList();
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
    for (int i = 0; i < 6; i++) {
      podcasts[2].play();
      podcasts[4].play();
      podcasts[podcasts.length - 1].play();
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
        imageUrl:
            'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQnaZITezlX9XGJYxRBPO3ZN9We-j-S60fF1olFDnnelAkBAiPg',
        progressValue: 0.86,
      ),
      Cover(
        onTap: () {},
        title: 'Naval',
        imageUrl:
            'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQBdVtsi7BSmC7NtOf4aASKngwnofd4EvNAIt_096X-9sdtvsl6',
        progressValue: 0.34,
      ),
      Cover(
        onTap: () {},
        title: 'The Intelligence',
        imageUrl:
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQohyX0X3gEmIhndOXa5CymYAgDKz5ns7lxUfO0niGVN4vJqps',
        progressValue: 0.22,
      )
    ];
  }

  void buildForYou() {
    _forYou = [
      Cover(
        onTap: () {},
        title: 'Today, Explained',
        imageUrl:
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTzQrylRlUVXYMGvGxv7S9yIgSJiELCI-9MfgasCgVL849lfnMq',
      ),
      Cover(
        onTap: () {},
        title: 'POLITICO Dispatch',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvwsoU6E59qLDDTdQ31q13aw3yICENA0V_MCFqQNZTNpcJrcmj',
      ),
      Cover(
        onTap: () {},
        title: 'Business Wars',
        imageUrl:
            'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTJHAxRZ5vxm_2QpXvurSr5OfC6yjEbHWFiTzhsoJlbh8McRRU',
      ),
      Cover(
        onTap: () {},
        title: 'Joe Rogan Experience',
        imageUrl:
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSA4UAGuB3gvriNe_BGPDBGN8lyzquSFzbicYEesg6EqsswVjT5',
      ),
      Cover(
        onTap: () {},
        title: 'Office Ladies',
        imageUrl:
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQPXsNEWh1HaLwWDRYzZrafOrBhLCB6z-fiPCgJcaLKS53n-lo',
      ),
    ];
  }

  void buildTrendingTiles() {
    _trendingTiles = [
      ListTile(
        leading: Image.network(
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSA4UAGuB3gvriNe_BGPDBGN8lyzquSFzbicYEesg6EqsswVjT5'),
        title: Text('Joe Rogan Experience'),
      ),
      ListTile(
        leading: Image.network(
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQohyX0X3gEmIhndOXa5CymYAgDKz5ns7lxUfO0niGVN4vJqps'),
        title: Text('The Intelligence'),
      ),
      ListTile(
        leading: Image.network(
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQvWRhYcJbWw4w6a9CFskUnb0-McmhM1QTyfq0omvEuVZyrA6Y'),
        title: Text('TED Talks Daily'),
      ),
      ListTile(
        leading: Image.network(
            'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSZjUqEeWy3uxifXhfyI4zLCpvbxU5ZLllhjyE_sThNAwHT40I'),
        title: Text('Freakonomics Radio'),
      ),
      ListTile(
        leading: Image.network(
            'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRycwVO2CUYCsMjJXLdvslRbQAuK73CWRp8CKGRvVzymaUGXD70'),
        title: Text('Today in Focus'),
      ),
      ListTile(
        leading: Image.network(
            'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSjX_jkYkYpDyXvS4MlOPv9zUByWgTGUGwCUo-DH40OajeDcjQ'),
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

  List<Cover> getContinueListening() => _continueListening;

  List<Cover> getForYou() => _forYou;

  List<ListTile> getTrendingTiles() => _trendingTiles;

  List<GenreTile> getGenreTiles() => _genres;
}
