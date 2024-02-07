// import 'package:Pouchers/ui/common/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:community_charts_flutter/community_charts_flutter.dart';

// class AnalyticalBarChart extends StatelessWidget {
//   final List<Series<OrdinalSales, String>> seriesList;
//   final bool animate;

//   const AnalyticalBarChart(this.seriesList, {super.key, this.animate = false});

//   factory AnalyticalBarChart.withSampleData() =>
//       AnalyticalBarChart(_createSampleData(), animate: true);

//   @override
//   Widget build(BuildContext context) => BarChart(seriesList,
//       animate: true,
//       barGroupingType: BarGroupingType.grouped,
//       defaultRenderer: BarRendererConfig(
//         groupingType: BarGroupingType.grouped,
//       ),
//       primaryMeasureAxis: const NumericAxisSpec(renderSpec: NoneRenderSpec()),
//       domainAxis: OrdinalAxisSpec(
//         showAxisLine: true,
//         renderSpec: SmallTickRendererSpec(
//             labelStyle: TextStyleSpec(
//                 color: MaterialPalette.green.shadeDefault, lineHeight: 3),
//             lineStyle: const LineStyleSpec(),
//             labelAnchor: TickLabelAnchor.centered,
//             tickLengthPx: 0),
//       ));

//   static List<Series<OrdinalSales, String>> _createSampleData() {
//     final desktopSalesData = [
//       OrdinalSales('WK1', 5),
//       OrdinalSales('WK2', 25),
//       OrdinalSales('WK3', 100),
//       OrdinalSales('WK4', 75),
//       OrdinalSales('WK5', 25),
//     ];

//     final tableSalesData = [
//       OrdinalSales('WK1', 25),
//       OrdinalSales('WK2', 50),
//       OrdinalSales('WK3', 10),
//       OrdinalSales('WK4', 20),
//       OrdinalSales('WK5', 25),
//     ];

//     final mobileSalesData = [
//       OrdinalSales('WK1', 10),
//       OrdinalSales('WK2', 15),
//       OrdinalSales('WK3', 50),
//       OrdinalSales('WK4', 45),
//       OrdinalSales('WK5', 25),
//     ];

//     return [
//       Series<OrdinalSales, String>(
//         id: 'Desktop',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         colorFn: (_, __) => ColorUtil.fromDartColor(Colors.red),
//         data: desktopSalesData,
//       ),
//       Series<OrdinalSales, String>(
//         id: 'Tablet',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         colorFn: (_, __) => ColorUtil.fromDartColor(Colors.red),
//         data: tableSalesData,
//       ),
//       Series<OrdinalSales, String>(
//         id: 'Mobile',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         colorFn: (_, __) => ColorUtil.fromDartColor(AppColors.kPrimaryColor),
//         data: mobileSalesData,
//       ),
//       Series<OrdinalSales, String>(
//         id: 'Tv',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         colorFn: (_, __) => ColorUtil.fromDartColor(Colors.red),
//         data: desktopSalesData,
//       ),
//       Series<OrdinalSales, String>(
//         id: 'Desktop',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         colorFn: (_, __) => ColorUtil.fromDartColor(Colors.red),
//         data: desktopSalesData,
//       ),
//       Series<OrdinalSales, String>(
//         id: 'Tablet',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         colorFn: (_, __) => ColorUtil.fromDartColor(Colors.red),
//         data: tableSalesData,
//       ),
//       Series<OrdinalSales, String>(
//         id: 'Mobile',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         colorFn: (OrdinalSales sales, __) => ColorUtil.fromDartColor(
//             sales.sales <= 10 ? Colors.green : Colors.red),
//         data: mobileSalesData,
//       )
//     ];
//   }
// }

// /// Sample ordinal data type.
// class OrdinalSales {
//   final String year;
//   final int sales;

//   OrdinalSales(this.year, this.sales);
// }
