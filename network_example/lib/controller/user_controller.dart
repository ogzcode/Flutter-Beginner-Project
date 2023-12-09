import "../models/user.dart";
import "../services/api_services.dart";

class UserController {
  final ApiServices apiServices = ApiServices();

  Future<List<User>> getUsers() async {
    final List<dynamic> users = await apiServices.getUsers();
    return users.map((e) => User.fromJson(e)).toList();
  }
}
