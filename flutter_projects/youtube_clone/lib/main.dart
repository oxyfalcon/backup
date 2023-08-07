import 'package:flutter/material.dart';
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
      bottomNavigationBar: BottomOptions(),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Text("Dashboard"),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                        "Paid By Revenue",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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

class BottomOptions extends StatefulWidget {
  const BottomOptions({super.key});

  @override
  State<BottomOptions> createState() => BottomOptionsState();
}

class BottomOptionsState extends State<BottomOptions> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NavigationBar(
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          elevation: 0,
          selectedIndex: currentIndex,
          onDestinationSelected: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home_filled),
              label: "",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_4_rounded),
              label: "",
            ),
            NavigationDestination(
              icon: Icon(Icons.videocam),
              label: "",
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: "",
            ),
            NavigationDestination(icon: Icon(Icons.menu), label: "")
          ]),
    );
  }
}
