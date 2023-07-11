import 'package:app/Widgets/Buttonwidgets/add_to_do_button.dart';
import 'package:flutter/material.dart';

class NoToDoList extends StatelessWidget {
  const NoToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.secondaryContainer,
        body: Stack(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FittedBox(
                  child: Text("No Todo", style: theme.textTheme.labelLarge)),
            ),
          ),
          const AddToDoButton()
        ]));
  }
}
