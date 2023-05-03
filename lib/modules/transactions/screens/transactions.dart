import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Pouchers/modules/transactions/screens/analytics.dart';
import 'package:Pouchers/modules/transactions/screens/history.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';

class Transactions extends StatefulWidget {
  static const String routeName = "transactions";

  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions>
    with TickerProviderStateMixin {
  late TabController? _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(
          left: kMediumPadding, right: kMediumPadding, top: kRegularPadding),
      child: Column(
        children: [
          Text(
            transaction,
            style: textTheme.headline4!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  tabIndex = index;
                });
              },
              tabs: [
                Text(
                  history,
                ),
                Text(analytics),
              ],
              controller: _tabController,
              indicatorColor: kPurpleColor,
              indicatorWeight: 2,
              unselectedLabelColor: kSecondaryTextColor,
              unselectedLabelStyle: textTheme.headline2!.copyWith(height: 3),
              labelColor: kPurpleColor,
              labelStyle: textTheme.headline2!.copyWith(height: 3),
            ),
          ),
          SizedBox(
            height: kRegularPadding,
          ),
          Expanded(
              child: tabIndex == 0
                  ? History()
                  : Analytics()
            )
        ],
      ),
    );
  }
}
