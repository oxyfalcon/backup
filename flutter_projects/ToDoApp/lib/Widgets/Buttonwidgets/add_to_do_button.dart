import 'package:app/screens/todo_adder.dart';
import 'package:flutter/material.dart';

class AddToDoButton extends StatelessWidget {
  const AddToDoButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TodoAdder(),
                      settings: const RouteSettings(
                          name: '/todoadder',
                          arguments: MapEntry<String, String>("", ""))));
            },
            backgroundColor: theme.colorScheme.inversePrimary,
            label: const Text("Add ToDo")),
      ),
    );
  }
}
