import 'package:flutter/material.dart';
import 'package:youtube_clone/all_colors.dart';
import 'package:youtube_clone/donut_chart.dart';

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
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "THIS MONTH",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(137, 137, 137, 1),
                                    fontFamily: "Arial1",
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "\$15,000",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
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
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Padding(
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
                          Text(
                            "\$72,000",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: const Padding(
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
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Padding(
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
                  ),
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 25.0, left: 8.0, bottom: 10),
              child: Text(
                "LIFETIME SERVICES BREAKDOWN",
                style: TextStyle(
                    fontSize: 9,
                    fontFamily: "Arial1",
                    color: Color.fromRGBO(50, 50, 50, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            LayoutBuilder(builder: (context, boxConstraints) {
              return Container(
                  constraints: BoxConstraints.tight(
                      Size.fromHeight(boxConstraints.maxWidth)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          flex: 3,
                          child: FractionallySizedBox(
                              widthFactor: 0.9,
                              heightFactor: 0.4,
                              alignment: Alignment.center,
                              child: DonutChart())),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (var i in valueToChart.entries)
                              Container(
                                constraints: BoxConstraints.loose(
                                    Size.fromHeight(
                                        boxConstraints.maxWidth / 4)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "\u2022",
                                          style: TextStyle(
                                              color: i.value,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "  ${i.key.entries.first.key}%",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(
                                          child: ListTile(
                                            trailing:
                                                (i.key.entries.first.key == 15)
                                                    ? Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        size: 15,
                                                      )
                                                    : null,
                                            visualDensity: VisualDensity
                                                .adaptivePlatformDensity,
                                            title: Text(
                                              i.key.entries.first.value,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "Arial1",
                                                  fontWeight: FontWeight.w600,
                                                  color: colorMap[ColorTheme
                                                      .cardSecondaryText]),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.2,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ));
            }),
            FilledButton(
              style: ButtonStyle(
                shape: CustomShape(),
              ),
              onPressed: () {},
              child: Text("Create Invoice"),
            ),
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
        borderRadius: BorderRadius.all(Radius.circular(8)));
  }
}
