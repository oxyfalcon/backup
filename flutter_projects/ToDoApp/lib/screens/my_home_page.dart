import 'package:app/Widgets/ToDoWidgets/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: Text(
            "ToDo List",
            style: theme.textTheme.headlineMedium,
          ),
        ),
        body: Todo(key: globalKeyTodoState));
  }
}

// class BarNaviagtion extends StatefulWidget {
//   const BarNaviagtion({super.key});

//   @override
//   State<BarNaviagtion> createState() => _BarNaviagtionState();
// }

// class _BarNaviagtionState extends State<BarNaviagtion> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     Widget page;
//     switch (selectedIndex) {
//       case 0:
//         page = Todo(key: globalKeyTodoState);
//       case 1:
//         page = TodoAdder(key: globalKeyToDoAdderState);
//         break;
//       default:
//         throw ("HUGEE ERROR");
//     }

//     return Scaffold(
//       body: page,
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (value) {
//           setState(() {
//             selectedIndex = value;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
//           BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Home')
//         ],
//         selectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
//       ),
//     );
//   }
// }
