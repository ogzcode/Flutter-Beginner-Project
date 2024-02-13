import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedirectBtn extends StatelessWidget {
  final String btnText;
  final String redirectRoute;

  const RedirectBtn(
      {Key? key, required this.btnText, required this.redirectRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: TextButton(
        onPressed: () {
          Get.toNamed(redirectRoute);
        },
        child: Text(btnText,
            style: const TextStyle(fontSize: 16, color: Colors.indigo)),
      ),
    );
  }
}
