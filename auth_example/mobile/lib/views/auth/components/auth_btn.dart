import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mobile/controller/auth_controller.dart';

class AuthBtn extends StatelessWidget {
  final Function onAuthPressed;
  final String btnText;
  final AuthController authController = Get.put(AuthController());

  AuthBtn({Key? key, required this.onAuthPressed, required this.btnText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 64, right: 64, top: 32),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(128, 48),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            onAuthPressed();
          },
          child: Obx(() {
            return authController.isLoading.value
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Text(btnText);
          })),
    );
  }
}
