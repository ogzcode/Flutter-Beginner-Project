import 'package:get/get.dart';

class Album {
  final int id;
  final String title;
  final String url;
  RxList<String> comments;
  RxInt likes = 0.obs;

  Album({
    required this.id,
    required this.title,
    required this.url,
    required this.comments,
    required this.likes,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      comments: <String>[].obs,
      likes: 0.obs,
    );
  }
}