import 'package:flutter/material.dart';

class AddToDoButton extends StatelessWidget {
  const AddToDoButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(children: [
      Container(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              backgroundColor: theme.colorScheme.inversePrimary,
              label: const Text("Add ToDo")),
        ),
      )
    ]);
  }
}
