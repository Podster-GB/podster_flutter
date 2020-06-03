class SearchResult {
  final int resultCount;

  String wrapperType;
  String kind;
  int artistId;
  int collectionId;
  int trackId;
  String artistName;
  String collectionName;
  String trackName;
  String collectionCensoredName;
  String trackCensoredName;
  String artistViewUrl;
  String collectionViewUrl;
  String feedUrl;
  String trackViewUrl;
  String artworkUrl30;
  String artworkUrl60;
  String artworkUrl100;
  double collectionPrice;
  double trackPrice;
  int trackRentalPrice;
  int collectionHdPrice;
  int trackHdPrice;
  int trackHdRentalPrice;
  DateTime releaseDate;
  String collectionExplicitness;
  String trackExplicitness;
  int trackCount;
  String country;
  String currency;
  String primaryGenreName;
  String contentAdvisoryRating;
  String artworkUrl600;
  List<String> genreIds;
  List<String> genres;

  SearchResult({
    this.resultCount,
    this.wrapperType,
    this.kind,
    this.artistId,
    this.collectionId,
    this.trackId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.feedUrl,
    this.trackViewUrl,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.trackPrice,
    this.trackRentalPrice,
    this.collectionHdPrice,
    this.trackHdPrice,
    this.trackHdRentalPrice,
    this.releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.trackCount,
    this.country,
    this.currency,
    this.primaryGenreName,
    this.contentAdvisoryRating,
    this.artworkUrl600,
    this.genreIds,
    this.genres,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    if (json['resultCount'] < 1) {
      throw Exception('No results');
    }

    Map<String, dynamic> _results = json['results'][0];
    var _releaseDate = DateTime.parse(_results['releaseDate']);

    return SearchResult(
      resultCount: json['resultCount'],
      wrapperType: _results['wrapperType'],
      kind: _results['kind'],
      artistId: _results['artistId'],
      collectionId: _results['collectionId'],
      trackId: _results['trackId'],
      artistName: _results['artistName'],
      collectionName: _results['collectionName'],
      trackName: _results['trackName'],
      collectionCensoredName: _results['collectionCensoredName'],
      trackCensoredName: _results['trackCensoredName'],
      artistViewUrl: _results['artistViewUrl'],
      collectionViewUrl: _results['collectionViewUrl'],
      feedUrl: _results['feedUrl'],
      trackViewUrl: _results['trackViewUrl'],
      artworkUrl30: _results['artworkUrl30'],
      artworkUrl60: _results['artworkUrl60'],
      artworkUrl100: _results['artworkUrl100'],
      collectionPrice: _results['collectionPrice'],
      trackPrice: _results['trackPrice'],
      trackRentalPrice: _results['trackRentalPrice'],
      collectionHdPrice: _results['collectionHdPrice'],
      trackHdPrice: _results['trackHdPrice'],
      trackHdRentalPrice: _results['trackHdRentalPrice'],
      releaseDate: _releaseDate,
      collectionExplicitness: _results['collectionExplicitness'],
      trackExplicitness: _results['trackExplicitness'],
      trackCount: _results['trackCount'],
      country: _results['country'],
      currency: _results['currency'],
      primaryGenreName: _results['primaryGenreName'],
      contentAdvisoryRating: _results['contentAdvisoryRating'],
      artworkUrl600: _results['artworkUrl600'],
      genreIds: _results['genreIds'].cast<String>(),
      genres: _results['genres'].cast<String>(),
    );
  }

}
