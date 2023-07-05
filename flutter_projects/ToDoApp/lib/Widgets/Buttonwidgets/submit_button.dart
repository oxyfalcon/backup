import 'package:app/Widgets/ToDoWidgets/todo_tiles.dart';
import 'package:app/screens/todo_adder.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final stateTile = globalKeyTodoTilesState.currentState;
    final stateToDoAdder = globalKeyToDoAdderState.currentState;
    return ElevatedButton(
        onPressed: () {
          stateTile!.addTiles(
              MapEntry(stateToDoAdder!.title(), stateToDoAdder.description()));
          if (stateToDoAdder.title() != "") {
            Navigator.of(context).pop();
          }
          (globalKeyTodoTilesState.currentState!.map.isEmpty)
              ? print("Empty")
              : print("not Empty");
        },
        child: const Text("Submit"));
  }
}
