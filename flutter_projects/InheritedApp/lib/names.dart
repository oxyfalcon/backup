import 'package:app/main.dart';
import 'package:flutter/material.dart';

class Names extends StatelessWidget {
  const Names({super.key, required this.style});

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStateName = InheritedHomePage.of(context).names;
    final theme = Theme.of(context);
    return Card(
      surfaceTintColor: theme.primaryColorDark,
      shadowColor: theme.cardColor,
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            currentStateName,
            style: style,
            selectionColor: theme.cardColor,
          ),
        ),
      ),
    );
  }
}
