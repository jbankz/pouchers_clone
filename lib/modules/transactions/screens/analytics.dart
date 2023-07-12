import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/modules/transactions/model/transaction_model.dart';
import 'package:Pouchers/modules/transactions/providers/transaction_provider.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class MonthClass {
  final String index;
  String month;

  MonthClass(this.index, this.month);
}

class Analytics extends ConsumerStatefulWidget {
  static const String routeName = "analytics";

  const Analytics({Key? key}) : super(key: key);

  @override
  ConsumerState<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends ConsumerState<Analytics> {
  int checkedIndex = -1;
  MonthClass _month = MonthClass("01", "January");
  List<MonthClass> months = [
    MonthClass("01", "January"),
    MonthClass("02", "February"),
    MonthClass("03", "March"),
    MonthClass("04", "April"),
    MonthClass("05", "May"),
    MonthClass("06", "June"),
    MonthClass("07", "July"),
    MonthClass("08", "August"),
    MonthClass("09", "September"),
    MonthClass("10", "October"),
    MonthClass("11", "November"),
    MonthClass("12", "December"),
  ];

  final dateFormat = DateFormat('MMM yyyy');
  final monthFormat = DateFormat('MM').format(DateTime.now());
  List<AnalyticsSummary> analyticsSummary = [];
  double? _maxNumber;
  var date = DateTime.now().formatDate("MM");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(getTransactionAnalyticsProvider.notifier)
          .getTransactionAnalytics(
              month: date, year: DateTime.now().year.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
        child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
                    child: DropdownButtonFormField<MonthClass>(
                        value: months
                            .firstWhere((element) => element.index == date),
                        isExpanded: true,
                        isDense: true,
                        style:
                            textTheme.bodyText2!.copyWith(color: kPrimaryBlack),
                        decoration: InputDecoration(
                          filled: true,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: kPadding, horizontal: kMicroPadding),
                          hintStyle: textTheme.subtitle1!
                              .copyWith(color: kPrimaryTextColor),
                          fillColor: kBackgroundColor,
                          border: OutlineInputBorder(),
                          errorMaxLines: 2,
                          errorStyle: textTheme.headline5!.copyWith(
                              color: kColorRed,
                              fontSize: 12,
                              overflow: TextOverflow.visible),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kSecondaryTextColor),
                            borderRadius: BorderRadius.circular(kPadding),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kSecondaryTextColor),
                            borderRadius: BorderRadius.circular(kPadding),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(kPadding),
                            borderSide: BorderSide(color: kColorRed),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(kPadding),
                            borderSide: BorderSide(color: kColorRed),
                          ),
                        ),
                        menuMaxHeight: MediaQuery.of(context).size.height / 2,
                        onChanged: (MonthClass? val) {
                          setState(() {
                            _month = val!;
                            date = val.index;
                          });
                          ref
                              .read(getTransactionAnalyticsProvider.notifier)
                              .getTransactionAnalytics(
                                month: _month.index,
                                year: DateTime.now().year.toString(),
                              );
                        },
                        items: months
                            .map((e) => DropdownMenuItem<MonthClass>(
                                  child: Text(e.month),
                                  value: e,
                                ))
                            .toList()))),
            SizedBox(
              width: kRegularPadding,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: kPadding, horizontal: kMicroPadding),
              decoration: BoxDecoration(
                  border: Border.all(color: kLightPurple, width: 1),
                  borderRadius: BorderRadius.circular(kPadding),
                  color: kBackgroundColor),
              child: Text(
                DateTime.now().year.toString(),
                style: textTheme.headline3!.copyWith(color: kPurpleColor),
              ),
            )
          ],
        ),
        SizedBox(
          height: kMediumPadding,
        ),
        Consumer(
          builder: (context, ref, _) {
            ref.listen(getTransactionAnalyticsProvider,
                (previous, NotifierState<TransactionAnalyticsResponse> next) {
              if (next.status == NotifierStatus.done) {
                next.data!.data!.analyticsSummary!.forEach((element) {
                  analyticsSummary.add(element);
                });
                _maxNumber = analyticsSummary
                    .map<double>((e) => e.totalOutflow == null ? 0 : e.totalOutflow!.toDouble() )
                    .reduce(max);
              }
            });
            return ref.watch(getTransactionAnalyticsProvider).when(
                done: (data) {
                  if (data != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${months.firstWhere((element) => element.index == date).month.substring(0, 3).toUpperCase()} ${DateTime.now().year} - Spending",
                          style: textTheme.headline3,
                        ),
                        SizedBox(
                          height: kPadding,
                        ),
                        NairaWidget(
                          text: kPriceFormatter(double.parse(
                              data.data!.analytics![0].totalSpending ?? "0")),
                          textStyle1: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: kPrimaryTextColor,
                            fontFamily: null,
                            fontSize: 26,
                          ),
                          textStyle2: kSubtitle1Style.copyWith(
                            fontWeight: FontWeight.w700,
                            fontFamily: null,
                            fontSize: 26,
                          ),
                        ),
                        SizedBox(
                          height: kMacroPadding,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: BarChart(

                                BarChartData(

                              alignment: BarChartAlignment.spaceAround,
                              maxY: _maxNumber,
                              barTouchData: BarTouchData(
                                enabled: false,
                              ),
                              titlesData: FlTitlesData(

                                show: true,
                                leftTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 28,
                                    getTitlesWidget: bottomTitles,
                                  ),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              gridData: FlGridData(
                                show: false,
                                checkToShowHorizontalLine: (value) =>
                                    value % 10 == 0,
                                getDrawingHorizontalLine: (value) => FlLine(
                                  color: const Color(0xffe7e8ec),
                                  strokeWidth: 1,
                                ),
                                horizontalInterval:
                                    _maxNumber == null || _maxNumber! < 5
                                        ? 1
                                        : _maxNumber! / 5,
                                drawVerticalLine: false,
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              groupsSpace: kRegularPadding,
                              barGroups: getData(data.data!.analyticsSummary!),
                            )),

                          ),
                        ),
                        SizedBox(
                          height: kRegularPadding,
                        ),
                        AnalyticsPayInOut(
                          textTheme: textTheme,
                          text:
                              "$income - ${months.firstWhere((element) => element.index == date).month.substring(0, 3)} ${DateTime.now().year}",
                          icon: AssetPaths.incomeArrowIcon,
                          color: kColorGreen,
                          amount: kPriceFormatter(double.parse(
                              data.data!.analytics![0].totalInflow ?? "0")),
                        ),
                        AnalyticsPayInOut(
                          textTheme: textTheme,
                          text:
                              "$outcome - ${months.firstWhere((element) => element.index == date).month.substring(0, 3)} ${DateTime.now().year}",
                          icon: AssetPaths.outputArrowIcon,
                          amount: kPriceFormatter(double.parse(
                              data.data!.analytics![0].totalOutflow ?? "0")),
                          color: kColorRedDeep,
                        ),
                        SizedBox(
                          height: kPadding,
                        ),
                        Text(
                          transaction,
                          style: textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: kRegularPadding,
                        ),
                        Divider(
                          color: kContainerColor,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: kSmallPadding,
                        ),
                        TransactionsAnalytics(
                          title: "Cable TV",
                          image: AssetPaths.televisionIcon,
                          amount: kPriceFormatter(double.parse(
                              data.data!.analytics![0].totalCablePurchased ??
                                  "0")),
                          percent:
                              data.data!.analytics![0].cablePercentage == null
                                  ? "0"
                                  : data.data!.analytics![0].cablePercentage
                                      .toString(),
                        ),
                        TransactionsAnalytics(
                          title: "Electricity",
                          image: AssetPaths.electricityIcon,
                          amount: kPriceFormatter(double.parse(data.data!
                                  .analytics![0].totalElectricityPurchased ??
                              "0")),
                          percent: data.data!.analytics![0]
                                      .electricityPercentage ==
                                  null
                              ? "0"
                              : data.data!.analytics![0].electricityPercentage
                                  .toString(),
                        ),
                        TransactionsAnalytics(
                          title: "Airtime",
                          image: AssetPaths.airtimeIcon,
                          amount: kPriceFormatter(double.parse(
                              data.data!.analytics![0].totalAirtimePurchased ??
                                  "0")),
                          percent:
                              data.data!.analytics![0].airtimePercentage == null
                                  ? "0"
                                  : data.data!.analytics![0].airtimePercentage
                                      .toString(),
                        ),
                        TransactionsAnalytics(
                          title: "Data",
                          image: AssetPaths.dataIcon,
                          amount: kPriceFormatter(double.parse(
                              data.data!.analytics![0].totalDataPurchased ??
                                  "0")),
                          percent:
                              data.data!.analytics![0].dataPercentage == null
                                  ? "0"
                                  : data.data!.analytics![0].dataPercentage
                                      .toString(),
                        ),
                        TransactionsAnalytics(
                          title: "Internet",
                          image: AssetPaths.wifiIcon,
                          amount: kPriceFormatter(double.parse(
                              data.data!.analytics![0].totalInternetPurchased ??
                                  "0")),
                          percent:
                              data.data!.analytics![0].internetPercentage ==
                                      null
                                  ? "0"
                                  : data.data!.analytics![0].internetPercentage
                                      .toString(),
                        ),
                        TransactionsAnalytics(
                          title: "Betting",
                          image: AssetPaths.bettingIcon,
                          amount: kPriceFormatter(double.parse(
                              data.data!.analytics![0].totalBettingPurchased ??
                                  "0")),
                          percent:
                              data.data!.analytics![0].bettingPercentage == null
                                  ? "0"
                                  : data.data!.analytics![0].bettingPercentage
                                      .toString(),
                        ),
                        TransactionsAnalytics(
                          title: "Vouchers",
                          image: AssetPaths.voucherIcon,
                          amount: kPriceFormatter(double.parse(
                              data.data!.analytics![0].totalVoucherPurchased ??
                                  "0")),
                          percent:
                              data.data!.analytics![0].voucherPercentage == null
                                  ? "0"
                                  : data.data!.analytics![0].voucherPercentage
                                      .toString(),
                        )
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                },
                loading: () => SpinKitDemo(),
                error: (val) {
                  return Text("No Analytics available for now");
                });
          },
        ),
      ],
    ));
  }

  List<BarChartGroupData> getData(List<AnalyticsSummary> summary) {
    return [
      ...summary.mapIndexed(
        (index, e) => BarChartGroupData(
          x: index,
          barsSpace: 5,
          barRods: [
            BarChartRodData(
                toY: e.totalOutflow == null ? 0 : e.totalOutflow!.toDouble(),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kPadding),
                    topRight: Radius.circular(kPadding)),
                width: 5,
                color: kPrimaryColor),
          ],
        ),
      )
    ];
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xff939393), fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '1 ';
        break;
      case 1:
        text = '2 ';
        break;
      case 2:
        text = '3 ';
        break;
      case 3:
        text = '4 ';
        break;
      case 4:
        text = '5 ';
        break;
      case 5:
        text = '6 ';
        break;
      case 6:
        text = '7 ';
        break;
      case 7:
        text = '8 ';
        break;
      case 8:
        text = '9';
        break;
      case 9:
        text = '10';
        break;
      case 10:
        text = '11';
        break;
      case 11:
        text = '12';
        break;
      case 12:
        text = '13';
        break;
      case 13:
        text = '14';
        break;
      case 14:
        text = '15';
        break;
      case 15:
        text = '16';
        break;
      case 16:
        text = '17';
        break;
      case 17:
        text = '18';
        break;
      case 18:
        text = '19';
        break;
      case 19:
        text = '20';
        break;
      case 20:
        text = '21';
        break;
      case 21:
        text = '22';
        break;
      case 22:
        text = '23';
        break;
      case 23:
        text = '24';
        break;
      case 24:
        text = '25';
        break;
      case 25:
        text = '26';
        break;
      case 26:
        text = '27';
        break;
      case 27:
        text = '28';
        break;
      case 28:
        text = '29';
        break;
      case 29:
        text = '30';
        break;
      case 30:
        text = '31';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }
}

