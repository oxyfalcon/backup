import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';

void main() {
  runApp(const FirstApp());
}

class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Generator(),
        child: MaterialApp(
            title: "Application",
            theme: ThemeData(
              useMaterial3: true,
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
            ),
            home: const MyHomePage2()));
  }
}

class Generator extends ChangeNotifier {
  var noun = WordGenerator().randomName();

  void getNextName() {
    noun = WordGenerator().randomName();
    notifyListeners();
  }

  static var l = <String>[];

  void getFavorites() {
    if (l.contains(noun)) {
      l.remove(noun);
    } else {
      l.add(noun);
    }
    notifyListeners();
  }

  void removeFavourites(String str) {
    if (l.contains(str)) {
      l.remove(str);
    } else {
      throw UnimplementedError;
    }
    notifyListeners();
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style =
        theme.textTheme.displaySmall!.copyWith(color: theme.canvasColor);
    final style2 = theme.textTheme.displaySmall;

    var appState = context.watch<Generator>();

    IconData icon;
    if (Generator.l.contains(appState.noun)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border_outlined;
    }

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorWord(
            style2: style2, appState: appState, style: style, icon: icon);
      case 1:
        page = const FavoriteWidgetPage();
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
  const GeneratorWord({
    super.key,
    required this.style2,
    required this.appState,
    required this.style,
    required this.icon,
  });

  final TextStyle? style2;
  final Generator appState;
  final TextStyle style;
  final IconData icon;

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
                  Names(appState: appState, style: style),
                  ButtonWidget(appState: appState, icon: icon),
                ])),
      ),
    );
  }
}

class FavoriteWidgetPage extends StatelessWidget {
  const FavoriteWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appState = context.watch<Generator>();

    if (Generator.l.isEmpty) {
      return NoFavorites(theme: theme);
    } else {
      return NumberOfFavorites(theme: theme, appState: appState);
    }
  }
}

class NumberOfFavorites extends StatelessWidget {
  const NumberOfFavorites({
    super.key,
    required this.theme,
    required this.appState,
  });

  final ThemeData theme;
  final Generator appState;

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
                "You have ${Generator.l.length} favourites",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                style: theme.textTheme.displaySmall,
              ),
            ),
          ),
          for (String i in Generator.l)
            ListTile(
              title: Text(i),
              leading: IconButton(
                icon: const Icon(Icons.delete_outlined),
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => appState.removeFavourites(i),
              ),
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

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.appState,
    required this.icon,
  });

  final Generator appState;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () => appState.getFavorites(),
            icon: Icon(icon),
            label: const Text("like"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => appState.getNextName(),
            child: const Text("Next"),
          ),
        )
      ],
    );
  }
}

class Names extends StatelessWidget {
  const Names({
    super.key,
    required this.appState,
    required this.style,
  });

  final Generator appState;
  final TextStyle? style;

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
            appState.noun.toLowerCase(),
            style: style,
            selectionColor: theme.cardColor,
          ),
        ),
      ),
    );
  }
}
