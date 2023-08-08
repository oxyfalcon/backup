import 'package:flutter/material.dart';
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
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Text(
          "Dashboard",
          style: TextStyle(
              fontFamily: "Arial1", color: Color.fromRGBO(70, 70, 70, 1)),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(
        child: ListView(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Starts in 5 minutes',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Arial1",
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(50, 50, 50, 1)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Card(
                        shadowColor: Color.fromRGBO(217, 222, 247, 1),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(
                                color: Color.fromRGBO(11, 48, 225, 1))),
                        child: Row(
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
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
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
                            color: Color.fromRGBO(50, 50, 50, 1)),
                      ),
                    ]))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RevenueWidget(),
            )
          ],
        ),
      ),
    );
  }
}
