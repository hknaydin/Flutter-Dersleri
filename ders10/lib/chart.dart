import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(HomePagePatient());
}

class HomePagePatient extends StatefulWidget {
  @override
  State<HomePagePatient> createState() => _HomePagePatientState();
}

class _HomePagePatientState extends State<HomePagePatient> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(width: 450, height: 300, child: LineChartDemo1()),
              SizedBox(width: 450, height: 300, child: LineChartDemo2()),
            ],
          ),
        ),
      ),
    );
  }
}

class LineChartDemo1 extends StatelessWidget {
  const LineChartDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          maxX: 10,
          minY: 0,
          maxY: 10,
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(
              // axisNameWidget: CustomWidget(),
              sideTitles: SideTitles(
                  reservedSize: 110,
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: leftTiles),
            ),
            bottomTitles: AxisTitles(
              axisNameSize: 25,
              // axisNameWidget: CustomWidget(),
              sideTitles: SideTitles(
                  reservedSize: 50,
                  showTitles: true,
                  getTitlesWidget: bottomTiles),
            ),
            /*leftTitles: SideTitles(showTitles: true),
        bottomTitles: SideTitles(showTitles: true),*/
          ),
          gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.green, strokeWidth: 1);
              },
              getDrawingVerticalLine: (value) {
                return FlLine(color: Colors.black, strokeWidth: 1);
              }),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(1, getRandomValue()),
                FlSpot(2, getRandomValue()),
                FlSpot(3, getRandomValue()),
                FlSpot(4, getRandomValue()),
                FlSpot(5, getRandomValue()),
                FlSpot(6, getRandomValue()),
                FlSpot(7, getRandomValue()),
                FlSpot(8, getRandomValue()),
                FlSpot(9, getRandomValue()),
                FlSpot(10, getRandomValue()),
                FlSpot(11, getRandomValue()),
                FlSpot(12, getRandomValue()),
                FlSpot(13, getRandomValue()),
                FlSpot(14, getRandomValue()),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 5,
              belowBarData:
                  BarAreaData(show: true, color: Colors.blue.withOpacity(0.5)),
            )
          ],
        ),
      );
}

class LineChartDemo2 extends StatelessWidget {
  final List<Color> gradientColors = const [
    CupertinoColors.systemBlue,
    CupertinoColors.systemGreen,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.70,
              child: LineChart(lineChartData()),
            )
          ],
        ),
      ),
    );
  }

  LineChartData lineChartData() {
    return LineChartData(
        borderData: FlBorderData(border: Border.all(color: Colors.white)),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 15,
        lineBarsData: [
          LineChartBarData(
              isCurved: true,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                      colors: gradientColors
                          .map((e) => e.withOpacity(0.3))
                          .toList())),
              spots: [
                FlSpot(0, getRandomValueX(0)),
                FlSpot(2, getRandomValueX(0)),
                FlSpot(4, getRandomValueX(0)),
                FlSpot(6, getRandomValueX(0)),
              ]),
          LineChartBarData(
              isCurved: true,
              barWidth: 3,
              color: Colors.red,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData:
                  BarAreaData(show: true, color: Colors.red.withOpacity(0.3)),
              spots: [
                FlSpot(6, getRandomValueX(8)),
                FlSpot(8, getRandomValueX(8)),
                FlSpot(10, getRandomValueX(8)),
                FlSpot(11, getRandomValueX(8)),
              ])
        ]);
  }
}

TextStyle axisTextStyle() {
  return TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red);
}

Widget bottomTiles(double value, TitleMeta meta) {
  String text;
  switch (value.toInt()) {
    case 2:
      text = '20';
      break;
    case 4:
      text = '40';
      break;
    case 6:
      text = '60';
      break;
    case 8:
      text = '80';
      break;
    default:
      return Text("");
  }
  return Text(
    text,
    style: axisTextStyle(),
    textAlign: TextAlign.left,
  );
}

Widget leftTiles(double value, TitleMeta meta) {
  String text;
  switch (value.toInt()) {
    case 2:
      text = '50 mg';
      break;
    case 5:
      text = '100 mg';
      break;
    case 9:
      text = '150 mg';
      break;
    default:
      return Text("");
  }
  return Text(
    text,
    style: axisTextStyle(),
    textAlign: TextAlign.left,
  );
}

double getRandomValue() {
  return Random().nextInt(8).toDouble() + 1;
}

double getRandomValueX(int val) {
  return Random().nextInt(8).toDouble() + val;
}
