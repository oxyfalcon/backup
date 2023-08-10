import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:youtube_clone/all_colors.dart';

Map<Map<int, String>, Color> valueToChart = {
  {30: "InterViewPrep"}: colorMap[ColorTheme.pieChartOrange]!,
  {35: "Resume Edit"}: colorMap[ColorTheme.bluePrimary]!,
  {20: "OnGoing Education..."}: colorMap[ColorTheme.pieChartPink]!,
  {15: "Other Services"}: colorMap[ColorTheme.tabBarNotSelected]!,
};

class DonutChart extends StatelessWidget {
  const DonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DonutPainter(),
      willChange: true,
      isComplex: true,
    );
  }
}

class DonutPainter extends CustomPainter {
  int totalsum = 0;
  Map<Map<int, String>, Color> sortMapByInnerMapKeys(
      Map<Map<int, String>, Color> _map) {
    var sortedKeys = SplayTreeMap<Map<int, String>, Color>(
      (a, b) {
        var aInnerKey = a.keys.first;
        var bInnerKey = b.keys.first;
        return bInnerKey.compareTo(aInnerKey);
      },
    );
    for (var i in _map.entries) {
      totalsum += i.key.entries.first.key;
    }

    sortedKeys.addAll(_map);
    return sortedKeys;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var sortedMapValues = sortMapByInnerMapKeys(valueToChart);

    double length = 0.0;
    (size.width <= size.height) ? length = size.width : length = size.height;
    final c = Offset(
      length / 2.0,
      length / 2.0,
    );
    drawingArc(c, length, sortedMapValues, canvas);
    drawingLines(sortedMapValues, length, c, canvas);
    drawingMidCircle(canvas, c, length);
  }

  void drawingArc(Offset c, double length,
      Map<Map<int, String>, Color> sortedMapValues, Canvas canvas) {
    final Rect rect = Rect.fromCenter(center: c, width: length, height: length);
    double startAngle = 3 * pi / 2;

    for (var i2 in sortedMapValues.entries) {
      final sectorPaint = Paint()
        ..color = i2.value
        ..style = PaintingStyle.fill;
      final sweepAngle = (i2.key.keys.first / totalsum) * 2 * pi;
      canvas.drawArc(rect, startAngle, sweepAngle, true, sectorPaint);
      startAngle += sweepAngle;
    }
  }

  void drawingMidCircle(Canvas canvas, Offset c, double length) {
    final whiteCirclePaint = Paint()
      ..color = colorMap[ColorTheme.whiteBackground]!
      ..style = PaintingStyle.fill;
    canvas.drawCircle(c, length * 0.37, whiteCirclePaint);
  }

  void drawingLines(Map<Map<int, String>, Color> sortedMapValues, double length,
      Offset c, Canvas canvas) {
    double startAngle2 = 3 * pi / 2;
    final linePaint = Paint()
      ..color = colorMap[ColorTheme.whiteBackground]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    for (var i in sortedMapValues.entries) {
      final sweepAngle = (i.key.keys.first / totalsum) * 2 * pi;
      final dx = length / 2 * cos(startAngle2);
      final dy = length / 2 * sin(startAngle2);
      final p2 = c + Offset(dx, dy);
      canvas.drawLine(c, p2, linePaint);
      startAngle2 += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
