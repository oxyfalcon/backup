import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedHomePage(
      m: MyHomePage2State(),
      name: WordGenerator().randomName(),
      child: MaterialApp(
          title: "Application",
          theme: ThemeData(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
          ),
          home: const MyHomePage2()),
    );
  }
}

class InheritedHomePage extends InheritedWidget {
  const InheritedHomePage({
    Key? key,
    required this.m,
    required Widget child,
    required this.name,
  }) : super(key: key, child: child);

  final String name;
  final MyHomePage2State m;

  @override
  bool updateShouldNotify(InheritedHomePage oldWidget) {
    return name != oldWidget.name;
  }

  static MyHomePage2State of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedHomePage>()!.m;
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => MyHomePage2State();
}

class MyHomePage2State extends State<MyHomePage2> {
  int selectedIndex = 0;
  static final List<String> _nameList = [];
  List<String> get nameList => _nameList;
  String _names = WordGenerator().randomName();
  String get names => _names;

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

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorWord();
      case 1:
        page = const NumberOfFavorites();
      default:
        throw ("unimplemented Error");
    }

    return InheritedHomePage(
      name: _names,
      m: this,
      child: LayoutBuilder(
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
      ),
    );
  }
}

class GeneratorWord extends StatelessWidget {
  const GeneratorWord({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style2 = theme.textTheme.displaySmall;
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Word Generator", style: style2),
                  const Names(),
                  const ButtonWidget(),
                ])),
      ),
    );
  }
}

class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key});

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    final currentStateList = InheritedHomePage.of(context).nameList;
    final currentState = InheritedHomePage.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: FittedBox(
              child: Text(
                "You have ${currentStateList.length} favourites",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                style: theme.textTheme.displaySmall,
              ),
            ),
          ),
          for (String i in currentStateList)
            ListTile(
                title: Text(i),
                leading: IconButton(
                    icon: const Icon(Icons.delete_outlined),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      setState(() {
                        currentState.removeName(i);
                      });
                    }))
        ],
      ),
    );
  }
}

class NumberOfFavorites extends StatelessWidget {
  const NumberOfFavorites({super.key});
  @override
  Widget build(BuildContext context) {
    final currentStateList = InheritedHomePage.of(context).nameList;

    if (currentStateList.isEmpty) {
      return const NoFavorites();
    } else {
      return const FavoriteList();
    }
  }
}

class NoFavorites extends StatelessWidget {
  const NoFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
  });

  @override
  State<ButtonWidget> createState() => ButtonWidgetState();
}

class ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final currentStateList = InheritedHomePage.of(context).nameList;
    final currentState = InheritedHomePage.of(context);
    final currentStateNames = InheritedHomePage.of(context).names;
    IconData? icon1 = Icons.favorite_border_outlined;
    if (currentStateList.contains(currentStateNames)) {
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
                if (currentStateList.contains(currentStateNames)) {
                  currentStateList.remove(currentStateNames);
                } else {
                  currentStateList.add(currentStateNames);
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
              icon1 = Icons.favorite_border_outlined;
              currentState.namesGenerator();
            },
            child: const Text("Next"),
          ),
        )
      ],
    );
  }
}

class Names extends StatelessWidget {
  const Names({super.key});

  @override
  Widget build(BuildContext context) {
    final currentStateName = InheritedHomePage.of(context).names;
    final theme = Theme.of(context);
    final style =
        theme.textTheme.displaySmall!.copyWith(color: theme.canvasColor);
    return Card(
      surfaceTintColor: theme.primaryColorDark,
      shadowColor: theme.cardColor,
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            currentStateName,
            style: style,
            selectionColor: theme.cardColor,
          ),
        ),
      ),
    );
  }
}
