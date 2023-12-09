import 'package:flutter/material.dart';

class WidgetState extends StatefulWidget {
  const WidgetState({Key? key}) : super(key: key);

  @override
  State<WidgetState> createState() => _WidgetBoxState();
}

class _WidgetBoxState extends State<WidgetState> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Container(
          decoration: BoxDecoration(
              color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
          child: Center(
              child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          )),
        ));
  }
}
