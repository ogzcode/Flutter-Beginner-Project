class Album {
  final int id;
  final String title;
  final String url;

  Album({required this.id, required this.title, required this.url});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
      url: json['url'],
    );
  }
}