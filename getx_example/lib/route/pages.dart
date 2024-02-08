import 'package:get/get.dart';
import 'package:getx_example/views/comments.dart';
import 'package:getx_example/views/home.dart';

abstract class Pages {
  static final pages = [
    GetPage(
      name: '/',
      page: () => Home(),
    ),
    GetPage(
      name: '/comments/:id',
      page: () => Comments(),
    ),
  ];
}
