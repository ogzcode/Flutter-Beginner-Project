import "package:get/get.dart";
import "package:mobile/views/auth/login.dart";
import "package:mobile/views/auth/register.dart";
import "package:mobile/views/home/home.dart";
import "package:mobile/views/splash.dart";

abstract class Pages {
  static final pages = [
    GetPage(
      name: "/login",
      page: () => Login(),
      title: "Login",
    ),
    GetPage(
      name: "/register",
      page: () => Register(),
      title: "Register",
    ),
    GetPage(
      name: "/home",
      page: () => Home(),
      title: "Home",
    ),
    GetPage(
      name: "/splash",
      page: () => Splash(),
      title: "Splash",
    ),
  ];
}
