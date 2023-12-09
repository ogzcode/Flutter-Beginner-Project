import "../models/photo.dart";
import "../services/api_services.dart";

class PhotoController {
  final ApiServices apiServices = ApiServices();

  Future<List<Photo>> getPhotosByAlbumId(int id) async {
    final List<dynamic> photos = await apiServices.getPhotosByAlbumId(id);
    return photos.map((photo) => Photo.fromJson(photo)).toList();
  }
}
