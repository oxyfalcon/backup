import 'package:flutter/material.dart';

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
                Text(
                  "PENDING AMOUNT",
                  style: TextStyle(
                      fontSize: 10,
                      color: Color.fromRGBO(137, 137, 137, 1),
                      fontFamily: "Arial1",
                      fontWeight: FontWeight.w900),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$6,000",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Icon(
                          Icons.info_outline,
                          size: 18,
                          color: Color.fromRGBO(190, 190, 190, 1),
                        ),
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
                Text(
                  "UNPAID INVOICES",
                  style: TextStyle(
                      fontSize: 10,
                      color: Color.fromRGBO(137, 137, 137, 1),
                      fontFamily: "Arial1",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$8,000",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Icon(
                          Icons.info_outline,
                          size: 18,
                          color: Color.fromRGBO(190, 190, 190, 1),
                        ),
                      )
                    ],
                  ),
                ),
                FittedBox(
                  child: Text(
                    "\$3K OVERDUE",
                    style: TextStyle(
                        fontFamily: "Arial1",
                        color: Color.fromRGBO(215, 45, 43, 1),
                        fontSize: 9,
                        fontWeight: FontWeight.w800),
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
