import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/albums_controller.dart';

class AlbumList extends StatelessWidget {
  final AlbumsController albumsController = Get.put(AlbumsController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => albumsController.isLoading.value
            ? const Center(child: CircularProgressIndicator(color: Colors.blue,))
            : ListView.builder(
                itemCount: albumsController.albums.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(albumsController.albums[index].title),
                    subtitle: Text('ID: ${albumsController.albums[index].id}'),
                    leading: Image.network(albumsController.albums[index].url),
                  );
                },
              ),
      ),
    );
  }
}
