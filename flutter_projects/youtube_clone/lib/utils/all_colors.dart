import 'package:flutter/material.dart';
import 'dart:collection';

Map<Map<int, String>, Color> sortMapByInnerMapKeys(
    Map<Map<int, String>, Color> temp) {
  var sortedKeys = SplayTreeMap<Map<int, String>, Color>(
    (a, b) {
      var aInnerKey = a.keys.first;
      var bInnerKey = b.keys.first;
      return bInnerKey.compareTo(aInnerKey);
    },
  );

  sortedKeys.addAll(temp);
  return sortedKeys;
}

Map<Map<int, String>, Color> _valueToChart = {
  {30: "InterViewPrep"}: ColorMap.pieChartOrange,
  {35: "Resume Edit"}: ColorMap.bluePrimary,
  {20: "OnGoing Education..."}: ColorMap.pieChartPink,
  {15: "Other Services"}: ColorMap.tabBarNotSelected,
};

Map<Map<int, String>, Color> valueToChart =
    sortMapByInnerMapKeys(_valueToChart);

abstract class ColorMap extends Color {
  static final ColorMap _obj = ColorMap._();
  factory ColorMap._() => _obj;
  static const Color listTileSecondartText = Color.fromRGBO(140, 140, 140, 1);
  static const Color cardSecondaryText = Color.fromRGBO(137, 137, 137, 1);
  static const Color greyBackGround = Color.fromRGBO(250, 250, 250, 1);
  static const Color whiteBackground = Colors.white;
  static const Color cardPrimaryText = Color.fromRGBO(50, 50, 50, 1);
  static const Color cardRed = Color.fromRGBO(215, 45, 43, 1);
  static const Color cardGreen = Color.fromRGBO(17, 210, 150, 1);
  static const Color bluePrimary = Color.fromRGBO(1, 48, 225, 1);
  static const Color blueSecondary = Color.fromRGBO(176, 186, 225, 1);
  static const Color tabBarNotSelected = Color.fromRGBO(182, 182, 182, 1);
  static const Color globalMainText = Color.fromRGBO(33, 33, 33, 1);
  static const Color listTileShadow = Color.fromRGBO(217, 222, 247, 1);
  static const Color pieChartOrange = Color.fromRGBO(255, 190, 0, 1);
  static const Color pieChartPink = Color.fromRGBO(253, 132, 131, 1);
  static const Color filledButtonBorderColor = Color.fromRGBO(240, 240, 240, 1);
  static const Color iconSecondaryColor = Color.fromRGBO(190, 190, 190, 1);
  static const Color clientName = Color.fromRGBO(102, 102, 102, 1);
  static const Color clientSession = Color.fromRGBO(75, 75, 75, 1);
  static const Color customOverlayColor = Color.fromARGB(255, 241, 241, 246);
}

List<Map<String, dynamic>> clientList = [
  {
    "Name": "Alan Cooper",
    "Image_url": 'images/picture1.jpg',
    "Sessions": 30,
  },
  {
    "Name": "Andri Sator",
    "Image_url": "images/picture2.jpg",
    "Sessions": 29,
  },
  {
    "Name": "Makers",
    "Image_url": 'images/picture3.jpg',
    "Sessions": 28,
  },
  {
    "Name": "Maker",
    "Image_url": 'images/picture4.jpg',
    "Sessions": 27,
  },
  {
    "Name": "Andrew Carlos",
    "Image_url": 'images/picture5.jpg',
    "Sessions": 26,
  }
];
