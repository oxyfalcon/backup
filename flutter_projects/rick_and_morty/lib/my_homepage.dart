import 'package:app/api_provider.dart';
import 'package:app/item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Options {
  final String text;
  final Icon icon;

  const Options({required this.text, required this.icon});
}

List<Options> options = const [
  Options(text: "Characters", icon: Icon(Icons.person_3)),
  Options(text: "Locations", icon: Icon(Icons.location_on)),
  Options(text: "Episode", icon: Icon(Icons.tv))
];

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var selectedIndexState = ref.watch(valueProvider.notifier);
    var index = ref.watch(valueProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(options[index].text),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(10), left: Radius.circular(10))),
      ),
      body: const ItemList(),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      drawer: NavigationDrawer(
        onDestinationSelected: (value) {
          selectedIndexState.change(value);
          Navigator.of(context).pop();
        },
        selectedIndex: index,
        children: [
          ...options.map((e) {
            return NavigationDrawerDestination(
                icon: e.icon, label: Text(e.text));
          }).toList()
        ],
      ),
    );
  }
}
