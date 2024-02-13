import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile/utils/alert_manager.dart';
import 'package:mobile/utils/network_manager.dart';
import 'package:mobile/utils/storage_manager.dart';

class AuthController extends GetxController with AlertManager, StorageManager {
  final NetworkManager _networkManager = NetworkManager();
  final RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      final response = await _networkManager.post("/login", {
        "email": email,
        "password": password,
      });
      success("Success", "You have successfully logged in.");
      print(response.data["token"]);
      await saveString("token", response.data["token"]);
      Get.offAllNamed("/home");
    } catch (e) {
      if (e is DioException) {
        error("Error", e.response?.data["error"]);
      } else {
        error("Error", "An error occurred. Please try again later.");
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(String username, String email, String password) async {
    isLoading.value = true;
    try {
      final response = await _networkManager.post("/register", {
        "email": email,
        "password": password,
        "name": username,
      });
      success("Success", "You have successfully registered.");
      Get.toNamed("/login");
    } catch (e) {
      if (e is DioException) {
        error("Error", e.response?.data["error"]);
      } else {
        error("Error", "An error occurred. Please try again later.");
      }
    } finally {
      isLoading.value = false;
    }
  }
}
