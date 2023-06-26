import 'dart:ffi';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';

void main() {
  runApp(const Testapp());
}

class Testapp extends StatelessWidget {
  const Testapp({super.key});

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

  var l = <String>[];
  void getFavorites() {
    IconData icon;
    if (!l.contains(noun)) {
      l.add(noun);
      icon = Icons.favorite_border_outlined;
    } else {
      icon = Icons.favorite;
    }
  }
}

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium?.copyWith();
    final style2 = theme.textTheme.displaySmall;

    var appState = context.watch<Generator>();

    return Scaffold(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                          onPressed: () => Void,
                          icon: const Icon(Icons.favorite),
                          label: const Text("like"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                            onPressed: () => appState.getNextName(),
                            icon: const Icon(Icons.favorite_border_outlined),
                            label: const Text("Next")),
                      )
                    ],
                  ),
                ])),
      ),
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
        child: Text(
          appState.noun.toLowerCase(),
          style: style,
        ),
      ),
    );
  }
}
