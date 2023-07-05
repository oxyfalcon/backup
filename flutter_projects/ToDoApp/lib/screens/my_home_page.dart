import 'package:app/Widgets/ToDoWidgets/todo_tiles.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            "ToDo List",
            style: theme.textTheme.headlineMedium,
          ),
        ),
        body: TodoTiles(
          key: globalKeyTodoTilesState,
        ));
  }
}
