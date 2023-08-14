import 'package:flutter/material.dart';
import 'package:youtube_clone/Homepage/revenue_widget/revenue_card_elements.dart';
import 'package:youtube_clone/Homepage/revenue_widget/pie_chart/chart_and_lebel.dart';
import 'package:youtube_clone/Homepage/revenue_widget/outstanding_payment.dart';
import 'package:youtube_clone/Homepage/revenue_widget/paid_to_you.dart';
import 'package:youtube_clone/all_colors.dart';

class RevenueWidget extends StatelessWidget {
  const RevenueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        color: ColorMap.whiteBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const PrimaryTitleWithinCard(
              text: "PAID TO YOU",
              edgeInsets: EdgeInsets.only(left: 8.0, top: 8.0),
            ),
            const PaidToYou(),
            const Divider(),
            const PrimaryTitleWithinCard(
              text: "OUTSTANDING PAYMENTS",
            ),
            const OutstandingPayment(),
            const Divider(),
            const PrimaryTitleWithinCard(
              text: "LIFETIME SERVICES PAYMENT",
            ),
            const ChartAndLebel(),
            const Divider(
              thickness: 0.3,
            ),
            CustomFilledButton(
              buttonStyle:
                  ButtonStyle(shape: CustomShape(), padding: CustomPadding()),
              text: "Create Invoices",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CustomFilledButton(
                buttonStyle: ButtonStyle(
                    backgroundColor: WhiteButtonColor(),
                    shape: CustomShape2(),
                    padding: CustomPadding()),
                text: "View All Invoices",
                color: Colors.black,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
