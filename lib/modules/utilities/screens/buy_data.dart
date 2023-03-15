import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/models/buy_cable_class.dart';
import 'package:pouchers/modules/account/models/ui_models_class.dart';
import 'package:pouchers/modules/schedule_purchase/schedule_widget_constants.dart';
import 'package:pouchers/modules/schedule_purchase/screens/schedule_data_topup.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class BuyData extends ConsumerStatefulWidget {
  static const String routeName = "buyData";
  final bool? isGuest;
  final String? name, email;

  const BuyData({Key? key, this.isGuest, this.name, this.email})
      : super(key: key);

  @override
  ConsumerState<BuyData> createState() => _BuyDataState();
}

class _BuyDataState extends ConsumerState<BuyData>
    with TickerProviderStateMixin {
  TextEditingController contactController = TextEditingController();
  int currentIndex = -1;

  late TabController? _tabController;
  int tabIndex = 0;
  GetUtilitiesData? billerData;
  List<MobileOperatorService> mobileService = [];
  MobileOperatorService? _mobileOperatorService;
  String? threshold;
  String? discountValue;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: category.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getDiscountProvider.notifier).getDiscount(utility: "data");
      ref.read(getUtilitiesProvider.notifier).getUtilities(utility: "data");
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
                                              merchantServiceId:
                                                  billerData!.operatorpublicid!,

                                            );
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
                ref.watch(getDiscountProvider).when(done: (done){
                  if(done != null){
                    threshold = done.data!.threshold ?? "0";
                   discountValue = done.data!.discountValue ?? "0";
                    return SizedBox();
                  }else{
                    return SizedBox();
                  }
                }),
                SizedBox(
                  height: kLargePadding,
                ),
                InkWell(
                  onTap: (mobileService == null)
                      ? null
                      : () async {
                          final result = await buildShowModalBottomSheet(
                              context, DataModal(paymentItem: mobileService, discountValue: discountValue, threshold: threshold));
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
                SizedBox(
                  height: kRegularPadding,
                ),
                widget.isGuest!
                    ? SizedBox()
                    : Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kPadding),
                        child: Scheduling(
                            text: scheduleData,
                            subtext: scheduleDataSub,
                            onTap: () => pushTo(
                                context,
                                ScheduleDataTopUp(
                                  contactNumber: contactController.text,
                                  billerData: billerData,
                                ),
                                settings: RouteSettings(
                                    name: ScheduleDataTopUp.routeName))),
                      ),
              ],
            ),
          ),
          LargeButton(
              title: continueText,
              onPressed: () {
                if (contactController.text.isEmpty) {
                  showErrorBar(context, "Please input the number");
                } else {
                  buildShowModalBottomSheet(
                      context,
                      RechargeSummary(
                        textTheme: textTheme,
                        category: "data-purchase",
                        mobileOperatorServiceId:
                            _mobileOperatorService!.serviceId.toString(),
                        amount: _mobileOperatorService!.servicePrice.toString(),
                        recipientNo: contactController.text,
                        billerName: billerData!.name!,
                        name: widget.name,
                        email: widget.email,
                        isGuest: widget.isGuest!,
                        billerId: billerData!.operatorpublicid!,
                        billerLogo: icon(billerData!.displayName!),
                      ));
                }
              })
        ],
      ),
    );
  }
}
