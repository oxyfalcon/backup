import 'package:flutter/material.dart';
import 'package:youtube_clone/Homepage/my_home_page.dart';
import 'package:youtube_clone/utils/all_colors.dart';
import 'package:youtube_clone/bottom_tab_bar.dart';
import 'package:youtube_clone/profile_page/profile_page.dart';

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
      home: const Material(child: MainPage()),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
        animationDuration: const Duration(milliseconds: 500),
        length: 5,
        vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: TabBarView(controller: _tabController, children: const [
              MyHomePage(),
              ProfilePage(),
              Placeholder(),
              Placeholder(),
              Placeholder()
            ]),
          ),
          BottomTabBar(
            tabController: _tabController,
          )
        ],
      ),
    );
  }
}
