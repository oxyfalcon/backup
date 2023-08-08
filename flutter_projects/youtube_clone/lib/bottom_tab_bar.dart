import 'package:flutter/material.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => BottomOptionsState();
}

class BottomOptionsState extends State<BottomTabBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntrinsicHeight(
        child: Column(
          children: [
            const Divider(),
            DefaultTabController(
              length: 5,
              initialIndex: 0,
              animationDuration: const Duration(milliseconds: 200),
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: TabBar(
                  dividerHeight: 0,
                  dividerColor: null,
                  indicator: const UnderlineTabIndicator(
                    insets: EdgeInsets.only(bottom: 53),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(1, 48, 225, 1), width: 5),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  indicatorColor: const Color.fromRGBO(1, 48, 225, 1),
                  labelColor: const Color.fromRGBO(1, 48, 225, 1),
                  unselectedLabelColor: const Color.fromRGBO(182, 182, 182, 1),
                  tabAlignment: TabAlignment.fill,
                  onTap: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  tabs: [
                    Container(
                      decoration: (currentIndex == 0)
                          ? BoxDecoration(
                              color: const Color.fromRGBO(229, 234, 255, 1),
                              borderRadius: BorderRadius.circular(10))
                          : null,
                      child: const SizedBox(
                          child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.home_rounded,
                          size: 30,
                        ),
                      )),
                    ),
                    Container(
                      decoration: (currentIndex == 1)
                          ? BoxDecoration(
                              color: const Color.fromRGBO(229, 234, 255, 1),
                              borderRadius: BorderRadius.circular(10))
                          : null,
                      child: const SizedBox(
                          child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(1, 48, 225, 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: const SizedBox(
                          child: Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Icon(
                          Icons.videocam_rounded,
                          size: 28,
                          color: Colors.white,
                        ),
                      )),
                    ),
                    Container(
                      decoration: (currentIndex == 3)
                          ? BoxDecoration(
                              color: const Color.fromRGBO(229, 234, 255, 1),
                              borderRadius: BorderRadius.circular(10))
                          : null,
                      child: const SizedBox(
                          child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.calendar_month_outlined,
                          size: 30,
                        ),
                      )),
                    ),
                    Container(
                      decoration: (currentIndex == 4)
                          ? BoxDecoration(
                              color: const Color.fromRGBO(229, 234, 255, 1),
                              borderRadius: BorderRadius.circular(10))
                          : null,
                      child: const SizedBox(
                          child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.menu,
                          size: 30,
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
