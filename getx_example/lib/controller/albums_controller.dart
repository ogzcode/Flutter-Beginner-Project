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

  addLike(int index) {
    albums[index].likes++;
  }

  addComment(String id, String comment) {
    var index = albums.indexWhere((element) => element.id == int.parse(id));
    albums[index].comments.add(comment);
    print(albums[index].comments);
  }

  getAlbumLikes(int index) {
    return albums[index].likes.toString();
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
