import "dart:convert";
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<dynamic>> getAlbumsByUserId(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/users/$id/albums"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load albums!");
    }
  }

  Future<List<dynamic>> getPhotosByAlbumId(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/albums/$id/photos"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load photos!");
    }
  }

  Future<List<dynamic>> getUsers() async {
    final response = await http.get(Uri.parse("$baseUrl/users"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load users!");
    }
  }
}
