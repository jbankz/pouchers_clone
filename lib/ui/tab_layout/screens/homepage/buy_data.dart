import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class BuyData extends ConsumerStatefulWidget {
  static const String routeName = "buyData";

  const BuyData({Key? key}) : super(key: key);

  @override
  ConsumerState<BuyData> createState() => _BuyDataState();
}

class _BuyDataState extends ConsumerState<BuyData>
    with TickerProviderStateMixin {
  TextEditingController contactController = TextEditingController();
  int currentIndex = -1;
  List<String> category = [
    topDeal,
    "Daily",
    "Weekly",
    "1 Month",
    "2 Months",
    "3 Months"
  ];
  late TabController? _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: category.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: data,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                TextInputNoIcon(
                  textTheme: textTheme,
                  text: mobileNumber,
                  controller: contactController,
                  icon: inkWell(
                    onTap: () async {
                      final PhoneContact contact =
                          await FlutterContactPicker.pickPhoneContact();
                      setState(() {
                        contactController.text = contact.phoneNumber!.number!;
                      });
                    },
                    child: SvgPicture.asset(
                      AssetPaths.contactBook,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(
                  height: kPadding,
                ),
                Text(
                  selectProvider,
                  style: textTheme.headline3,
                ),
                SizedBox(
                  height: kSmallPadding,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: provider
                        .mapIndexed(
                          (index, element) => inkWell(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(kRegularPadding),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? kLightPurple
                                          : kContainerColor,
                                      shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                    provider[index].icon,
                                  ),
                                ),
                                currentIndex == index
                                    ? Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                                color: kPurpleColor,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.check,
                                              color: kPrimaryWhite,
                                              size: 15,
                                            )),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        )
                        .toList()),
                SizedBox(
                  height: kMicroPadding,
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
                      ...category.map(
                        (e) => SizedBox(
                          child: Tab(
                            text:
                                "${e.substring(0, 1).toUpperCase()}${e.substring(1).toLowerCase()}",
                          ),
                        ),
                      )
                    ],
                    controller: _tabController,
                    indicatorColor: kPurpleColor,
                    indicatorWeight: 4,
                    unselectedLabelColor: kSecondaryTextColor,
                    unselectedLabelStyle: textTheme.headline2,
                    labelColor: kPurpleColor,
                    isScrollable: true,
                    labelStyle: textTheme.headline2,
                  ),
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                GridView.count(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: SizeConfig.blockSizeHorizontal! / 4.7,
                  // crossAxisSpacing: 15,
                  // mainAxisSpacing: 15,
                  // childAspectRatio: 0.85,
                  children: List.generate(
                    guestListData.length,
                    (index) => Column(
                      children: [
                        inkWell(
                          onTap: () {
                            print(guestListData[index].mb);
                            buildShowModalBottomSheet(
                                context,
                                RechargeSummary(textTheme: textTheme, isData: true));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: kLightPurple),
                                borderRadius:
                                    BorderRadius.circular(kSmallPadding)),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(kPadding),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(kSmallPadding),
                                      topLeft: Radius.circular(kSmallPadding),
                                    ),
                                    color: kPurpleColor,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "₦",
                                      style: TextStyle(
                                        color: kPrimaryWhite,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: guestListData[index].title,
                                          style: textTheme.headline4!.copyWith(
                                            color: kLightPurple,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: kSmallPadding,
                                ),
                                Text(
                                  guestListData[index].mb!,
                                  style: textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: kPadding,
                                ),
                                Text(
                                  "${guestListData[index].days} days",
                                  style: textTheme.headline4,
                                ),
                                SizedBox(
                                  height: kPadding,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "₦",
                                    style: TextStyle(
                                      color: kPrimaryTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: guestListData[index].icon,
                                        style: textTheme.subtitle1!.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: kSmallPadding,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
