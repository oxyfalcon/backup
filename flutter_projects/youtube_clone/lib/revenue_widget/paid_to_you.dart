import 'package:flutter/material.dart';

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
                Text(
                  "THIS MONTH",
                  style: TextStyle(
                      fontSize: 10,
                      color: Color.fromRGBO(137, 137, 137, 1),
                      fontFamily: "Arial1",
                      fontWeight: FontWeight.w900),
                ),
                FittedBox(
                  child: Row(
                    children: [
                      Text(
                        "\$15,000",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  child: Text(
                    "\$13K LAST MONTH",
                    style: TextStyle(
                        color: Color.fromRGBO(17, 210, 150, 1),
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Arial1',
                        fontSize: 9),
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
                Text(
                  "THIS YEAR",
                  style: TextStyle(
                      fontSize: 10,
                      color: Color.fromRGBO(137, 137, 137, 1),
                      fontFamily: "Arial1",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
                FittedBox(
                  child: Row(
                    children: [
                      FittedBox(
                        child: Text(
                          "\$72,000",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
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
