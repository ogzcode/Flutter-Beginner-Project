import 'package:flutter/material.dart';

class ContentSection extends StatelessWidget {
  ContentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: const Text('''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.''',
          softWrap: true,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14,
            height: 1.4,
            letterSpacing: 1,
          )),
    );
  }
}
