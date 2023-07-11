import 'package:app/Widgets/Buttonwidgets/add_to_do_button.dart';
import 'package:app/Widgets/ToDoWidgets/todo.dart';
import 'package:app/screens/todo_adder.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class TileWidget extends StatefulWidget {
  const TileWidget({
    super.key,
    required this.map,
    required this.theme,
  });

  final Map<String, String> map;
  final ThemeData theme;

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  void dispose() {
    super.dispose();
    print("dispose: TILESTATE WIDGET");
  }
  // final int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    print("tileWidget");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          for (var k in widget.map.entries)
            Card(
              elevation: 3.0,
              child: ExpansionTileCard(
                  title: Text(k.key),
                  elevation: 0.0,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        k.value,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              globalKeyTodoState.currentState!
                                  .deleteTiles(k.key);
                            },
                            icon: const Icon(Icons.delete),
                            label: const Text("Delete"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        settings: RouteSettings(
                                            name: '/edit', arguments: k),
                                        builder: (context) => TodoAdder(
                                              key: globalKeyToDoAdderState,
                                            )));
                              },
                              icon: const Icon(Icons.edit),
                              label: const Text("Edit")),
                        )
                      ],
                    ),
                  ]),
            ),
          const AddToDoButton(),
        ],
      ),
    );
  }
}
