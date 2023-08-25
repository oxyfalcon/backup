import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/card_elements.dart';
import 'package:youtube_clone/utils/all_colors.dart';

class CardTitle extends StatelessWidget with CustomTextStyle {
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
    return Text(text,
        style: super.textCustomStyle(
            defaultColor: ColorMap.globalMainText,
            inputFontFamily: fontfamily,
            inputColor: color,
            defaultFontFamily: "Arial1",
            defaultFontSize: 20,
            inputFontSize: fontSize,
            defaultFontWeight: FontWeight.w500,
            inputFontWeight: fontWeight));
  }
}
