import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/albums_controller.dart';
import 'package:getx_example/route/pages.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final AlbumsController albumsController = Get.put(AlbumsController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: Pages.pages,
    );
  }
}
