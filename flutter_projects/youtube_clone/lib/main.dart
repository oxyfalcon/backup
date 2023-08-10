import 'package:flutter/material.dart';
import 'package:youtube_clone/all_colors.dart';
import 'package:youtube_clone/bottom_tab_bar.dart';
import 'package:youtube_clone/leading.dart';
import 'package:youtube_clone/revenue_widget.dart';
import 'package:youtube_clone/trailing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: colorMap[ColorTheme.bluePrimary],
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomTabBar(),
      appBar: AppBar(
        backgroundColor: colorMap[ColorTheme.whiteBackground],
        title: Text(
          "Dashboard",
          style: TextStyle(
              fontFamily: "Arial1", color: colorMap[ColorTheme.globalMainText]),
        ),
        centerTitle: true,
      ),
      backgroundColor: colorMap[ColorTheme.greyBackGround],
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Starts in 5 minutes',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Arial1",
                        fontWeight: FontWeight.w500,
                        color: colorMap[ColorTheme.globalMainText]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Card(
                      shadowColor: colorMap[ColorTheme.listTileShadow],
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(
                              color: colorMap[ColorTheme.bluePrimary]!)),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 1, child: Leading()),
                          Expanded(flex: 4, child: Trailing())
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        "Revenue",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Arial1",
                            fontWeight: FontWeight.w500,
                            color: colorMap[ColorTheme.globalMainText]),
                      ),
                    ]))),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RevenueWidget(),
            )
          ],
        ),
      ),
    );
  }
}
