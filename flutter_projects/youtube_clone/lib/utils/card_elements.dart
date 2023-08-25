import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/all_colors.dart';

class CustomFilledButton extends StatelessWidget with CustomTextStyle {
  const CustomFilledButton({
    super.key,
    this.color,
    this.fontfamily,
    this.fontSize,
    this.fontWeight,
    this.onPressed,
    required ButtonStyle buttonStyle,
    required this.text,
  }) : _buttonStyle = buttonStyle;

  final ButtonStyle _buttonStyle;
  final String text;
  final String? fontfamily;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: _buttonStyle,
        onPressed: (onPressed == null) ? () {} : onPressed,
        child: Text(text,
            style: super.textCustomStyle(
                defaultFontSize: 15,
                inputFontSize: fontSize,
                inputColor: color,
                defaultFontFamily: "Arial1",
                inputFontFamily: fontfamily,
                defaultFontWeight: FontWeight.w500,
                inputFontWeight: fontWeight)));
  }
}

class NumberDisplay extends StatelessWidget with CustomTextStyle {
  const NumberDisplay({
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
            inputColor: color,
            inputFontFamily: fontfamily,
            inputFontSize: fontSize,
            inputFontWeight: fontWeight,
            defaultFontSize: 25,
            defaultFontWeight: FontWeight.w800));
  }
}

class PrimaryTitleWithinCard extends StatelessWidget with CustomTextStyle {
  const PrimaryTitleWithinCard({
    super.key,
    EdgeInsets edgeInsets =
        const EdgeInsets.only(top: 25.0, left: 8.0, bottom: 10),
    required this.text,
    this.color,
    this.fontfamily,
    this.fontSize,
    this.fontWeight,
  }) : _edgeInsets = edgeInsets;

  final EdgeInsets _edgeInsets;
  final String text;
  final String? fontfamily;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: _edgeInsets,
        child: Text(text,
            style: super.textCustomStyle(
                defaultColor: ColorMap.cardPrimaryText,
                inputFontFamily: fontfamily,
                inputColor: color,
                defaultFontFamily: "Arial1",
                defaultFontSize: 9,
                inputFontSize: fontSize,
                defaultFontWeight: FontWeight.bold,
                inputFontWeight: fontWeight)));
  }
}

class SecondaryTitleWithinCard extends StatelessWidget with CustomTextStyle {
  const SecondaryTitleWithinCard({
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
            defaultColor: ColorMap.cardSecondaryText,
            inputFontFamily: fontfamily,
            inputColor: color,
            defaultFontFamily: "Arial1",
            defaultFontSize: 10,
            inputFontSize: fontSize,
            defaultFontWeight: FontWeight.w900,
            inputFontWeight: fontWeight));
  }
}

mixin CustomTextStyle {
  TextStyle textCustomStyle(
      {String? defaultFontFamily,
      String? inputFontFamily,
      double? defaultFontSize,
      double? inputFontSize,
      FontWeight? defaultFontWeight,
      FontWeight? inputFontWeight,
      Color? inputColor,
      Color? defaultColor}) {
    return TextStyle(
      color: (inputColor == null) ? defaultColor : inputColor,
      fontFamily:
          (inputFontFamily == null) ? defaultFontFamily : inputFontFamily,
      fontSize: (inputFontSize == null) ? defaultFontSize : inputFontSize,
      fontWeight:
          (inputFontWeight == null) ? defaultFontWeight : inputFontWeight,
    );
  }
}

class CustomShape extends RoundedRectangleBorder
    implements MaterialStateOutlinedBorder {
  @override
  OutlinedBorder? resolve(Set<MaterialState> states) =>
      const RoundedRectangleBorder(
          side: BorderSide(color: ColorMap.filledButtonBorderColor),
          borderRadius: BorderRadius.all(Radius.circular(10)));
}

class WhiteButtonColor extends MaterialStateProperty<Color> {
  @override
  Color resolve(Set<MaterialState> states) => ColorMap.whiteBackground;
}

class CustomPadding extends MaterialStateProperty<EdgeInsetsGeometry> {
  @override
  EdgeInsetsGeometry resolve(Set<MaterialState> states) =>
      const EdgeInsets.all(12);
}

class CustomSplashColor extends MaterialStateProperty<Color> {
  @override
  Color resolve(Set<MaterialState> states) => ColorMap.customOverlayColor;
}
