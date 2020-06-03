class Feed {
  final String title;
  final String id;
  final Map<String, dynamic> author;
  final List<dynamic> links;
  final String copyright;
  final String country;
  final String icon;
  final DateTime updated;
  final List<dynamic> results;

  Feed({this.title, this.id, this.author, 
  this.links, this.copyright, this.country, this.icon, this.updated, this.results});

  factory Feed.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> feedMap = json['feed'];
    return Feed(
      title: feedMap['title'],
      id: feedMap['id'],
      author: feedMap['author'],
      links: feedMap['links'],
      copyright: feedMap['copyright'],
      country: feedMap['country'],
      icon: feedMap['icon'],
      updated: DateTime.parse(feedMap['updated']),
      results: feedMap['results'],
    );
  }
}
