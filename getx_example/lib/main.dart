import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/albums_controller.dart';
import 'package:getx_example/views/album_list.dart';
import 'package:getx_example/views/fetch_btn.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final AlbumsController albumsController = Get.put(AlbumsController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Counter App'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            FetchBtn(),
            AlbumList(),
          ],
        ),
      ),
    );
  }
}
