import 'package:flutter/material.dart';
import 'package:navigation_example/notifier/counter.dart';
import 'package:provider/provider.dart';

class Decrement extends StatelessWidget {
  const Decrement({Key? key}) : super(key: key);

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
                // Increment fonksiyonunu çağır
                counterModel.decrement();
              },
              child: const Text(
                'Decrement',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
