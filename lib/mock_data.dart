import 'components/cover.dart';

class MockData {
  final List<Cover> _continueListeningPodcasts = [
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

  int getContinueListeningLength() {
    return _continueListeningPodcasts.length;
  }

  Cover popContinueListening() {
    return _continueListeningPodcasts.removeLast();
  }
}