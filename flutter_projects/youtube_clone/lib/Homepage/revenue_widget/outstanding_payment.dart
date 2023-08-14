import 'package:flutter/material.dart';
import 'package:youtube_clone/Homepage/revenue_widget/revenue_card_elements.dart';
import 'package:youtube_clone/all_colors.dart';

class OutstandingPayment extends StatelessWidget {
  const OutstandingPayment({
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
                SecondaryTitleWithinCard(text: "PENDING AMOUNT"),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumberDisplay(text: "\$6,000"),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: InfoIcon(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
          VerticalDivider(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(children: [
                SecondaryTitleWithinCard(
                  text: "UNPAID INVOICES",
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumberDisplay(text: "\$8,000"),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: InfoIcon(),
                      )
                    ],
                  ),
                ),
                FittedBox(
                  child: SecondaryTitleWithinCard(
                      text: "\$3K OVERDUE", color: ColorMap.cardRed),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoIcon extends StatelessWidget {
  const InfoIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.info_outline,
      size: 18,
      color: ColorMap.iconSecondaryColor,
    );
  }
}
