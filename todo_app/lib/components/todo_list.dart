import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import "../notifier/todo_model.dart";

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<TodoModel>(context);
    return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Checkbox(
          value: todo.isDone,
          activeColor: Colors.blue,
          onChanged: (value) {
            todoModel.toggle(todo);
          },
        ),
        title: Text(todo.title),
        subtitle: Text(todo.description),
        trailing: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onPressed: () {
            todoModel.remove(todo);
          },
        ));
  }
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<TodoModel>(context);
    return ListView.builder(
      itemCount: todoModel.todos.length,
      itemBuilder: (context, index) {
        final todo = todoModel.todos[index];
        return TodoItem(todo: todo);
      },
    );
  }
}
