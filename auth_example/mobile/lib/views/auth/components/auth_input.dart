import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final String label;
  final bool error;
  final String type;
  final String hintText;
  final Function(String, String) onChangeInput;

  AuthInput({
    required this.label,
    required this.error,
    required this.type,
    required this.hintText,
    required this.onChangeInput,
  });

  getIconByType() {
    if (type == "username") {
      return Icon(Icons.person, color: error ? Colors.red : Colors.black);
    } else if (type == "email") {
      return Icon(Icons.email, color: error ? Colors.red : Colors.black);
    } else if (type == "password") {
      return Icon(Icons.lock, color: error ? Colors.red : Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 32, left: 32, right: 32),
        height: 56,
        child: TextFormField(
            onChanged: (value) => onChangeInput(type, value),
            obscureText: type == "password",
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: getIconByType(),
              labelText: label,
              labelStyle: TextStyle(
                color: error ? Colors.red : Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: error ? Colors.red : Colors.black,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: error ? Colors.red : Colors.black,
                ),
              ),
            )));
  }
}
