import 'package:Pouchers/utils/extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/common/app_colors.dart';

class BarChartSample2 extends StatefulWidget {
  BarChartSample2({super.key});
  final Color leftBarColor = AppColors.contentColorYellow;
  final Color rightBarColor = AppColors.contentColorRed;
  final Color centerBarColor = AppColors.kGreen100Color;
  final Color avgColor =
      AppColors.contentColorOrange.avg(AppColors.contentColorRed);
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 4.w;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12, 8);
    final barGroup2 = makeGroupData(1, 16, 12, 8);
    final barGroup3 = makeGroupData(2, 18, 5, 8);
    final barGroup4 = makeGroupData(3, 20, 16, 8);
    final barGroup5 = makeGroupData(4, 17, 6, 8);
    final barGroup6 = makeGroupData(5, 19, 1.5, 8);
    final barGroup7 = makeGroupData(6, 10, 1.5, 8);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 38),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 20,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.white,
                        getTooltipItem: (a, b, c, d) => null),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                              in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg = sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                            barRods: showingBarGroups[touchedGroupIndex]
                                .barRods
                                .map((rod) => rod.copyWith(
                                    toY: avg, color: widget.avgColor))
                                .toList(),
                          );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(),
                    topTitles: const AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: bottomTitles,
                          reservedSize: 42),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 28,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                      show: true,
                      border: Border(
                          bottom: BorderSide(
                              color: AppColors.kLightPurple, width: 1.w))),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      );

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 10) {
      text = '5K';
    } else if (value == 19) {
      text = '10K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Wk1', 'Wk2', 'Wk3', 'Wk4', 'Wk5', 'Wk6', 'Wk7'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 12.h, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) =>
      BarChartGroupData(
        barsSpace: 4.w,
        x: x,
        barRods: [
          BarChartRodData(
              toY: y1,
              color: widget.leftBarColor,
              width: width,
              borderRadius: BorderRadius.vertical(top: Radius.circular(1.r))),
          BarChartRodData(
              toY: y2,
              color: widget.centerBarColor,
              width: width,
              borderRadius: BorderRadius.vertical(top: Radius.circular(1.r))),
          BarChartRodData(
              toY: y3,
              color: widget.rightBarColor,
              width: width,
              borderRadius: BorderRadius.vertical(top: Radius.circular(1.r))),
          BarChartRodData(
              toY: y1,
              color: widget.leftBarColor,
              width: width,
              borderRadius: BorderRadius.vertical(top: Radius.circular(1.r))),
          BarChartRodData(
              toY: y2,
              color: widget.centerBarColor,
              width: width,
              borderRadius: BorderRadius.vertical(top: Radius.circular(1.r))),
          BarChartRodData(
              toY: y3,
              color: widget.rightBarColor,
              width: width,
              borderRadius: BorderRadius.vertical(top: Radius.circular(1.r))),
          BarChartRodData(
              toY: y3,
              color: widget.rightBarColor,
              width: width,
              borderRadius: BorderRadius.vertical(top: Radius.circular(1.r))),
        ],
      );
}
