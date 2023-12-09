import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import "../notifier/todo_model.dart";

class AddDialog extends StatefulWidget {
  const AddDialog({Key? key}) : super(key: key);

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _addTodo(context) {
    final todoModel = Provider.of<TodoModel>(context, listen: false);

    final String title = _titleController.text;
    final String description = _descriptionController.text;
    final Todo todo = Todo(
      title: title,
      description: description,
    );
    todoModel.add(todo);
  }

  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<TodoModel>(context, listen: false);
    print(todoModel.todos);
    return AlertDialog(
      title: const Text("Add Todo"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            style: const TextStyle(fontSize: 14),
            cursorColor: Colors.blue,
            decoration: const InputDecoration(
              hintText: "Title",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: _descriptionController,
            maxLines: null,
            cursorColor: Colors.blue,
            decoration: const InputDecoration(
              hintText: "Description",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel",
              style: TextStyle(color: Color.fromARGB(255, 65, 65, 65))),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              _addTodo(context);
              Navigator.pop(context);
            },
            child: const Text("Add", style: TextStyle(color: Colors.white))),
      ],
    );
  }
}
