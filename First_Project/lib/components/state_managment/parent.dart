import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  const Parent({Key? key}) : super(key: key);

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  bool _active = false;

  void _handleTap(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 32),
        child: TabBox(
          active: _active,
          onChanged: _handleTap,
        ));
  }
}

class TabBox extends StatelessWidget {
  const TabBox({super.key, this.active = false, required this.onChanged});

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Container(
          decoration: BoxDecoration(
              color: active ? Colors.lightGreen[700] : Colors.grey[600]),
          child: Center(
              child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          )),
        ));
  }
}
