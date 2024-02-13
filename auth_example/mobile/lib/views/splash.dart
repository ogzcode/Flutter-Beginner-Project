import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/splash_controller.dart';

class Splash extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}   