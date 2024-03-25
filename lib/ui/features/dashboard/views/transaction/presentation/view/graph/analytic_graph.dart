import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_analytic.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart';
import 'package:flutter/material.dart';

class AnalyticalBarChart extends StatelessWidget {
  final List<Series<AnalyticInfo, String>> seriesList;

  const AnalyticalBarChart(this.seriesList, {super.key});

  factory AnalyticalBarChart.withAnalyticalData(
          List<List<AnalyticSummary>> chunkedTransactions) =>
      AnalyticalBarChart(_createAnalyticalData(chunkedTransactions));

  @override
  Widget build(BuildContext context) => BarChart(seriesList,
      animate: true,
      barGroupingType: BarGroupingType.grouped,
      defaultRenderer: BarRendererConfig(groupingType: BarGroupingType.grouped),
      layoutConfig: LayoutConfig(
        leftMarginSpec: MarginSpec.fixedPixel(0),
        topMarginSpec: MarginSpec.fixedPixel(0),
        rightMarginSpec: MarginSpec.fixedPixel(0),
        bottomMarginSpec: MarginSpec.fixedPixel(28),
      ),
      primaryMeasureAxis: const NumericAxisSpec(renderSpec: NoneRenderSpec()),
      domainAxis: OrdinalAxisSpec(
          showAxisLine: true,
          renderSpec: SmallTickRendererSpec(
              labelStyle: TextStyleSpec(
                  fontSize: 12,
                  color: ColorUtil.fromDartColor(AppColors.kSecondaryTextColor),
                  lineHeight: 3),
              lineStyle: LineStyleSpec(
                  color: ColorUtil.fromDartColor(AppColors.kLightPurple)),
              labelAnchor: TickLabelAnchor.centered,
              tickLengthPx: 0)));

  static List<Series<AnalyticInfo, String>> _createAnalyticalData(
          List<List<AnalyticSummary>> chunkedTransactions) =>
      chunkedTransactions
          .map((analyticSummary) => Series<AnalyticInfo, String>(
              id: '',
              domainFn: (AnalyticInfo sales, _) => sales.week,
              measureFn: (AnalyticInfo sales, _) => sales.sales,
              colorFn: (AnalyticInfo sales, _) =>
                  ColorUtil.fromDartColor(AppColors.kPrimaryColor),
              data: List.generate(
                  analyticSummary.length,
                  (index) => AnalyticInfo(
                      'WK${index + 1}', analyticSummary[index].totalOutflow))))
          .toList();
}

class AnalyticInfo {
  final String week;
  final num sales;

  AnalyticInfo(this.week, this.sales);
}
