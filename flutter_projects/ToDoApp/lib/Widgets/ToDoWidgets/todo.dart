import 'package:app/Widgets/ToDoWidgets/tile_widget.dart';
import 'package:app/screens/no_to_do_list.dart';
import 'package:flutter/material.dart';

final GlobalKey<TodoState> globalKeyTodoState = GlobalKey<TodoState>();

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => TodoState();
}

class TodoState extends State<Todo> {
  static Map<String, String> _map = <String, String>{};
  Map<String, String> get map => _map;

  set map(Map<String, String> m) {
    _map = m;
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose: TODOState");
  }

  void addTiles(MapEntry<String, String> entry) {
    setState(() {
      map.addEntries([entry]);
    });
  }

  void deleteTiles(String key) {
    setState(() {
      map.remove(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("TodoState widget");
    final theme = Theme.of(context);

    if (map.isEmpty) {
      return const NoToDoList();
    } else {
      return TileWidget(
        map: map,
        theme: theme,
      );
    }
  }
}
