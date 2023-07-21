import 'package:app/item_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rick And Morty"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(10), left: Radius.circular(10))),
      ),
      body: ItemList(),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      drawer: NavigationDrawer(
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
          Navigator.of(context).pop();
        },
        selectedIndex: _selectedIndex,
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
