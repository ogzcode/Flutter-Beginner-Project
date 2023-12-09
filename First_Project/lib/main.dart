import 'package:flutter/material.dart';

import 'components/title/title_section.dart';
import 'components/button/button_section.dart';
import 'components/content/content_section.dart';
import 'components/image_section.dart';

import 'components/state_managment/state_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(title: const Text("Layout demo")),
            body: ListView(
              children: [
                ImageSection(),
                TitleSection(),
                ButtonSection(),
                ContentSection(),
                const StateMain(),
              ],
            )));
  }
}
