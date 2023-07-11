import 'package:app/button/add_button.dart';
import 'package:app/button/delete_button.dart';
import 'package:app/button/edit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/Provider/notify_provider.dart';

class ShowingTodo extends StatelessWidget {
  const ShowingTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Column(mainAxisSize: MainAxisSize.min, children: [
        Tiles(),
      ]),
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
            alignment: Alignment.bottomRight, child: const AddButton()),
      )
    ]);
  }
}

class Tiles extends ConsumerWidget {
  const Tiles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("todo screen build");
    List<Todo> list = ref.watch(todoProvider);
    final todoState = ref.watch(todoProvider.notifier);
    return Column(
      children: <Widget>[
        for (final itr in list)
          Card(
              child: ListTile(
            title: Text(itr.todo),
            subtitle: Text(itr.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                EditButton(itr: itr),
                DeleteButton(todoState: todoState, itr: itr),
              ],
            ),
          )),
      ],
    );
  }
}
