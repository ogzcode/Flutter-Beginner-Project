import 'package:get/get.dart';
import 'package:mobile/utils/storage_manager.dart';

class SplashController extends GetxController with StorageManager {
  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }

  void checkAuth() async {
    final token = await getString('token');
    if (token != null) {
      Get.offNamed('/home');
    } else {
      Get.offNamed('/login');
    }
  }
}
