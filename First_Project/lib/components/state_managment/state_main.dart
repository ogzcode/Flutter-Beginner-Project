import 'package:flutter/material.dart';

import "./widget_state.dart";
import "./parent.dart";

class StateMain extends StatelessWidget {
  const StateMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.only(top: 32),
      child: const Column(
        children: [
          Text(
            "State Management",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          WidgetState(),
          Parent(),
        ],
      ),
    );
  }
}
