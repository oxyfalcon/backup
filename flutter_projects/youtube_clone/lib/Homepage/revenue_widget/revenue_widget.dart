import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/card_elements.dart';
import 'package:youtube_clone/Homepage/revenue_widget/pie_chart/chart_and_lebel.dart';
import 'package:youtube_clone/Homepage/revenue_widget/outstanding_payment.dart';
import 'package:youtube_clone/Homepage/revenue_widget/paid_to_you.dart';
import 'package:youtube_clone/utils/all_colors.dart';

class RevenueWidget extends StatelessWidget {
  const RevenueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 0,
        color: ColorMap.whiteBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListView(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
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
                text: "LIFETIME SERVICES BREAKDOWN",
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
                    overlayColor: CustomSplashColor(),
                    backgroundColor: WhiteButtonColor(),
                    shape: CustomShape(),
                    padding: CustomPadding(),
                  ),
                  text: "View All Invoices",
                  color: Colors.black,
                ),
              )
            ]),
      ),
    );
  }
}