class TransactionsAnalytics extends StatelessWidget {
  const TransactionsAnalytics(
      {Key? key,
      required this.title,
      required this.image,
      required this.amount,
      required this.percent})
      : super(key: key);

  final String title, image, amount, percent;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.only(bottom: kRegularPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      image,
                      fit: BoxFit.scaleDown,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kBackgroundColor),
                  ),
                  SizedBox(
                    width: kRegularPadding,
                  ),
                  Text(
                    title,
                    style: textTheme.headline3!.copyWith(
                        color: kBlueColorDark, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  NairaWidget(
                    text: amount,
                    textStyle1: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kColorGreen,
                      fontFamily: null,
                      fontSize: 16,
                    ),
                    textStyle2: kHeadline3TextStyle.copyWith(
                        color: kColorGreen, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Text(
                    "$percent%",
                    style: textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: kPadding,
          ),
          Divider(
            color: kContainerColor,
            thickness: 2,
          )
        ],
      ),
    );
  }
}

class AnalyticsPayInOut extends StatelessWidget {
  const AnalyticsPayInOut({
    Key? key,
    required this.textTheme,
    required this.text,
    required this.icon,
    required this.amount,
    required this.color,
  }) : super(key: key);

  final TextTheme textTheme;
  final String text, icon, amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kRegularPadding),
      padding: EdgeInsets.symmetric(
          vertical: kRegularPadding, horizontal: kRegularPadding),
      decoration: BoxDecoration(
          color: kBackgroundColor, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Container(
            child: SvgPicture.asset(
              icon,
            ),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: kPrimaryWhite, borderRadius: BorderRadius.circular(3)),
          ),
          SizedBox(
            width: kSmallPadding,
          ),
          Expanded(
            child: Text(
              text,
              style: textTheme.headline3!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          NairaWidget(
            text: amount,
            textStyle1: TextStyle(
              fontWeight: FontWeight.normal,
              color: color,
              fontFamily: null,
              fontSize: 16,
            ),
            textStyle2: kHeadline2TextStyle.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
