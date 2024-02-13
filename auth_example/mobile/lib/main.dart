import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/route/pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: Pages.pages,
    );
  }
}
