import 'package:flutter/material.dart';
import 'package:youtube_clone/Homepage/revenue_widget/card_elements.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SecondaryTitleWithinCard(text: "PENDING AMOUNT"),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumberDisplay(text: "\$6,000"),
                      SizedBox.square(dimension: 31, child: InfoIcon()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          VerticalDivider(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SecondaryTitleWithinCard(
                      text: "UNPAID INVOICES",
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NumberDisplay(
                            text: "\$8,000",
                          ),
                          SizedBox.square(dimension: 31, child: InfoIcon()),
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
    return IconButton(
      iconSize: 18,
      color: ColorMap.iconSecondaryColor,
      onPressed: () {},
      icon: const Icon(
        Icons.info_outline,
      ),
    );
  }
}

class CustomIconButtonSize extends MaterialStateProperty<Size> {
  CustomIconButtonSize({required this.size}) : super();
  final double size;

  @override
  Size resolve(Set<MaterialState> states) {
    return Size.square(size + 2);
  }
}
