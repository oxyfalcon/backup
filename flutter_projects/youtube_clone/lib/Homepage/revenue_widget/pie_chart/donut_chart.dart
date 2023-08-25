import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/all_colors.dart';

class DonutChart extends StatelessWidget {
  const DonutChart({super.key});

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        child: CustomPaint(
          painter: DonutPainter(),
        ),
      );
}

class DonutPainter extends CustomPainter {
  (Map<Map<int, String>, Color>, int) sortMapByInnerMapKeys(
      Map<Map<int, String>, Color> temp) {
    int totalSum = 0;
    var sortedKeys = SplayTreeMap<Map<int, String>, Color>(
      (a, b) {
        var aInnerKey = a.keys.first;
        var bInnerKey = b.keys.first;
        return bInnerKey.compareTo(aInnerKey);
      },
    );
    for (var i in temp.entries) {
      totalSum += i.key.entries.first.key;
    }

    sortedKeys.addAll(temp);
    return (sortedKeys, totalSum);
  }

  @override
  void paint(Canvas canvas, Size size) {
    var value = sortMapByInnerMapKeys(valueToChart);
    var sortedMapValues = value.$1;
    int totalSum = value.$2;

    double length = 0.0;
    (size.width <= size.height) ? length = size.width : length = size.height;
    final c = Offset(
      size.width / 2.0,
      size.height / 2.0,
    );
    drawingArc(
        c: c,
        length: length,
        sortedMapValues: sortedMapValues,
        canvas: canvas,
        totalSum: totalSum);
    drawingLines(
        c: c,
        length: length,
        sortedMapValues: sortedMapValues,
        canvas: canvas,
        totalSum: totalSum);
    drawingMidCircle(canvas: canvas, c: c, length: length);
  }

  void drawingArc(
      {required Offset c,
      required double length,
      required Map<Map<int, String>, Color> sortedMapValues,
      required Canvas canvas,
      required int totalSum}) {
    final Rect rect = Rect.fromCenter(center: c, width: length, height: length);
    double startAngle = 3 * pi / 2;

    for (var i2 in sortedMapValues.entries) {
      final sectorPaint = Paint()
        ..color = i2.value
        ..style = PaintingStyle.fill;
      final sweepAngle = (i2.key.entries.first.key / totalSum) * 2 * pi;
      canvas.drawArc(rect, startAngle, sweepAngle, true, sectorPaint);
      startAngle += sweepAngle;
    }
  }

  void drawingMidCircle(
      {required Canvas canvas, required Offset c, required double length}) {
    final whiteCirclePaint = Paint()
      ..color = ColorMap.whiteBackground
      ..style = PaintingStyle.fill;
    canvas.drawCircle(c, length * 0.37, whiteCirclePaint);
  }

  void drawingLines(
      {required Offset c,
      required double length,
      required Map<Map<int, String>, Color> sortedMapValues,
      required Canvas canvas,
      required int totalSum}) {
    double startAngle2 = 3 * pi / 2;
    final linePaint = Paint()
      ..color = ColorMap.whiteBackground
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    for (var i in sortedMapValues.entries) {
      final sweepAngle = (i.key.keys.first / totalSum) * 2 * pi;
      final dx = length / 2 * cos(startAngle2);
      final dy = length / 2 * sin(startAngle2);
      final p2 = c + Offset(dx, dy);
      canvas.drawLine(c, p2, linePaint);
      startAngle2 += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
