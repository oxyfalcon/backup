import 'package:app/Widgets/Buttonwidgets/add_to_do_button.dart';
import 'package:app/screens/no_to_do_list.dart';
import 'package:flutter/material.dart';

final GlobalKey<TodoTilesState> globalKeyTodoTilesState =
    GlobalKey<TodoTilesState>();

class TodoTiles extends StatefulWidget {
  const TodoTiles({super.key});

  @override
  State<TodoTiles> createState() => TodoTilesState();
}

class TodoTilesState extends State<TodoTiles> {
  static final Map<String, String?> _map = <String, String?>{};
  Map<String, String?> get map => _map;

  void addTiles(MapEntry<String, String?> entry) {
    setState(() {
      map.addEntries([entry]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (map.isEmpty) {
      return const NoToDoList();
    } else {
      return tiles(theme);
    }
  }

  Padding tiles(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const AddToDoButton(),
          for (var k in globalKeyTodoTilesState.currentState!.map.keys)
            Card(
                surfaceTintColor: theme.colorScheme.inversePrimary,
                elevation: 3.0,
                child: ListTile(
                    leading: const IconButton(
                        onPressed: null, icon: Icon(Icons.favorite)),
                    title: Text(k),
                    tileColor: theme.colorScheme.onPrimary)),
        ],
      ),
    );
  }
}
