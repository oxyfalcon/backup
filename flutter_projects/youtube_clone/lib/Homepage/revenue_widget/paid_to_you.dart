import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/card_elements.dart';
import 'package:youtube_clone/utils/all_colors.dart';

class PaidToYou extends StatelessWidget {
  const PaidToYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SecondaryTitleWithinCard(text: "THIS MONTH"),
                FittedBox(
                  child: Row(
                    children: [NumberDisplay(text: "\$15,000")],
                  ),
                ),
                FittedBox(
                  child: SecondaryTitleWithinCard(
                    text: "\$13K LAST MONTH",
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    color: ColorMap.cardGreen,
                  ),
                )
              ],
            ),
          )),
          VerticalDivider(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(children: [
                SecondaryTitleWithinCard(
                  text: "THIS YEAR",
                  fontWeight: FontWeight.bold,
                ),
                FittedBox(
                  child: Row(
                    children: [
                      NumberDisplay(text: "\$72,000"),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
