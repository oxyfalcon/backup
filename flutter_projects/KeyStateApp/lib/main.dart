import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';

final GlobalKey<MyHomePage2State> myHomePageList =
    GlobalKey<MyHomePage2State>();

void main() {
  runApp(const Testapp());
}

class Testapp extends StatelessWidget {
  const Testapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Application",
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        ),
        home: MyHomePage2(key: myHomePageList));
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => MyHomePage2State();
}

class MyHomePage2State extends State<MyHomePage2> {
  int selectedIndex = 0;
  String _names = WordGenerator().randomName();
  String get names => _names;
  static final List<String> _nameList = [];
  List<String> get nameList => _nameList;

  void namesGenerator() {
    setState(() {
      _names = WordGenerator().randomName();
    });
  }

  void removeName(String na) {
    setState(() {
      _nameList.remove(na);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style =
        theme.textTheme.displaySmall!.copyWith(color: theme.canvasColor);
    final style2 = theme.textTheme.displaySmall;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorWord(
          style2: style2,
          style: style,
          nameList: _nameList,
          names: names,
        );
      case 1:
        page = FavoriteWidgetPage(
            nameList: MyHomePage2State._nameList,
            name: myHomePageList.currentState!.names);
      default:
        throw ("unimplemented Error");
    }

    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: SafeArea(
            child: Row(
          children: [
            NavigationRail(
              destinations: [
                NavigationRailDestination(
                  icon: const Icon(Icons.home),
                  label: const Text("Home"),
                  indicatorColor: theme.colorScheme.onPrimary,
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.favorite),
                  label: const Text("Likes"),
                  indicatorColor: theme.colorScheme.primaryContainer,
                ),
              ],
              selectedIndex: selectedIndex,
              indicatorColor: theme.colorScheme.primaryContainer,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              extended: constraints.maxWidth >= 500,
              minExtendedWidth: 150,
            ),
            Expanded(child: page)
          ],
        )),
      ),
    );
  }
}

class GeneratorWord extends StatelessWidget {
  const GeneratorWord(
      {super.key,
      required this.style2,
      required this.style,
      required this.names,
      required this.nameList});

  final TextStyle? style2;
  final TextStyle style;
  final String names;
  final List<String> nameList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Word Generator", style: style2),
                  Names(names: names, style: style),
                  ButtonWidget(nameList: nameList, names: names),
                ])),
      ),
    );
  }
}

class FavoriteWidgetPage extends StatelessWidget {
  const FavoriteWidgetPage(
      {super.key, required this.nameList, required this.name});
  final List<String> nameList;
  final String name;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (nameList.isEmpty) {
      return NoFavorites(theme: theme);
    } else {
      return NumberOfFavorites(
        theme: theme,
        nameList: nameList,
        name: name,
      );
    }
  }
}

class NumberOfFavorites extends StatelessWidget {
  const NumberOfFavorites(
      {super.key,
      required this.theme,
      required this.nameList,
      required this.name});

  final ThemeData theme;
  final List<String> nameList;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: FittedBox(
              child: Text(
                "You have ${nameList.length} favourites",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                style: theme.textTheme.displaySmall,
              ),
            ),
          ),
          for (String i in nameList)
            ListTile(
              title: Text(i),
              leading: IconButton(
                  icon: const Icon(Icons.delete_outlined),
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () => myHomePageList.currentState!.removeName(i)),
            )
        ],
      ),
    );
  }
}

class NoFavorites extends StatelessWidget {
  const NoFavorites({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.colorScheme.primaryContainer,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FittedBox(
                child:
                    Text("No Favourites", style: theme.textTheme.labelLarge)),
          ),
        ));
  }
}

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.names,
    required this.nameList,
  });

  final String names;
  final List<String> nameList;

  @override
  State<ButtonWidget> createState() => ButtonWidgetState();
}

class ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    IconData? icon1 = Icons.favorite_border_outlined;
    if (myHomePageList.currentState!.nameList.contains(widget.names)) {
      icon1 = Icons.favorite;
    } else {
      icon1 = Icons.favorite_border_outlined;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              setState(() {
                if (myHomePageList.currentState!.nameList
                    .contains(widget.names)) {
                  myHomePageList.currentState!.nameList.remove(widget.names);
                } else {
                  myHomePageList.currentState!.nameList.add(widget.names);
                }
              });
            },
            icon: Icon(icon1),
            label: const Text("Like"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                icon1 = Icons.favorite_border_outlined;
              });
              myHomePageList.currentState!.namesGenerator();
            },
            child: const Text("Next"),
          ),
        )
      ],
    );
  }
}

class Names extends StatelessWidget {
  const Names({super.key, required this.style, required this.names});

  final TextStyle? style;
  final String names;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      surfaceTintColor: theme.primaryColorDark,
      shadowColor: theme.cardColor,
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            names,
            style: style,
            selectionColor: theme.cardColor,
          ),
        ),
      ),
    );
  }
}
