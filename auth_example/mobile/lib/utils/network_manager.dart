import "package:dio/dio.dart";
import "package:get/get.dart";
import "package:mobile/utils/endpoints.dart";
import "package:mobile/utils/storage_manager.dart";

class NetworkManager with StorageManager {
  static final NetworkManager _instance = NetworkManager._internal();
  final Dio _dio = Dio();

  factory NetworkManager() {
    return _instance;
  }

  NetworkManager._internal() {
    _dio.options.baseUrl = Endpoints.baseUrl;
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final token = await getString("token");
      if (token != null) {
        options.headers["Authorization"] = "Bearer $token";
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      if (response.statusCode == 401) {
        clear();
        Get.offAllNamed("/login");
      }

      return handler.next(response);
    }));
  }

  Future<dynamic> get(String path) async {
    return await _dio.get(path);
  }

  Future<dynamic> post(String path, dynamic data) async {
    return await _dio.post(path, data: data);
  }

  Future<dynamic> put(String path, dynamic data) async {
    return await _dio.put(path, data: data);
  }

  Future<dynamic> delete(String path) async {
    return await _dio.delete(path);
  }
}
