import 'package:flutter/material.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

import 'schedule_widget_constants.dart';

class ScheduleModal extends StatefulWidget {
  const ScheduleModal({
    Key? key,
  }) : super(key: key);

  @override
  State<ScheduleModal> createState() => _ScheduleModalState();
}

class _ScheduleModalState extends State<ScheduleModal>
    with TickerProviderStateMixin {
  Widget _prefixIcon = SizedBox();
  late TabController? _tabController;
  int tabIndex = 0;
  int dayIndex = -1;
  int monthIndex = -1;

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
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.7,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kMicroPadding),
                topRight: Radius.circular(kMicroPadding),
              ),
              color: kPrimaryWhite),
          child: ListView(
            controller: controller,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: kMacroPadding,
                  height: 3,
                  decoration: BoxDecoration(
                    color: kPurpleColor200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                selectFrequency,
                style: textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: TabBar(
                  onTap: (index) {
                    setState(() {
                      tabIndex = index;
                    });
                    if (tabIndex == 1) {
                      setState(() {
                        dayIndex = -1;
                      });
                    } else {
                      setState(() {
                        monthIndex = -1;
                      });
                    }
                  },
                  tabs: [
                    ...category.mapIndexed(
                      (index, element) => SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Column(
                          children: [
                            Tab(
                              text:
                                  "${element.substring(0, 1).toUpperCase()}${element.substring(1).toLowerCase()}",
                            ),
                            Divider(
                              // height: 1,
                              thickness: 3,
                              color: tabIndex == index
                                  ? kPrimaryColor
                                  : kPurpleColor200,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                  controller: _tabController,
                  indicatorColor: kTransparent,
                  indicatorWeight: 1,
                  unselectedLabelColor: kPrimaryTextColor,
                  unselectedLabelStyle: textTheme.subtitle1,
                  labelColor: kPurpleColor,
                  isScrollable: true,
                  labelStyle: textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: tabIndex == 1 ? kPadding : 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kMediumPadding, vertical: kMediumPadding),
                child: tabIndex == 0
                    ? GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: SizeConfig.blockSizeHorizontal! / 2.4,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: List.generate(
                          days.length,
                          (index) => inkWell(
                            onTap: () {
                              setState(() {
                                dayIndex = index;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(kRegularPadding),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kSmallPadding),
                                  border: Border.all(
                                      color: dayIndex == index
                                          ? kPrimaryColor
                                          : kLightPurple)),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  days[index],
                                  style: textTheme.bodyText1!.copyWith(
                                    color: dayIndex == index
                                        ? kPrimaryColor
                                        : kIconGrey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 7,
                        childAspectRatio: SizeConfig.blockSizeHorizontal! / 3.8,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: List.generate(
                          generateNumbers().length,
                          (index) => inkWell(
                            onTap: () {
                              setState(() {
                                monthIndex = index;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(kPadding),
                                  border: Border.all(
                                      color: monthIndex == index
                                          ? kPrimaryColor
                                          : kTransparent,
                                      width: 2)),
                              child: Text(
                                generateNumbers()[index].toString(),
                                style: textTheme.bodyText1!.copyWith(
                                  color: kDarkFill100,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                child: tabIndex == 0
                    ? dayIndex == -1
                        ? SizedBox()
                        : Text(
                            "$topUp${days[dayIndex]}",
                            style: textTheme.headline4,
                            textAlign: TextAlign.center,
                          )
                    : monthIndex == -1
                        ? SizedBox()
                        : Text(
                            "$topUp2${ordinal_suffix_of(generateNumbers()[monthIndex])} $topUp3",
                            style: textTheme.headline4,
                            textAlign: TextAlign.center,
                          ),
              ),
              SizedBox(
                height: kRegularPadding,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
                child: LargeButton(
                  title: continueText,
                  onPressed: (dayIndex == -1 && monthIndex == -1)
                      ? () {}
                      : () {
                          Navigator.pop(
                              context,
                              tabIndex == 0
                                  ? days[dayIndex]
                                  : ordinal_suffix_of(generateNumbers()[monthIndex]));
                        },
                  disableColor: dayIndex == -1 && monthIndex == -1
                      ? kPurpleColor100
                      : kPrimaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleOnlyMonth extends StatefulWidget {
  const ScheduleOnlyMonth({Key? key}) : super(key: key);

  @override
  State<ScheduleOnlyMonth> createState() => _ScheduleOnlyMonthState();
}

class _ScheduleOnlyMonthState extends State<ScheduleOnlyMonth> {
  int monthIndex = -1;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.67,
        maxChildSize: 0.67,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kMicroPadding),
                topRight: Radius.circular(kMicroPadding),
              ),
              color: kPrimaryWhite),
          child: ListView(
            controller: controller,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: kMacroPadding,
                  height: 3,
                  decoration: BoxDecoration(
                    color: kPurpleColor200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                selectFrequency,
                style: textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: kMicroPadding,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kMediumPadding, vertical: kMediumPadding),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 7,
                  childAspectRatio: SizeConfig.blockSizeHorizontal! / 3.8,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: List.generate(
                    generateNumbers().length,
                        (index) => inkWell(
                      onTap: () {
                        setState(() {
                          monthIndex = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kPadding),
                            border: Border.all(
                                color: monthIndex == index
                                    ? kPrimaryColor
                                    : kTransparent,
                                width: 2)),
                        child: Text(
                          generateNumbers()[index].toString(),
                          style: textTheme.bodyText1!.copyWith(
                            color: kDarkFill100,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                child:  monthIndex == -1
                    ? SizedBox()
                    : Text(
                  "$topUp2${ordinal_suffix_of(generateNumbers()[monthIndex])} $topUp3",
                  style: textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: kRegularPadding,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
                child: LargeButton(
                  title: continueText,
                  onPressed: (monthIndex == -1)
                      ? () {}
                      : () {
                    Navigator.pop(
                        context,
                       ordinal_suffix_of(generateNumbers()[monthIndex]));
                  },
                  disableColor:  monthIndex == -1
                      ? kPurpleColor100
                      : kPrimaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

