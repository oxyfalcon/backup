import 'package:app/Widgets/Buttonwidgets/submit_button.dart';
import 'package:app/Widgets/ToDoWidgets/todo.dart';
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

  @override
  void initState() {
    super.initState();
    textOutputDescription.addListener(description);
    textOutputTitle.addListener(title);
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose: ToDoADDERSTATE");
  }

  String title() {
    return textOutputTitle.text;
  }

  String description() {
    return textOutputDescription.text;
  }

  void addText(String title, String description) {
    textOutputTitle.text = title;
    textOutputDescription.text = description;
  }

  void editTiles(
      {required MapEntry<String, String> original,
      required MapEntry<String, String> edited}) {
    Map<String, String> newMap = {};
    globalKeyTodoState.currentState!.map.forEach((key, value) {
      globalKeyTodoState.currentState!.map.containsKey(original.key)
          ? newMap.addEntries([edited])
          : newMap.addEntries([MapEntry<String, String>(key, value)]);
    });
    print("original: ${original}");
    print("edited: $edited");
    globalKeyTodoState.currentState!.map = newMap;
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    var x =
        ModalRoute.of(context)!.settings.arguments as MapEntry<String, String>;
    addText(x.key, x.value);
    print("ToDoAdderState build");
    print("${textOutputDescription.text}, ${textOutputTitle.text}");
    if (ModalRoute.of(context)!.settings.name == "/edit") {
      addText(x.key, x.value);
    }

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
                  textOutputTitle.text = value;
                  print("Title Field: $value");
                },
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Enter Title"),
                controller: textOutputTitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                onChanged: (value) {
                  textOutputDescription.text = value;
                  print("Description Field: $value");
                },
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
