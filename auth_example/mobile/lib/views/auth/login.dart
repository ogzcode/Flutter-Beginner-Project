import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/auth_controller.dart';
import 'package:mobile/utils/alert_manager.dart';
import 'package:mobile/views/auth/components/auth_btn.dart';
import 'package:mobile/views/auth/components/auth_input.dart';
import 'package:mobile/views/auth/components/redirect_btn.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with AlertManager {
  String email = "";
  String password = "";
  List<Map<String, String>> errorList = [];

  final AuthController authController = Get.put(AuthController());

  handleChangeInput(String input, String value) {
    setState(() {
      if (input == "email") {
        email = value;
        errorList.removeWhere((element) => element["field"] == "email");
      } else if (input == "password") {
        password = value;
        errorList.removeWhere((element) => element["field"] == "password");
      }
    });
  }

  handleLogin() {
    List<Map<String, String>> errors = [];
    if (email.isEmpty) {
      errors.add({
        "field": "email",
        "message": "Email is required",
      });
    }
    if (password.isEmpty) {
      errors.add({
        "field": "password",
        "message": "Password is required",
      });
    }

    if (errors.isNotEmpty) {
      setState(() {
        errorList = errors;
      });
      error("Error", "Please fill in all fields.");
      return;
    }
    authController.login(email, password);
  }

  isInputError(String type) {
    return errorList.any((element) => element["field"] == type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Login", style: TextStyle(fontSize: 36)),
        AuthInput(
            label: "Email",
            error: isInputError("email"),
            type: "email",
            hintText: "Enter your email.",
            onChangeInput: handleChangeInput),
        AuthInput(
            label: "Password",
            error: isInputError("password"),
            type: "password",
            hintText: "Enter your password.",
            onChangeInput: handleChangeInput),
        AuthBtn(onAuthPressed: handleLogin, btnText: "Login"),
        const RedirectBtn(
            btnText: "Don't have an account? Register",
            redirectRoute: "/register"),
      ],
    ));
  }
}
