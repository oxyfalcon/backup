import 'package:flutter/material.dart';
import 'package:youtube_clone/Homepage/Client/client_widget.dart';
import 'package:youtube_clone/all_colors.dart';
import 'package:youtube_clone/bottom_tab_bar.dart';
import 'package:youtube_clone/Homepage/custom_listtile/leading.dart';
import 'package:youtube_clone/Homepage/revenue_widget/revenue_widget.dart';
import 'package:youtube_clone/Homepage/custom_listtile/trailing.dart';
import 'package:youtube_clone/card_title.dart';

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
        colorSchemeSeed: ColorMap.bluePrimary,
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
        scrolledUnderElevation: 0,
        backgroundColor: ColorMap.whiteBackground,
        title: const Text(
          "Dashboard",
          style:
              TextStyle(fontFamily: "Arial1", color: ColorMap.globalMainText),
        ),
        centerTitle: true,
      ),
      backgroundColor: ColorMap.greyBackGround,
      body: SafeArea(
        child: ListView(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Starts in 5 minutes',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Arial1",
                        fontWeight: FontWeight.w500,
                        color: ColorMap.globalMainText),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Card(
                        shadowColor: ColorMap.listTileShadow,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(color: ColorMap.bluePrimary)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 1, child: Leading()),
                            Expanded(flex: 4, child: Trailing())
                          ],
                        )),
                  ),
                ],
              ),
            ),
            CardTitle(
              text: "Revenue",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RevenueWidget(),
            ),
            CardTitle(text: "Clients"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ClientWidget(),
            )
          ],
        ),
      ),
    );
  }
}
