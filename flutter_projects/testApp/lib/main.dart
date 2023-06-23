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
                colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color.fromRGBO(66, 108, 176, 1))),
            home: const MyHomePage2()));
  }
}

class Generator extends ChangeNotifier {
  var noun = WordGenerator().randomName();
}

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium;

    var appState = context.watch<Generator>();
    var word = appState.noun;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    appState.noun.toLowerCase(),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text("Word Generator", style: style),
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
                      ElevatedButton.icon(
                          onPressed: () => Void,
                          icon: const Icon(Icons.favorite_border_outlined),
                          label: const Text("Next"))
                    ],
                  ),
                ])),
      ),
    );
  }
}
