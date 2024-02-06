import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/albums_controller.dart';

class FetchBtn extends StatelessWidget {
  FetchBtn({
    Key? key,
  }) : super(key: key);

  final AlbumsController albumsController = Get.put(AlbumsController());

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            onPressed: () {
              albumsController.fetchAlbums();
            },
            child: const Text('Fetch Albums'),
          ),
        ));
  }
} 