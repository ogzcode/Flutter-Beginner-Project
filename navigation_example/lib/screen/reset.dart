import 'package:flutter/material.dart';
import 'package:navigation_example/notifier/counter.dart';
import 'package:provider/provider.dart';

class Reset extends StatelessWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    return Container(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Counter: ${counterModel.counter.toString()}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () {
            counterModel.reset();
          },
          child: const Text(
            'Reset',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    )));
  }
}
