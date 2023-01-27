import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/modules/transactions/model/transaction_model.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';

class Analytics extends StatefulWidget {
  static const String routeName = "analytics";

  const Analytics({Key? key}) : super(key: key);

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  int checkedIndex = -1;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.filter_list),
              SizedBox(
                width: kPadding,
              ),
              Text(
                filterBy,
                style: textTheme.headline4,
              ),
            ],
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return inkWell(
                  onTap: () {
                    setState(() => checkedIndex = index);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 1),
                    padding: EdgeInsets.symmetric(
                        vertical: kPadding, horizontal: kRegularPadding),
                    decoration: BoxDecoration(
                      color: checkedIndex == index
                          ? kSecondaryPurple
                          : kBackgroundColor,
                      borderRadius: checkedIndex == index
                          ? BorderRadius.circular(kSmallPadding)
                          : BorderRadius.only(
                              topLeft: Radius.circular(index == 0 ? 50 : 0),
                              bottomLeft: Radius.circular(index == 0 ? 50 : 0),
                              topRight: Radius.circular(index == 5 ? 50 : 0),
                              bottomRight: Radius.circular(index == 5 ? 50 : 0),
                            ),
                    ),
                    child: Text(
                      index == 0
                          ? "1M"
                          : index == 1
                              ? "2M"
                              : index == 2
                                  ? "3M"
                                  : index == 3
                                      ? "4M"
                                      : index == 4
                                          ? "5M"
                                          : "ALL",
                      style: textTheme.bodyText1!.copyWith(
                        fontWeight: checkedIndex == index
                            ? FontWeight.w700
                            : FontWeight.normal,
                        color: checkedIndex == index
                            ? kPrimaryWhite
                            : kSecondaryTextColor,
                      ),
                    ),
                  ),
                );
              })),
          SizedBox(
            height: kRegularPadding,
          ),
          Text(
            "June 2022 - Spending",
            style: textTheme.headline3,
          ),
          SizedBox(
            height: kPadding,
          ),
          NairaWidget(
            text: "50,200.00",
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
          Container(
            height: 200,
            width: double.infinity,
            child: BarChart(BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barTouchData: BarTouchData(
                enabled: false,
              ),
              titlesData: FlTitlesData(
                show: true,
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
                checkToShowHorizontalLine: (value) => value % 10 == 0,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: const Color(0xffe7e8ec),
                  strokeWidth: 1,
                ),
                drawVerticalLine: false,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: kRegularPadding,
              barGroups: getData(),
            )),
          ),
          SizedBox(
            height: kRegularPadding,
          ),
          AnalyticsPayInOut(
            textTheme: textTheme,
            text: "$income - Jun 2022",
            icon: AssetPaths.incomeArrowIcon,
            sign: "+  ",
            color: kColorGreen,
            amount: "500,000",
          ),
          AnalyticsPayInOut(
            textTheme: textTheme,
            text: "$outcome - Jun 2022",
            icon: AssetPaths.outputArrowIcon,
            sign: "-  ",
            amount: "120,000",
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
          SizedBox(height: kRegularPadding,),
          Divider(color: kContainerColor,thickness: 2,),
          SizedBox(height: kSmallPadding,),
          ...analyticsTransactions.map(
            (e) => Container(
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
                              e.image,
                              fit: BoxFit.scaleDown,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: kBackgroundColor),
                          ),
                          SizedBox(
                            width: kRegularPadding,
                          ),
                          Text(
                            e.code,
                            style: textTheme.headline3!.copyWith(
                                color: kBlueColorDark, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(e.sign ?? "",
                                  style: textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: e.sign == "+" ? kColorGreen : kColorRedDeep,
                                  )),
                              NairaWidget(
                                text: "${e.value}",
                                textStyle1: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: e.sign == "+" ? kColorGreen : kColorRedDeep,
                                  fontFamily: null,
                                  fontSize: 16,
                                ),
                                textStyle2: kHeadline3TextStyle.copyWith(
                                    color: e.sign == "+" ? kColorGreen : kColorRedDeep,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kPadding,
                          ),
                          Text(
                            e.expiry,
                            style: textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: kPadding,),
                  Divider(color: kContainerColor,thickness: 2,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 17000000000,
            borderRadius: BorderRadius.zero,
            width: 25,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 17000000000,
            borderRadius: BorderRadius.zero,
            width: 25,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 17000000000,
            borderRadius: BorderRadius.zero,
            width: 25,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 17000000000,
            borderRadius: BorderRadius.zero,
            width: 25,
          ),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 17000000000,
            borderRadius: BorderRadius.zero,
            width: 25,
          ),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 17000000000,
            borderRadius: BorderRadius.zero,
            width: 25,
          ),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 17000000000,
            width: 25,
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
    ];
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xff939393), fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
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

class AnalyticsPayInOut extends StatelessWidget {
  const AnalyticsPayInOut(
      {Key? key,
      required this.textTheme,
      required this.text,
      required this.icon,
      required this.amount,
      required this.color,
      required this.sign})
      : super(key: key);

  final TextTheme textTheme;
  final String text, icon, amount, sign;
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
          Row(
            children: [
              Text(
                sign,
                style: textTheme.headline3!
                    .copyWith(fontWeight: FontWeight.w700, color: color),
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
        ],
      ),
    );
  }
}
