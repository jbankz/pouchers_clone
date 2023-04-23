import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/buy_cable_class.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/account/screens/account_settings/schedule_payments.dart';
import 'package:Pouchers/modules/account/screens/disable_account/disable_modal.dart';
import 'package:Pouchers/modules/schedule_purchase/provider/schedule_provider.dart';
import 'package:Pouchers/modules/schedule_purchase/schedule_modal.dart';
import 'package:Pouchers/modules/schedule_purchase/schedule_widget_constants.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:Pouchers/modules/utilities/model/utilities_model.dart';
import 'package:Pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class ScheduleDataTopUp extends ConsumerStatefulWidget {
  static const String routeName = "scheduleDataTopUp";
  final String? text, contactNumber, frequency, id;
  final GetUtilitiesData? billerData;

  const ScheduleDataTopUp(
      {Key? key,
      this.text,
      this.contactNumber,
      this.billerData,
      this.frequency,
      this.id})
      : super(key: key);

  @override
  ConsumerState<ScheduleDataTopUp> createState() => _ScheduleDataTopUpState();
}

class _ScheduleDataTopUpState extends ConsumerState<ScheduleDataTopUp>
    with TickerProviderStateMixin {
  late TextEditingController contactController;
  int currentIndex = -1;
  int currentOperatorIndex = -1;
  String frequency = "";
  late TabController? _tabController;
  int tabIndex = 0;
  GetUtilitiesData? billerData;
  // MobileOperatorService? operator;
  String topUpDate = "";
  String? threshold;
  String? discountValue;
  List<MobileOperatorService> mobileService = [];
  MobileOperatorService? _mobileOperatorService;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: category.length, vsync: this);
    widget.contactNumber != null
        ? contactController = TextEditingController(text: widget.contactNumber)
        : contactController = TextEditingController();

    if (widget.frequency != null) {
      frequency = widget.frequency!.startsWith(RegExp("[0-9:\s]"))
          ? ordinal_suffix_of(int.parse(widget.frequency!))
          : widget.frequency!;
      topUpDate = "Next top-up date is the next $frequency";
    }

    if (widget.billerData != null) {
      currentIndex = getIndex(widget.billerData!.displayName!);
      billerData = widget.billerData;
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getDiscountProvider.notifier).getDiscount(utility: "data");
      widget.text == "viewSchedule"
          ? ref
              .read(getUtilitiesProvider.notifier)
              .getUtilities(utility: "data")
          : null;
    });
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
      title: scheduleData,
      child: ListenerPage(
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
                  ref.watch(getUtilitiesProvider).when(
                        done: (provider) {
                          if (provider != null) {
                            return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: provider.data!
                                    .mapIndexed(
                                      (index, element) => inkWell(
                                        onTap: () {
                                          setState(() {
                                            currentIndex = index;
                                            billerData = element;
                                          });
                                          ref
                                              .read(
                                                  getDataBundleProvider.notifier)
                                              .getDataBundle(
                                                  merchantServiceId: billerData!
                                                      .operatorpublicid!);
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.all(kRegularPadding),
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: currentIndex == index
                                                      ? kLightPurple
                                                      : kContainerColor,
                                                  shape: BoxShape.circle),
                                              child: SvgPicture.asset(icon(
                                                  provider.data![index]
                                                      .displayName!)),
                                            ),
                                            currentIndex == index
                                                ? Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        decoration: BoxDecoration(
                                                            color: kPurpleColor,
                                                            shape:
                                                                BoxShape.circle),
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
                                    .toList());
                          } else {
                            return SizedBox();
                          }
                        },
                        loading: () => SpinKitDemo(),
                        error: (val) => Text(
                          "No Provider for now",
                          style: textTheme.subtitle2,
                        ),
                      ),
                  ref.watch(getDiscountProvider).when(done: (done) {
                    if (done != null) {
                      threshold = done.data!.threshold ?? "0";
                      discountValue = done.data!.discountValue ?? "0";
                      return SizedBox();
                    } else {
                      return SizedBox();
                    }
                  }),
                  SizedBox(
                    height: kMicroPadding,
                  ),
                  InkWell(
                    onTap: (mobileService == null)
                        ? null
                        : () async {
                            final result = await buildShowModalBottomSheet(
                                context,
                                DataModal(
                                    paymentItem: mobileService,
                                    discountValue: discountValue,
                                    threshold: threshold));
                            if (result != null) {
                              setState(() => _mobileOperatorService = result);
                            }
                          },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: kRegularPadding),
                      decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(kSmallPadding)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: kMediumPadding),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                        _mobileOperatorService == null
                                            ? type
                                            : _mobileOperatorService!
                                                .serviceName!,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: _mobileOperatorService == null
                                            ? textTheme.bodyText1!.copyWith(
                                                color: kSecondaryTextColor
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w300,
                                              )
                                            : textTheme.subtitle1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Consumer(builder: (context, ref, _) {
                            var _widget = Row(
                              children: [
                                _mobileOperatorService == null
                                    ? SizedBox()
                                    : RichText(
                                        text: TextSpan(
                                          text: "₦",
                                          style: TextStyle(
                                            color: kPrimaryTextColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: kPriceFormatter(
                                                        _mobileOperatorService!
                                                            .servicePrice!
                                                            .toDouble())
                                                    .replaceAll(".00", ""),
                                                style: textTheme.subtitle1)
                                          ],
                                        ),
                                      ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30,
                                  color: kSecondaryTextColor,
                                ),
                              ],
                            );
                            return ref.watch(getDataBundleProvider).when(
                                  done: (data) {
                                    if (data != null) {
                                      mobileService =
                                          data.data!.mobileOperatorServices!;
                                    }
                                    return _widget;
                                  },
                                  loading: () {
                                    return SpinKitDemo(
                                      size: 25,
                                    );
                                  },
                                  error: (val) => _widget,
                                );
                          }),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width,
                  //   child: TabBar(
                  //     onTap: (index) {
                  //       setState(() {
                  //         tabIndex = index;
                  //       });
                  //     },
                  //     tabs: [
                  //       ...category.map(
                  //         (e) => SizedBox(
                  //           child: Tab(
                  //             text:
                  //                 "${e.substring(0, 1).toUpperCase()}${e.substring(1).toLowerCase()}",
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //     controller: _tabController,
                  //     indicatorColor: kPurpleColor,
                  //     indicatorWeight: 4,
                  //     unselectedLabelColor: kSecondaryTextColor,
                  //     unselectedLabelStyle: textTheme.headline2,
                  //     labelColor: kPurpleColor,
                  //     isScrollable: true,
                  //     labelStyle: textTheme.headline2,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: kMacroPadding,
                  // ),
                  // ref.watch(getDataBundleProvider).when(
                  //     idle: () => SizedBox(),
                  //     done: (done) {
                  //       if (done != null &&
                  //           done.data!.mobileOperatorServices!.isNotEmpty) {
                  //         return Center(
                  //           child: GridView.count(
                  //             primary: false,
                  //             physics: NeverScrollableScrollPhysics(),
                  //             shrinkWrap: true,
                  //             crossAxisCount: 3,
                  //             crossAxisSpacing: 10,
                  //             mainAxisSpacing: 10,
                  //             childAspectRatio:
                  //                 SizeConfig.blockSizeHorizontal! / 5.2,
                  //             children: done.data!.mobileOperatorServices!
                  //                 .mapIndexed(
                  //                   (index, element) => inkWell(
                  //                     onTap: () {
                  //                       if (contactController.text.isEmpty) {
                  //                         showErrorBar(
                  //                             context, "Please input the number");
                  //                       } else {
                  //                         setState(() {
                  //                           operator = element;
                  //                           currentOperatorIndex = index;
                  //                         });
                  //                       }
                  //                     },
                  //                     child: Stack(
                  //                       children: [
                  //                         Container(
                  //                           decoration: BoxDecoration(
                  //                               border: Border.all(
                  //                                   color: kLightPurple),
                  //                               borderRadius:
                  //                                   BorderRadius.circular(
                  //                                       kSmallPadding)),
                  //                           child: Column(
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.stretch,
                  //                             children: [
                  //                               Container(
                  //                                 padding:
                  //                                     EdgeInsets.all(kPadding),
                  //                                 width: double.infinity,
                  //                                 alignment: Alignment.center,
                  //                                 decoration: BoxDecoration(
                  //                                   borderRadius:
                  //                                       BorderRadius.only(
                  //                                     topRight: Radius.circular(
                  //                                         kSmallPadding),
                  //                                     topLeft: Radius.circular(
                  //                                         kSmallPadding),
                  //                                   ),
                  //                                   color: kPurpleColor,
                  //                                 ),
                  //                                 child: RichText(
                  //                                   text: TextSpan(
                  //                                     text: "₦",
                  //                                     style: TextStyle(
                  //                                       color: kPrimaryWhite,
                  //                                       fontWeight:
                  //                                           FontWeight.w700,
                  //                                       fontSize: 14,
                  //                                     ),
                  //                                     children: [
                  //                                       TextSpan(
                  //                                         text: "10 cashback",
                  //                                         style: textTheme
                  //                                             .headline4!
                  //                                             .copyWith(
                  //                                           color: kLightPurple,
                  //                                         ),
                  //                                       )
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                               Expanded(
                  //                                 child: Column(
                  //                                   crossAxisAlignment:
                  //                                       CrossAxisAlignment.center,
                  //                                   mainAxisAlignment:
                  //                                       MainAxisAlignment
                  //                                           .spaceEvenly,
                  //                                   children: [
                  //                                     SizedBox(
                  //                                       height: kSmallPadding,
                  //                                     ),
                  //                                     Text(
                  //                                       done
                  //                                           .data!
                  //                                           .mobileOperatorServices![
                  //                                               index]
                  //                                           .serviceName!,
                  //                                       style: textTheme
                  //                                           .subtitle1!
                  //                                           .copyWith(
                  //                                         fontWeight:
                  //                                             FontWeight.w700,
                  //                                       ),
                  //                                       textAlign:
                  //                                           TextAlign.center,
                  //                                     ),
                  //                                     SizedBox(
                  //                                       height: kPadding,
                  //                                     ),
                  //                                     RichText(
                  //                                       text: TextSpan(
                  //                                         text: "₦",
                  //                                         style: TextStyle(
                  //                                           color:
                  //                                               kPrimaryTextColor,
                  //                                           fontWeight:
                  //                                               FontWeight.w500,
                  //                                           fontSize: 14,
                  //                                         ),
                  //                                         children: [
                  //                                           TextSpan(
                  //                                             text: done
                  //                                                 .data!
                  //                                                 .mobileOperatorServices![
                  //                                                     index]
                  //                                                 .servicePrice
                  //                                                 .toString(),
                  //                                             style: textTheme
                  //                                                 .subtitle1!
                  //                                                 .copyWith(
                  //                                               fontWeight:
                  //                                                   FontWeight
                  //                                                       .w500,
                  //                                             ),
                  //                                           )
                  //                                         ],
                  //                                       ),
                  //                                     ),
                  //                                     SizedBox(
                  //                                       height: kSmallPadding,
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                         currentOperatorIndex == index
                  //                             ? Positioned(
                  //                                 bottom: 0,
                  //                                 right: 0,
                  //                                 child: Container(
                  //                                     padding: EdgeInsets.all(3),
                  //                                     decoration: BoxDecoration(
                  //                                         color: kPurpleColor,
                  //                                         shape: BoxShape.circle),
                  //                                     child: Icon(
                  //                                       Icons.check,
                  //                                       color: kPrimaryWhite,
                  //                                       size: 15,
                  //                                     )),
                  //                               )
                  //                             : SizedBox(),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 )
                  //                 .toList(),
                  //           ),
                  //         );
                  //       } else if (done == null ||
                  //           done.data!.mobileOperatorServices!.isEmpty) {
                  //         return Center(
                  //           child: Text(
                  //             "No Sub Category under this category",
                  //             style: textTheme.subtitle1,
                  //           ),
                  //         );
                  //       } else {
                  //         return SizedBox();
                  //       }
                  //     },
                  //     loading: () => SpinKitDemo(),
                  //     error: (val) => Center(
                  //           child: Text(
                  //             "No Sub Category under this category",
                  //             style: textTheme.subtitle1,
                  //           ),
                  //         )),
                  SizedBox(
                    height: kRegularPadding,
                  ),
                  Text(
                    choosePeriod,
                    style: textTheme.headline6,
                  ),
                  SizedBox(
                    height: kSmallPadding,
                  ),
                  inkWell(
                    onTap: () async {
                      final result = await buildShowModalBottomSheet(
                          context, ScheduleModal());
                      if (result != null) {
                        setState(() {
                          frequency = result;
                          topUpDate = "Next top-up date is the next $frequency";
                        });
                      }
                    },
                    child: SelectFrequencyWidget(
                      textTheme: textTheme,
                      frequency: frequency,
                    ),
                  ),
                  SizedBox(
                    height: kRegularPadding,
                  ),
                  frequency == ""
                      ? SizedBox()
                      : NextUpdateContainer(
                          textTheme: textTheme,
                          text: topUpDate,
                        ),
                  SizedBox(
                    height: kMicroPadding,
                  )
                ],
              ),
            ),
            widget.text == "viewSchedule"
                ? Consumer(builder: (context, ref, _) {
                    var _widget = LargeButton(
                        title: save,
                        onPressed: () async {
                          if (frequency == "") {
                            showErrorBar(context, "Please pick your frequency");
                          } else {
                            final result = await buildShowModalBottomSheet(
                              context,
                              TransactionPinContainer(
                                isSchedule: true,
                                isData: false,
                                isCard: false,
                                isFundCard: false,
                                doSchedule: () {
                                  showSuccessBar(context,
                                      "Auto top-up successfully created");
                                },
                              ),
                            );
                            if (result != null) {
                              ref
                                  .read(editScheduleProvider.notifier)
                                  .editSchedule(
                                    scheduleId: widget.id!,
                                    status: "active",
                                    frequency:
                                        frequency.startsWith(RegExp("[0-9:\s]"))
                                            ? frequency.replaceAll(
                                                RegExp("[a-zA-Z:\s]"), "")
                                            : frequency,
                                    transactionPin: result,
                                    error: (val) => showErrorBar(context, val),
                                    then: () => pushTo(
                                      context,
                                      SuccessMessage(
                                        text: dataSuccess,
                                        subText: billScheduleSuccess,
                                        onTap: () {
                                          Navigator.popUntil(
                                            context,
                                            (route) =>
                                                route.settings.name ==
                                                SchedulePayments.routeName,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                            }
                          }
                        });
                    return ref.watch(editScheduleProvider).when(
                        done: (done) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget);
                  })
                : Consumer(builder: (context, ref, _) {
                    var _widget = LargeButton(
                        title: confirm,
                        onPressed: frequency == "" || _mobileOperatorService == null
                            ? () {
                          print("jjj");
                          print(frequency);
                          print(_mobileOperatorService);
                                showErrorBar(context,
                                    "Please pick your Frequency or Plan");
                              }
                            : () async {
                                final result = await buildShowModalBottomSheet(
                                  context,
                                  TransactionPinContainer(
                                    isSchedule: true,
                                    isData: false,
                                    isCard: false,
                                    isFundCard: false,
                                    doSchedule: () {
                                      showSuccessBar(context,
                                          "Auto top-up successfully created");
                                    },
                                  ),
                                );
                                if (result != null) {
                                  ref
                                      .read(scheduleUtilityProvider.notifier)
                                      .scheduleUtility(
                                          category: "data-purchase",
                                          subCategory: billerData!.name!,
                                          frequency: frequency,
                                          customerId: contactController.text,
                                          amount:
                                          _mobileOperatorService!.servicePrice!.toString(),
                                          paymentCode: _mobileOperatorService!.mobileOperatorId!
                                              .toString(),
                                          transactionPin: result,
                                          serviceId:
                                          _mobileOperatorService!.serviceId.toString(),
                                          then: () => pushTo(
                                                context,
                                                SuccessMessage(
                                                  text: dataSuccess,
                                                  subText: billScheduleSuccess,
                                                  onTap: () {
                                                    pushToAndClearStack(
                                                        context,
                                                        TabLayout(
                                                          gottenIndex: 0,
                                                        ));
                                                  },
                                                ),
                                              ),
                                          error: (val) =>
                                              showErrorBar(context, val));
                                }
                              });
                    return ref.watch(scheduleUtilityProvider).when(
                        done: (done) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget);
                  }),
            SizedBox(
              height: kPadding,
            ),
            widget.text == "viewSchedule"
                ? DeleteScheduleText(
                    textTheme: textTheme,
                    onTap: () async {
                      final result = await buildShowModalBottomSheet(
                        context,
                        CommonModal(
                            textTheme: textTheme,
                            buttonText: yesDelete,
                            title: deleteTopUp,
                            subTitle: deleteTopUpSub,
                            color: kLightOrange),
                      );
                      if (result != null) {
                        print(result);
                        if (result == "yes") {
                          final result = await buildShowModalBottomSheet(
                            context,
                            TransactionPinContainer(
                              isSchedule: true,
                              isData: false,
                              isCard: false,
                              isFundCard: false,
                              doSchedule: () {
                                showSuccessBar(
                                    context, "Auto top-up successfully created");
                              },
                            ),
                          );
                          if (result != null) {
                            ref
                                .read(deleteScheduleProvider.notifier)
                                .deleteSchedule(
                                  scheduleId: widget.id!,
                                  transactionPin: result,
                                  error: (val) => showErrorBar(context, val),
                                  then: () => pushTo(
                                    context,
                                    SuccessMessage(
                                      text: dataSuccess,
                                      subText: billDeleteSuccess,
                                      onTap: () {
                                        Navigator.popUntil(
                                          context,
                                          (route) =>
                                              route.settings.name ==
                                              SchedulePayments.routeName,
                                        );
                                      },
                                    ),
                                  ),
                                );
                          }
                        }
                      }
                    },
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
