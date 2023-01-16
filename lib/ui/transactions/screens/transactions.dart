import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:pouchers/ui/transactions/screens/history.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';

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
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
            left: kMediumPadding, right: kMediumPadding, top: kMacroPadding),
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
              height: kMacroPadding,
            ),
            Expanded(
                child: tabIndex == 0
                    ? History()
                    : Column(
                        children: [
                          SizedBox(height: kSupremePadding,),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kBackgroundColor,
                            ),
                            padding: EdgeInsets.all(kMacroPadding),
                            child: SvgPicture.asset(
                              AssetPaths.voucherIcon,
                              color: kIconGrey,
                              height: 35,
                              width: 35,
                            ),
                          ),
                          SizedBox(
                            height: kRegularPadding,
                          ),
                          Text(
                            noTrans,
                            style: textTheme.headline3!.copyWith(
                              color: kIconGrey,
                            ),
                          )
                        ],
                      ))
          ],
        ),
      ),
    );
  }
}
