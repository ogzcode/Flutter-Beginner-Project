import "../models/album.dart";
import "../services/api_services.dart";

class AlbumsController {
  final ApiServices apiServices = ApiServices();

  Future<List<Album>> getAlbumsByUserId(int id) async {
    final List<dynamic> albums = await apiServices.getAlbumsByUserId(id);
    return albums.map((e) => Album.fromJson(e)).toList();
  }
}