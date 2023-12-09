import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;
  final bool isDone;

  const Todo({
    required this.title,
    required this.description,
    this.isDone = false,
  });

  Todo copyWith({
    String? title,
    String? description,
    bool? isDone,
  }) {
    return Todo(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}

class TodoModel extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos {
    List<Todo> sortedTodos = List.from(_todos);

    sortedTodos.sort((a, b) => a.isDone ? 1 : -1);

    return sortedTodos;
  }

  void add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void remove(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void toggle(Todo todo) {
    final int index = _todos.indexOf(todo);

    if (index == -1) return;

    _todos[index] = todo.copyWith(isDone: !todo.isDone);

    notifyListeners();
  }
}
