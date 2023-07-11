import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Application",
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        ),
        home: const MyHomePage2());
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});
  static List<String> l2 = [];
  static String noun2 = WordGenerator().randomName();
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

    IconData icon;
    if (MyHomePage2.l2.contains(MyHomePage2.noun2)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border_outlined;
    }

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Builder(builder: (context) {
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
                        Builder(builder: (context) {
                          final theme = Theme.of(context);
                          return Card(
                            surfaceTintColor: theme.primaryColorDark,
                            shadowColor: theme.cardColor,
                            color: theme.colorScheme.primary,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                child: Text(
                                  MyHomePage2.noun2.toLowerCase(),
                                  style: style,
                                  selectionColor: theme.cardColor,
                                ),
                              ),
                            ),
                          );
                        }),
                        Builder(builder: (context) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      MyHomePage2.l2.add(MyHomePage2.noun2);
                                    });
                                  },
                                  icon: Icon(icon),
                                  label: const Text("like"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      MyHomePage2.noun2 =
                                          WordGenerator().randomNoun();
                                    });
                                  },
                                  child: const Text("Next"),
                                ),
                              )
                            ],
                          );
                        }),
                      ])),
            ),
          );
        });

      // GeneratorWord(style2: style2, style: style, icon: icon);
      case 1:
        page = Builder(builder: (context) {
          final theme = Theme.of(context);

          if (MyHomePage2.l2.isEmpty) {
            return Builder(builder: (context) {
              return Scaffold(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  body: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FittedBox(
                          child: Text("No Favourites",
                              style: theme.textTheme.labelLarge)),
                    ),
                  ));
            });
          } else {
            return Builder(builder: (context) {
              return Scaffold(
                backgroundColor: theme.colorScheme.primaryContainer,
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: FittedBox(
                        child: Text(
                          "You have ${MyHomePage2.l2.length} favourites",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.start,
                          style: theme.textTheme.displaySmall,
                        ),
                      ),
                    ),
                    for (String i in MyHomePage2.l2)
                      ListTile(
                        title: Text(i),
                        leading: IconButton(
                          icon: const Icon(Icons.delete_outlined),
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () {
                            setState(() {
                              MyHomePage2.l2.remove(i);
                            });
                          },
                        ),
                      )
                  ],
                ),
              );
            });
          }
        });

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
