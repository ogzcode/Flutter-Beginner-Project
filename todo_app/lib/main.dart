import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import "package:todo_app/components/todo_list.dart";
import "./notifier/todo_model.dart";
import "./components/add_button.dart";

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TodoModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App Demo',
              style: TextStyle(color: Colors.white)),
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
        body: const TodoList(),
        floatingActionButton: const AddButton(),
      ),
    );
  }
}
