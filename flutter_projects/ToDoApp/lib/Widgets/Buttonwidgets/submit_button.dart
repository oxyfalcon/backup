import 'package:app/Widgets/ToDoWidgets/todo.dart';
import 'package:app/screens/todo_adder.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final todoState = globalKeyTodoState.currentState;
    final todoAdderState = InheritedTodoAdder.of(context);
    final MapEntry<String, String> x =
        ModalRoute.of(context)!.settings.arguments as MapEntry<String, String>;

    return ElevatedButton(
        onPressed: () {
          if (ModalRoute.of(context)!.settings.name == "/edit") {
            print("Coming From Edit");
            todoAdderState.addText(x.key, x.value);
            todoAdderState.editTiles(
                original: x,
                edited: MapEntry(todoAdderState.textOutputTitle.text,
                    todoAdderState.textOutputDescription.text));
          } else if (ModalRoute.of(context)!.settings.name == "/todoadder") {
            print("coming from Add to do");
            todoState!.addTiles(MapEntry(
                todoAdderState.title(),
                (InheritedTodoAdder.of(context).description() == "")
                    ? "No Description"
                    : todoAdderState.description()));
          }
          Navigator.pop(context);
        },
        child: const Text("Submit"));
  }
}
