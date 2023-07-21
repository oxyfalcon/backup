import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ItemList extends ConsumerStatefulWidget {
  const ItemList({super.key});

  @override
  ConsumerState<ItemList> createState() => _ItemListState();
}

class _ItemListState extends ConsumerState<ItemList> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: TextField(
            autofocus: false,
            controller: search,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
              prefixIcon: Icon(Icons.search),
              label: Text("Search"),
              hintText: "seach",
            ),
          ),
        ),
        Card()
      ],
    );
  }
}
