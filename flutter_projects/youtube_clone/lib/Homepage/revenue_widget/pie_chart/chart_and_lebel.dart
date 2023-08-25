import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/all_colors.dart';
import 'package:youtube_clone/Homepage/revenue_widget/pie_chart/donut_chart.dart';

class ChartAndLebel extends StatelessWidget {
  const ChartAndLebel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                constraints: BoxConstraints.loose(const Size.fromHeight(150)),
                child: const FractionallySizedBox(
                  widthFactor: 0.8,
                  heightFactor: 0.8,
                  child: DonutChart(),
                ),
              )),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                for (var i in valueToChart.entries)
                  Column(
                    children: [
                      Row(
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
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      i.key.entries.first.value,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Arial1",
                                          fontWeight: FontWeight.w600,
                                          color: ColorMap.cardSecondaryText),
                                    ),
                                  ),
                                ),
                                if (i.key.entries.first.key == 15)
                                  Flexible(
                                    flex: 1,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.arrow_forward_ios,
                                              size: 14)),
                                    ),
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                      if (i.key.entries.first.key != 15)
                        const Padding(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: CustomDottedLine(
                              lineThickness: 0.5,
                              dashLength: 2,
                              dashGapLength: 2,
                              color: ColorMap.listTileShadow),
                        )
                    ],
                  ),
              ],
            ),
          )
        ],
      );
    });
  }
}

class CustomDottedLine extends StatelessWidget {
  const CustomDottedLine({
    super.key,
    required this.color,
    this.lineThickness = 1,
    this.dashLength = 1,
    this.dashGapLength = 1,
  });

  final Color color;
  final double dashLength;
  final double dashGapLength;
  final double lineThickness;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: lineThickness,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final lineLength = constraints.maxWidth;
          final dashAndDashGapCount = _calculateDashAndDashGapCount(lineLength);
          final dashCount = dashAndDashGapCount.$1;
          final dashGapCount = dashAndDashGapCount.$2;
          return Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            children: List.generate(dashCount + dashGapCount, (index) {
              if (index % 2 == 0) {
                return Container(
                  height: lineThickness,
                  width: dashLength.toDouble(),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0), color: color),
                );
              } else {
                return Container(
                  height: lineThickness,
                  width: dashLength.toDouble(),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.white),
                );
              }
            }).toList(),
          );
        },
      ),
    );
  }

  (int, int) _calculateDashAndDashGapCount(double lineLength) {
    var dashAndDashGapLength = dashLength + dashGapLength;
    var dashCount = lineLength ~/ dashAndDashGapLength;
    var dashGapCount = lineLength ~/ dashAndDashGapLength;
    if (dashLength <= lineLength % dashAndDashGapLength) {
      dashCount += 1;
    }
    return (dashCount, dashGapCount);
  }
}
