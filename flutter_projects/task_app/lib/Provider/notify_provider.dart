import 'package:app/screens/empty.dart';
import 'package:app/screens/todo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  String todo;
  String description;
  int id;

  Todo({required this.todo, required this.description, required this.id});
}

final todoProvider = NotifierProvider<TodoList, List<Todo>>(() {
  return TodoList();
});

class TodoList extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    return [];
  }

  void printList() {
    for (var itr in state) {
      print("${itr.todo}, ${itr.description}, ${itr.id} \n");
    }
  }

  void addTodo(Todo t) {
    state = [...state, t];
  }

  void deleTodo(Todo t) {
    state = List.from(state.where((element) => (element.id != t.id)));
  }

  void editTodo({required Todo original, required Todo edited}) {
    // for (var i in state) {
    //   print("${i.todo}, ${i.description}, ${i.id} \n");
    // }
    state = List.from(state.where((element) {
      if (element.id == edited.id) {
        element = edited;
      }
      return true;
    }));
  }
}

class PageDecider extends Notifier<Widget> {
  @override
  Widget build() {
    final watchingList = ref.watch(todoProvider);
    if (watchingList.isEmpty) {
      return const NoToDoList();
    } else {
      return const ShowingTodo();
    }
  }
}

final pageDeciderProvider =
    NotifierProvider<PageDecider, Widget>(() => PageDecider());

final idProvider = StateProvider<int>((ref) {
  int id = 0;
  return id;
});
