import 'package:app/Widgets/Buttonwidgets/submit_button.dart';
import 'package:flutter/material.dart';

final GlobalKey<TodoAdderState> globalKeyToDoAdderState =
    GlobalKey<TodoAdderState>();

class InheritedTodoAdder extends InheritedWidget {
  const InheritedTodoAdder(
      {Key? key, required Widget child, required TodoAdderState state})
      : _state = state,
        super(key: key, child: child);

  final TodoAdderState _state;
  @override
  bool updateShouldNotify(InheritedTodoAdder oldWidget) {
    return _state != oldWidget._state;
  }

  static TodoAdderState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedTodoAdder>()!._state;
}

class TodoAdder extends StatefulWidget {
  const TodoAdder({super.key});

  @override
  State<TodoAdder> createState() => TodoAdderState();
}

class TodoAdderState extends State<TodoAdder> {
  TextEditingController textOutputTitle = TextEditingController();
  TextEditingController textOutputDescription = TextEditingController();

  String title() {
    return textOutputTitle.text;
  }

  String description() {
    return textOutputDescription.text;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InheritedTodoAdder(
      state: this,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Task"),
          backgroundColor: theme.colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                onChanged: (value) {
                  print("${textOutputTitle.text}");
                },
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Enter Title"),
                controller: textOutputTitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                onChanged: (value) => setState(() {}),
                controller: textOutputDescription,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Enter Description"),
              ),
            ),
            const SubmitButton()
          ],
        ),
      ),
    );
  }
}
