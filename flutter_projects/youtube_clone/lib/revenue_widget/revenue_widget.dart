import 'package:flutter/material.dart';
import 'package:youtube_clone/all_colors.dart';
import 'package:youtube_clone/revenue_widget/pie_chart/chart_and_lebel.dart';
import 'package:youtube_clone/revenue_widget/outstanding_payment.dart';
import 'package:youtube_clone/revenue_widget/paid_to_you.dart';

class RevenueWidget extends StatelessWidget {
  const RevenueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                "PAID TO YOU",
                style: TextStyle(
                    fontSize: 9,
                    fontFamily: "Arial1",
                    color: Color.fromRGBO(50, 50, 50, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const PaidToYou(),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 25.0, left: 8.0, bottom: 10),
              child: Text(
                "OUTSTANDING PAYMENT",
                style: TextStyle(
                    fontSize: 9,
                    fontFamily: "Arial1",
                    color: Color.fromRGBO(50, 50, 50, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const OutstandingPayment(),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 25.0, left: 8.0),
              child: Text(
                "LIFETIME SERVICES BREAKDOWN",
                style: TextStyle(
                    fontSize: 9,
                    fontFamily: "Arial1",
                    color: Color.fromRGBO(50, 50, 50, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const ChartAndLebel(),
            const Divider(
              thickness: 0.3,
            ),
            FilledButton(
              statesController: MaterialStatesController(),
              style: ButtonStyle(
                shape: CustomShape(),
              ),
              onPressed: () {},
              child: const Text("Create Invoice"),
            ),
            FilledButton(
                style: ButtonStyle(
                    backgroundColor: WhiteButtonColor(), shape: CustomShape2()),
                onPressed: () {},
                child: const Text(
                  "View all invoices",
                  style: TextStyle(color: Colors.black),
                ))
          ]),
        ),
      ),
    );
  }
}

class CustomShape extends RoundedRectangleBorder
    implements MaterialStateOutlinedBorder {
  @override
  OutlinedBorder? resolve(Set<MaterialState> states) {
    return const RoundedRectangleBorder(
        side: BorderSide(color: Color.fromRGBO(240, 240, 240, 1)),
        borderRadius: BorderRadius.all(Radius.circular(8)));
  }
}

class CustomShape2 extends RoundedRectangleBorder
    implements MaterialStateOutlinedBorder {
  @override
  OutlinedBorder? resolve(Set<MaterialState> states) {
    return const RoundedRectangleBorder(
        side: BorderSide(color: Color.fromRGBO(240, 240, 240, 1)),
        borderRadius: BorderRadius.all(Radius.circular(8)));
  }
}

class WhiteButtonColor extends MaterialStateProperty<Color> {
  @override
  Color resolve(Set<MaterialState> states) {
    return colorMap[ColorTheme.whiteBackground]!;
  }
}
