import 'package:app/api_provider.dart';
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
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
              label: Text("Search"),
            ),
          ),
        ),
        const DisplayList(),
      ],
    );
  }
}

class DisplayList extends ConsumerWidget {
  const DisplayList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(apiProvider);
    return locationState.when(
        data: (list) => Expanded(
              child: ListView(
                children: [
                  for (var itr in list)
                    ListTile(
                      title: Text(itr.name),
                    )
                ],
              ),
            ),
        error: (error, stacktrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
