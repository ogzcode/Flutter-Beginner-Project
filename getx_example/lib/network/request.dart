import 'dart:convert';

import 'package:getx_example/models/album.dart';
import 'package:http/http.dart' as http;

class Request {
  static Future<List<Album>> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Album.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
