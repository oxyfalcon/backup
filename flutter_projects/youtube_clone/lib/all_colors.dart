import 'package:flutter/material.dart';

enum ColorTheme {
  greyBackGround,
  whiteBackground,
  cardPrimaryText,
  cardSecondaryText,
  cardGreen,
  cardRed,
  bluePrimary,
  blueSecondary,
  tabBarNotSelected,
  globalMainText,
  listTileShadow,
  pieChartOrange,
  pieChartPink,
}

const Map<ColorTheme, Color> colorMap = <ColorTheme, Color>{
  ColorTheme.greyBackGround: Color.fromRGBO(250, 250, 250, 1),
  ColorTheme.whiteBackground: Color.fromRGBO(255, 255, 255, 1),
  ColorTheme.cardPrimaryText: Color.fromRGBO(50, 50, 50, 1),
  ColorTheme.cardSecondaryText: Color.fromRGBO(137, 137, 137, 1),
  ColorTheme.cardRed: Color.fromRGBO(215, 45, 43, 1),
  ColorTheme.cardGreen: Color.fromRGBO(17, 210, 150, 1),
  ColorTheme.bluePrimary: Color.fromRGBO(1, 48, 225, 1),
  ColorTheme.blueSecondary: Color.fromRGBO(229, 234, 255, 1),
  ColorTheme.tabBarNotSelected: Color.fromRGBO(182, 182, 182, 1),
  ColorTheme.globalMainText: Color.fromRGBO(33, 33, 33, 1),
  ColorTheme.listTileShadow: Color.fromRGBO(217, 222, 247, 1),
  ColorTheme.pieChartOrange: Color.fromRGBO(255, 190, 0, 1),
  ColorTheme.pieChartPink: Color.fromRGBO(253, 132, 131, 1)
};
