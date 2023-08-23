import 'package:flutter/material.dart';
import 'package:youtube_clone/all_colors.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key, required TabController tabController})
      : _tabController = tabController;
  final TabController _tabController;

  @override
  State<BottomTabBar> createState() => BottomOptionsState();
}

class BottomOptionsState extends State<BottomTabBar> {
  int currentIndex = 0;
  bool onTapFlag = false;

  void changeFlag() {
    setState(() {
      onTapFlag = false;
    });
  }

  void _currentIndexFun() => setState(() {
        currentIndex = widget._tabController.index;
      });

  @override
  void initState() {
    widget._tabController.addListener(_currentIndexFun);
    widget._tabController.animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) onTapFlag = false;
    });
    super.initState();
  }

  @override
  void dispose() {
    widget._tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: TabBar(
              onTap: (value) {
                onTapFlag = true;
              },
              controller: widget._tabController,
              dividerColor: Colors.transparent,
              indicator: const UnderlineTabIndicator(
                insets: EdgeInsets.only(bottom: 53),
                borderSide: BorderSide(color: ColorMap.bluePrimary, width: 5),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              labelColor: ColorMap.bluePrimary,
              unselectedLabelColor: ColorMap.tabBarNotSelected,
              tabs: [
                AnimatedBuilder(
                    animation: widget._tabController.animation!,
                    builder: (context, child) {
                      int index = 0;
                      double offset = widget._tabController.offset;
                      Color? color;
                      if (offset > 0) {
                        if (index <= currentIndex + 1 &&
                            index >= currentIndex) {
                          color = (currentIndex == index)
                              ? Color.lerp(ColorMap.blueSecondary,
                                  ColorMap.whiteBackground, offset)
                              : Color.lerp(ColorMap.whiteBackground,
                                  ColorMap.blueSecondary, offset);
                        }
                      } else {
                        if (index <= currentIndex &&
                            index >= currentIndex - 1) {
                          color = (currentIndex == index)
                              ? Color.lerp(ColorMap.blueSecondary,
                                  ColorMap.whiteBackground, -offset)
                              : Color.lerp(ColorMap.whiteBackground,
                                  ColorMap.blueSecondary, -offset);
                        }
                      }
                      return Container(
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10)),
                        child: const SizedBox(
                            child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.home_rounded,
                            size: 30,
                          ),
                        )),
                      );
                    }),
                AnimatedBuilder(
                    animation: widget._tabController.animation!,
                    builder: (context, child) {
                      int index = 1;
                      double offset = (onTapFlag == true)
                          ? -widget._tabController.offset
                          : widget._tabController.offset;
                      Color? color;
                      if (offset > 0) {
                        if (index <= currentIndex + 1 &&
                            index >= currentIndex) {
                          if (currentIndex == index) {
                            color = Color.lerp(ColorMap.blueSecondary,
                                ColorMap.whiteBackground, offset);
                          } else if (onTapFlag == false) {
                            color = Color.lerp(ColorMap.whiteBackground,
                                ColorMap.blueSecondary, offset);
                          }
                        } else if (widget._tabController.previousIndex ==
                                index &&
                            onTapFlag == true) {
                          color = Color.lerp(ColorMap.whiteBackground,
                              ColorMap.blueSecondary, offset / 3);
                        }
                      } else {
                        if (index <= currentIndex &&
                            index >= currentIndex - 1) {
                          if (currentIndex == index) {
                            print("hello 2");
                            // print(
                            //     "profile prev: ${widget._tabController.previousIndex}, currentIndex = $currentIndex, $onTapFlag");
                            color = Color.lerp(ColorMap.blueSecondary,
                                ColorMap.whiteBackground, -offset);
                          } else if (onTapFlag == false) {
                            color = Color.lerp(ColorMap.whiteBackground,
                                ColorMap.blueSecondary, -offset);
                          }
                        } else if (widget._tabController.previousIndex ==
                                index &&
                            onTapFlag == true) {
                          print("Hello");
                          color = Color.lerp(ColorMap.whiteBackground,
                              ColorMap.blueSecondary, -offset);
                        }
                      }

                      return Container(
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                      );
                    }),
                Container(
                  decoration: BoxDecoration(
                      color: ColorMap.bluePrimary,
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
                AnimatedBuilder(
                    animation: widget._tabController.animation!,
                    builder: (context, child) {
                      int index = 3;
                      double offset = widget._tabController.offset;
                      Color? color;
                      if (offset > 0) {
                        if (index <= currentIndex + 1 &&
                            index >= currentIndex) {
                          if (currentIndex == index) {
                            color = Color.lerp(ColorMap.blueSecondary,
                                ColorMap.whiteBackground, offset);
                          } else if (onTapFlag == false) {
                            color = Color.lerp(ColorMap.whiteBackground,
                                ColorMap.blueSecondary, offset);
                          }
                        } else if (widget._tabController.previousIndex ==
                                index &&
                            onTapFlag == true) {
                          color = Color.lerp(ColorMap.whiteBackground,
                              ColorMap.blueSecondary, offset / 3);
                        }
                      } else {
                        if (index <= currentIndex &&
                            index >= currentIndex - 1) {
                          if (currentIndex == index) {
                            color = Color.lerp(ColorMap.blueSecondary,
                                ColorMap.whiteBackground, -offset);
                          } else if (onTapFlag == false) {
                            color = Color.lerp(ColorMap.whiteBackground,
                                ColorMap.blueSecondary, -offset);
                          }
                        } else if (widget._tabController.previousIndex ==
                                index &&
                            onTapFlag == true) {
                          color = Color.lerp(ColorMap.whiteBackground,
                              ColorMap.blueSecondary, offset / 3);
                        }
                      }
                      return Container(
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10)),
                        child: const SizedBox(
                            child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.calendar_month_outlined,
                            size: 30,
                          ),
                        )),
                      );
                    }),
                AnimatedBuilder(
                    animation: widget._tabController.animation!,
                    builder: (context, child) {
                      int index = 4;
                      double offset = widget._tabController.offset;
                      Color? color;
                      if (offset > 0) {
                        if (index <= currentIndex + 1 &&
                            index >= currentIndex) {
                          color = (currentIndex == index)
                              ? Color.lerp(ColorMap.blueSecondary,
                                  ColorMap.whiteBackground, offset)
                              : Color.lerp(ColorMap.whiteBackground,
                                  ColorMap.blueSecondary, offset);
                        } else if (widget._tabController.previousIndex ==
                                index &&
                            onTapFlag == true) {
                          color = Color.lerp(ColorMap.whiteBackground,
                              ColorMap.blueSecondary, offset / 3);
                        }
                      } else {
                        if (index <= currentIndex &&
                            index >= currentIndex - 1) {
                          color = (currentIndex == index)
                              ? Color.lerp(ColorMap.blueSecondary,
                                  ColorMap.whiteBackground, -offset)
                              : Color.lerp(ColorMap.whiteBackground,
                                  ColorMap.blueSecondary, -offset);
                        } else if (widget._tabController.previousIndex ==
                                index &&
                            onTapFlag == true) {
                          color = Color.lerp(ColorMap.whiteBackground,
                              ColorMap.blueSecondary, offset / 3);
                        }
                      }
                      return Container(
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10)),
                        child: const SizedBox(
                            child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.menu,
                            size: 30,
                          ),
                        )),
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
