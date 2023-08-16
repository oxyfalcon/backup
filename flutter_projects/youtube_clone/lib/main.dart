import 'package:flutter/material.dart';
import 'package:youtube_clone/Homepage/Client/client_widget.dart';
import 'package:youtube_clone/all_colors.dart';
import 'package:youtube_clone/bottom_tab_bar.dart';
import 'package:youtube_clone/Homepage/custom_listTile/leading.dart';
import 'package:youtube_clone/Homepage/revenue_widget/revenue_widget.dart';
import 'package:youtube_clone/Homepage/custom_listTile/trailing.dart';
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
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Starts in 5 minutes',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Arial1",
                        fontWeight: FontWeight.w500,
                        color: ColorMap.globalMainText),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Card(
                        surfaceTintColor: Colors.white,
                        color: ColorMap.whiteBackground,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            side: BorderSide(color: ColorMap.bluePrimary)),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Leading(),
                                  )),
                              const Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Trailing(),
                                  )),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: ColorMap.bluePrimary,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
            const CardTitle(
              text: "Revenue",
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RevenueWidget(),
            ),
            const CardTitle(text: "Clients"),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ClientWidget(),
            )
          ],
        ),
      ),
    );
  }
}
