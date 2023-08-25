import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/card_elements.dart';

class ClientTotalRow extends StatelessWidget {
  const ClientTotalRow({
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SecondaryTitleWithinCard(text: "CLIENT COUNT"),
                FittedBox(
                  child: Row(
                    children: [NumberDisplay(text: "200")],
                  ),
                ),
              ],
            ),
          )),
          VerticalDivider(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: SecondaryTitleWithinCard(
                        text: "AVR SESSIONS / CLIENT",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          NumberDisplay(text: "3"),
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
