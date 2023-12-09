import "package:flutter/material.dart";

class ButtonSection extends StatelessWidget {
  ButtonSection({Key? key}) : super(key: key);

  Widget _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [Icon(icon, color: color), Text(label)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        margin: const EdgeInsets.only(left: 32, right: 32),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
            _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
            _buildButtonColumn(Colors.blue, Icons.share, 'SHARE'),
          ],
        ));
  }
}
