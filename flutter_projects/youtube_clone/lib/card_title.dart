import 'package:flutter/material.dart';
import 'package:youtube_clone/Homepage/revenue_widget/card_elements.dart';
import 'package:youtube_clone/all_colors.dart';

class CardTitle extends StatelessWidget with CustomText {
  const CardTitle({
    super.key,
    required this.text,
    this.color,
    this.fontfamily,
    this.fontSize,
    this.fontWeight,
  });
  final String text;
  final String? fontfamily;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: super.textCustom(
            text: text,
            defaultColor: ColorMap.globalMainText,
            inputColor: color,
            inputFontFamily: fontfamily,
            defaultFontFamily: "Arial1",
            defaultFontSize: 20,
            inputFontSize: fontSize,
            inputFontWeight: fontWeight,
            defaultFontWeight: FontWeight.w500));
  }
}
