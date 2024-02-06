import 'package:get/get.dart';
import 'package:getx_example/models/album.dart';
import 'package:getx_example/network/request.dart';

class AlbumsController extends GetxController {
  var albums = <Album>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAlbums();
    super.onInit();
  }

  void fetchAlbums() async {
    try {
      isLoading.value = true;
      var albumsList = await Request.fetchAlbum();
      albums.assignAll(albumsList);
    } finally {
      isLoading.value = false;
    }
  }
}
