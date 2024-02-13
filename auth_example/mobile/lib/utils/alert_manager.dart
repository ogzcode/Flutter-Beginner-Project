import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin AlertManager {
  void success(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 400),
        icon: const Icon(Icons.check, color: Colors.white, size: 36),
        shouldIconPulse: false);
  }

  void error(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 400),
        icon: const Icon(Icons.error, color: Colors.white, size: 36),
        shouldIconPulse: false);
  }

  void warning(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(milliseconds: 400),
        icon: const Icon(Icons.warning, color: Colors.white, size: 36),
        shouldIconPulse: false);
  }

  void info(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(milliseconds: 400),
        icon: const Icon(Icons.info, color: Colors.white, size: 36),
        shouldIconPulse: false);
  }
}
