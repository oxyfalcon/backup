import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/all_colors.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key, required TabController tabController})
      : _tabController = tabController;
  final TabController _tabController;

  @override
  State<BottomTabBar> createState() => BottomOptionsState();
}

class BottomOptionsState extends State<BottomTabBar> {
  int currentIndex = 0;
  int previousIndex = 0;
  bool onTapFlag = false;

  void changeFlag() {
    setState(() {
      onTapFlag = false;
    });
  }

  @override
  void initState() {
    widget._tabController.addListener(() {
      setState(() {
        currentIndex = widget._tabController.index;
        previousIndex = widget._tabController.previousIndex;
      });
    });
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
                setState(() {
                  onTapFlag = true;
                });
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
              overlayColor: CustomOverlay(),
              tabs: [
                CustomTabs(
                    index: 0,
                    icon: const Icon(
                      Icons.home_rounded,
                      size: 30,
                    ),
                    controller: widget._tabController,
                    currentIndex: currentIndex,
                    onTapFlag: onTapFlag,
                    previousIndex: previousIndex),
                CustomTabs(
                    index: 1,
                    controller: widget._tabController,
                    currentIndex: currentIndex,
                    onTapFlag: onTapFlag,
                    previousIndex: previousIndex,
                    icon: const Icon(
                      Icons.person,
                      size: 30,
                    )),
                CustomTabs(
                    index: 2,
                    controller: widget._tabController,
                    padding: 7.0,
                    radius: 15,
                    immutableColor: ColorMap.bluePrimary,
                    currentIndex: currentIndex,
                    onTapFlag: onTapFlag,
                    previousIndex: previousIndex,
                    icon: const Icon(
                      Icons.videocam_rounded,
                      size: 28,
                      color: ColorMap.whiteBackground,
                    )),
                CustomTabs(
                    index: 3,
                    controller: widget._tabController,
                    currentIndex: currentIndex,
                    onTapFlag: onTapFlag,
                    previousIndex: previousIndex,
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                      size: 30,
                    )),
                CustomTabs(
                    index: 4,
                    controller: widget._tabController,
                    currentIndex: currentIndex,
                    onTapFlag: onTapFlag,
                    previousIndex: previousIndex,
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabs extends StatelessWidget {
  const CustomTabs(
      {super.key,
      required this.index,
      required TabController controller,
      required this.currentIndex,
      required this.onTapFlag,
      required this.previousIndex,
      this.immutableColor,
      required this.icon,
      this.radius,
      this.padding})
      : _tabController = controller;
  final TabController _tabController;
  final int previousIndex;
  final int currentIndex;
  final Color? immutableColor;
  final bool onTapFlag;
  final double? radius;
  final double? padding;
  final int index;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _tabController.animation!,
        builder: (context, child) {
          double offset = _tabController.offset;
          int different = currentIndex - previousIndex;
          double colorOffset = offset / different.abs();
          Color? color = _colorFinder(offset, index, colorOffset);
          return Container(
            decoration: BoxDecoration(
                color: (immutableColor == null) ? color : immutableColor,
                borderRadius:
                    BorderRadius.circular((radius == null) ? 10 : radius!)),
            child: SizedBox(
                child: Padding(
              padding: EdgeInsets.all((padding == null) ? 4.0 : padding!),
              child: icon,
            )),
          );
        });
  }

  Color? _colorFinder(double offset, int index, double colorOffset) {
    Color? localColor;
    if (offset > 0) {
      if (index <= currentIndex + 1 && index >= currentIndex) {
        if (currentIndex == index) {
          localColor = Color.lerp(
              ColorMap.blueSecondary, ColorMap.whiteBackground, offset);
        } else if (onTapFlag == false) {
          localColor = Color.lerp(
              ColorMap.whiteBackground, ColorMap.blueSecondary, offset);
        } else if (previousIndex == index && onTapFlag == true) {
          localColor = Color.lerp(
              ColorMap.whiteBackground, ColorMap.blueSecondary, colorOffset);
        }
      } else if (previousIndex == index && onTapFlag == true) {
        localColor = Color.lerp(
            ColorMap.whiteBackground, ColorMap.blueSecondary, colorOffset);
      }
    } else {
      if (index <= currentIndex && index >= currentIndex - 1) {
        if (currentIndex == index) {
          localColor = Color.lerp(
              ColorMap.blueSecondary, ColorMap.whiteBackground, -offset);
        } else if (onTapFlag == false) {
          localColor = Color.lerp(
              ColorMap.whiteBackground, ColorMap.blueSecondary, -offset);
        } else if (previousIndex == index && onTapFlag == true) {
          localColor = Color.lerp(
              ColorMap.whiteBackground, ColorMap.blueSecondary, -colorOffset);
        }
      } else if (previousIndex == index && onTapFlag == true) {
        localColor = Color.lerp(
            ColorMap.whiteBackground, ColorMap.blueSecondary, -colorOffset);
      }
    }
    return localColor;
  }
}

class CustomOverlay extends MaterialStateProperty<Color> {
  @override
  Color resolve(Set<MaterialState> states) => ColorMap.customOverlayColor;
}
