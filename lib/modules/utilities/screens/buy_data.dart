import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/buy_cable_class.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/schedule_purchase/schedule_widget_constants.dart';
import 'package:Pouchers/modules/schedule_purchase/screens/schedule_data_topup.dart';
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
      widget.isGuest!
          ? null
          :   ref.read(getDiscountProvider.notifier).getDiscount(utility: "data");
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
      child: widget.isGuest! ? dataColumn(textTheme, context) : ListenerPage(child: dataColumn(textTheme, context)),
    );
  }

  Column dataColumn(TextTheme textTheme, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              TextInputNoIcon(
                textTheme: textTheme,
                text: mobileNumber,
                controller: contactController,
                inputType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(11), FilteringTextInputFormatter.digitsOnly],
                icon: inkWell(
                  onTap: () async {
                    final PhoneContact contact =
                        await FlutterContactPicker.pickPhoneContact();
                    setState(() {
                      String phoneReplaced = "";
                      String phoneReplaced1 = "";
                      String phoneReplaced2 = "";

                      phoneReplaced = contact.phoneNumber!.number!
                          .replaceAll("+234", "0");
                      phoneReplaced1 = phoneReplaced.replaceAll("234", "0");
                      phoneReplaced2 = phoneReplaced1.replaceAll(" ", "");

                      contactController.text = phoneReplaced2;
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
                        return  Row(
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
                                      padding: EdgeInsets.all(
                                          kRegularPadding),
                                      height: 70,
                                      width: 70,
                                      margin: EdgeInsets.only(
                                          right: kSmallPadding),
                                      decoration: BoxDecoration(
                                          color: currentIndex == index
                                              ? kLightPurple
                                              : kContainerColor,
                                          shape: BoxShape.circle),
                                      child:

                                      CachedNetworkImage(
                                        imageUrl: element.logoUrl == null
                                            ? ""
                                            : element.logoUrl!,
                                        placeholder: (context, url) =>
                                            Container(
                                              color: Colors.transparent,
                                              child: const Center(
                                                child:
                                                CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  valueColor:
                                                  AlwaysStoppedAnimation<
                                                      Color>(kPrimaryColor),
                                                ),
                                              ),
                                            ),
                                        fit: BoxFit.scaleDown,
                                        errorWidget: (context, url,
                                            error) =>
                                        element.logoUrl != null
                                            ? Image.network(
                                          element.logoUrl!,
                                          fit: BoxFit.fill,
                                          loadingBuilder:
                                              (BuildContext
                                          context,
                                              Widget child,
                                              ImageChunkEvent?
                                              loadingProgress) {
                                            if (loadingProgress ==
                                                null)
                                              return child;
                                            return Center(
                                              child:
                                              CircularProgressIndicator(
                                                value: loadingProgress
                                                    .expectedTotalBytes !=
                                                    null
                                                    ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                        )
                                            : Center(
                                          child: Text(
                                              "${element.displayName}",
                                              style: textTheme
                                                  .headline4!
                                                  .copyWith(
                                                // color: kPrimaryColor,
                                                  fontSize:
                                                  10)),
                                        ),
                                      )
                                  ),
                                  currentIndex == index
                                      ? Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                        padding:
                                        EdgeInsets.all(3),
                                        decoration:
                                        BoxDecoration(
                                            color:
                                            kPurpleColor,
                                            shape: BoxShape
                                                .circle),
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
                              .toList(),
                        );
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
                height: kLargePadding,
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
              if (contactController.text.isEmpty ||  billerData == null || _mobileOperatorService == null) {
                showErrorBar(context, "Please fill all fields");
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
                      threshold: threshold,
                      name: widget.name,
                      email: widget.email,
                      isGuest: widget.isGuest!,
                      billerId: billerData!.operatorpublicid!,
                      billerLogo: icon(billerData!.displayName!),
                    ));
              }
            })
      ],
    );
  }
}
