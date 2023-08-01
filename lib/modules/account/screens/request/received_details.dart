import 'dart:ffi';

import 'package:Pouchers/modules/account/models/profile_model.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/account/screens/request/request_success.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:Pouchers/app/common/credentials.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/common/model.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/account/screens/disable_account/disable_modal.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/make_payment/models/make_payment_model.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/modules/make_payment/screens/make_payment_widgets.dart';
import 'package:Pouchers/modules/make_payment/screens/transfer_success.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/constant/ui_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:Pouchers/utils/input_formatters.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class ReceivedDetails extends ConsumerStatefulWidget {
  static const String routeName = "receivedDetails";
  final Request request;

  const ReceivedDetails({Key? key, required this.request}) : super(key: key);

  @override
  ConsumerState<ReceivedDetails> createState() => _ReceivedDetailsState();
}

class _ReceivedDetailsState extends ConsumerState<ReceivedDetails> {
  List<int> pinPicked = [];
  List<int> decimalPinPicked = [];
  String wholeText = "0";
  String decimalText = "00";
  bool wholeTextString = true;
  FocusNode _focusNode = FocusNode();
  String noteText = addNote;
  TextEditingController noteController = TextEditingController();
  Map<String, dynamic> contactInfo = {};
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  bool? _canCheckBiometrics;
  bool isAuth = false;
  UserCredentials? cred;
  TextEditingController declineController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserCred();
    wholeText = widget.request.amount!.split(".").first;
    decimalText = widget.request.amount!.split(".").last.substring(0, 2);
    pinPicked = widget.request.amount!
        .split(".")
        .first
        .split("")
        .map(int.parse)
        .toList();
    decimalPinPicked = widget.request.amount!
        .split(".")
        .last
        .substring(0, 2)
        .split("")
        .map(int.parse)
        .toList();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  getUserCred() async {
    cred = await getUserCredentials();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    // print(widget.request);
    return InitialPage(
      addSpace: false,
      color: kPrimaryColor,
      titleColor: kPrimaryWhite,
      title: moneyRequest,
      child: ListenerPage(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: kFullPadding,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: kMacroPadding,
                            right: kMacroPadding,
                            top: kMacroPadding,
                            bottom: kSmallPadding),
                        decoration: BoxDecoration(
                            color: kPrimaryWhite,
                            borderRadius: BorderRadius.circular(kSmallPadding)),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.request.profilePicture == null
                                    ? SizedBox()
                                    : ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(116),
                                  child: CachedNetworkImage(
                                    height: 40,
                                    width: 40,
                                    imageUrl:
                                    widget.request.profilePicture ??
                                        "",
                                    placeholder: (context, url) =>
                                        Container(
                                          color: Colors.transparent,
                                          height: 40,
                                          width: 40,
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                              AlwaysStoppedAnimation<
                                                  Color>(kPrimaryColor),
                                            ),
                                          ),
                                        ),
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                    widget.request.profilePicture !=
                                        null
                                        ? Image.network(
                                      widget.request
                                          .profilePicture,
                                      fit: BoxFit.fill,
                                      loadingBuilder: (BuildContext
                                      context,
                                          Widget child,
                                          ImageChunkEvent?
                                          loadingProgress) {
                                        if (loadingProgress ==
                                            null) return child;
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
                                          "${widget.request.firstName!
                                              .substring(0, 1)
                                              .toUpperCase()}${widget.request
                                              .lastName!
                                              .substring(0, 1)
                                              .toUpperCase()}",
                                          style: textTheme
                                              .bodyText2!
                                              .copyWith(
                                              fontSize:
                                              22)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: kRegularPadding,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${widget.request.firstName.toString()
                                            .toTitleCase2()} ${widget.request
                                            .lastName.toString()
                                            .toTitleCase2()} is Requesting",
                                        style: textTheme.headline4!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "₦ ${kPriceFormatter(
                                          double.parse(
                                              widget.request.amount ?? "0"),
                                        )}",
                                        style: textTheme.headline2!.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            fontFamily: null),
                                      ),
                                      SizedBox(
                                        height: kPadding,
                                      ),
                                      widget.request.note == null
                                          ? SizedBox()
                                          : Text(
                                        "Note: \"${widget.request.note ??
                                            ""}\" ",
                                        style: textTheme.headline3,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: kFullPadding,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "₦",
                            style: TextStyle(
                              color: kPrimaryWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 42,
                            ),
                            children: [
                              TextSpan(
                                  text: wholeText,
                                  style: textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: kPrimaryWhite,
                                    fontSize: 42,
                                  )),
                              TextSpan(
                                  text: ".",
                                  style: textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: kBackgroundColor.withOpacity(0.5),
                                    fontSize: 22,
                                  )),
                              TextSpan(
                                  text: decimalText,
                                  style: textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: kBackgroundColor.withOpacity(0.5),
                                    fontSize: 22,
                                  )),
                            ]),
                      ),
                      SizedBox(
                        height: kFullPadding,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: GridView.count(
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.5,
                          children: List.generate(
                            guestNumberDot.length,
                                (index) =>
                                Column(
                                  children: [
                                    inkWell(
                                      onTap: guestNumberDot[index].title ==
                                          "Delete"
                                          ? () {
                                        print(pinPicked);
                                        wholeTextString
                                            ? setState(() {
                                          if (pinPicked.isNotEmpty) {
                                            pinPicked.removeLast();
                                            if (pinPicked.isEmpty) {
                                              wholeText = "0";
                                            } else {
                                              wholeText =
                                                  pinPicked.join("");
                                            }
                                          }
                                        })
                                            : setState(() {
                                          if (decimalPinPicked
                                              .isNotEmpty) {
                                            decimalPinPicked
                                                .removeLast();
                                            if (decimalPinPicked
                                                .isEmpty) {
                                              decimalText = "00";
                                              wholeTextString = true;
                                            } else {
                                              decimalText =
                                                  decimalPinPicked
                                                      .join("");
                                            }
                                          }
                                        });
                                      }
                                          : guestNumberDot[index].title == "."
                                          ? () {
                                        setState(() {
                                          wholeTextString = false;
                                        });
                                      }
                                          : () {
                                        wholeTextString
                                            ? setState(() {
                                          pinPicked.add(
                                            int.parse(
                                                guestNumberDot[
                                                index]
                                                    .title),
                                          );
                                          if (pinPicked.first ==
                                              0) {
                                            pinPicked.removeAt(0);
                                            wholeText = "0";
                                          } else {
                                            wholeText =
                                                pinPicked.join("");
                                          }
                                        })
                                            : setState(() {
                                          if (decimalPinPicked
                                              .length !=
                                              2) {
                                            decimalPinPicked.add(
                                              int.parse(
                                                  guestNumber[index]
                                                      .title),
                                            );
                                            decimalText =
                                                decimalPinPicked
                                                    .join("");
                                          }
                                        });
                                      },
                                      child: guestNumberDot[index].title ==
                                          "Delete"
                                          ? SvgPicture.asset(
                                        AssetPaths.backSpaceIcon,
                                        color: kPrimaryWhite,
                                      )
                                          : Container(
                                        height: 35,
                                        width: 35,
                                        child: Text(
                                          guestNumberDot[index].title,
                                          style: textTheme.headline4!
                                              .copyWith(
                                              color: kPrimaryWhite,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 22),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          ),
                        ),
                      ),
                      Consumer(builder: (context, ref, _) {
                        // ref.listen(moneyRequestStatusProvider, (previous,
                        //     NotifierState<MoneyRequestResponse> next) {
                        //   if (next.status == NotifierStatus.done) {
                        //     // Navigator.pop(context);
                        //
                        //   } else if (next.status == NotifierStatus.error) {
                        //     showErrorBar(
                        //         context, next.message ?? "Try Again Later");
                        //   }
                        // });
                        var _widget = Row(
                          children: [
                            Expanded(
                                child: inkWell(
                                  onTap: () async {
                                    if (wholeText == "0") {
                                      showErrorBar(
                                          context, "Please input an amount");
                                    } else {
                                      buildShowModalBottomSheet(
                                        context,
                                        CommonModal(
                                            textTheme: textTheme,
                                            buttonText: confirm,
                                            title: "Reason for decline",
                                            widget: Column(
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                      text: "You are about to decline the request of ",
                                                      style: TextStyle(
                                                        color: kIconGrey,
                                                        fontWeight: FontWeight
                                                            .normal,
                                                        fontSize: 16,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: " ₦$wholeText.$decimalText",
                                                          style: TextStyle(
                                                            color: kPrimaryTextColor,
                                                            fontWeight: FontWeight
                                                                .w500,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                            text: " from ",
                                                            style:
                                                            textTheme.headline3!
                                                                .copyWith(
                                                              color: kIconGrey,
                                                            )),
                                                        TextSpan(
                                                            text:
                                                            "${widget.request.firstName
                                                                .toString()
                                                                .toTitleCase2()} ${widget.request.lastName
                                                                .toString()
                                                                .toTitleCase2()}.",
                                                            style:
                                                            textTheme.headline4!
                                                                .copyWith(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight
                                                                  .w500,
                                                            )),
                                                      ]),
                                                ),
                                                SizedBox(height: kRegularPadding,),
                                                TextInputNoIcon(
                                                  addSpace: false,
                                                  textTheme: textTheme,
                                                  text: "Add note",
                                                  maxLine: 2,
                                                  hintText: "Type here..",
                                                   controller: declineController,
                                                )
                                              ],
                                            ),
                                            subTitle: "",
                                            color: kPrimaryColor),
                                      ).then((value) async {
                                        if(declineController.text.isNotEmpty){
                                          if (value == "yes") {
                                            if (ref
                                                .watch(biometricProvider)
                                                .isPaymentBiometricActive ==
                                                null ||
                                                !ref
                                                    .watch(biometricProvider)
                                                    .isPaymentBiometricActive!) {
                                              final result =
                                              await buildShowModalBottomSheet(
                                                  context,
                                                  TransactionPinContainer(
                                                    isData: false,
                                                    isCard: false,
                                                    isFundCard: false,
                                                    isTransfer: true,
                                                  ));
                                              if (result != null) {
                                                ref
                                                    .read(moneyRequestStatusProvider
                                                    .notifier)
                                                    .moneyRequestStatus(
                                                    action: "decline",
                                                    amount: double.parse("${wholeText}.${decimalText}"),
                                                    requestId: widget.request.requestId!,
                                                    pin: result,
                                                    note: declineController.text,
                                                    then: (){
                                                      pushTo(
                                                          context,
                                                          RequestSuccess(
                                                            text: "decline",
                                                          ));
                                                    }
                                                );
                                              }
                                            } else {
                                              if (cred?.transactionPin == null ||
                                                  cred?.transactionPin == "") {
                                                final result =
                                                await buildShowModalBottomSheet(
                                                    context,
                                                    TransactionPinContainer(
                                                      isData: false,
                                                      isCard: false,
                                                      isFundCard: false,
                                                      isTransfer: true,
                                                    ));
                                                if (result != null) {
                                                  ref
                                                      .read(moneyRequestStatusProvider
                                                      .notifier)
                                                      .moneyRequestStatus(
                                                      action: "decline",
                                                      note: declineController.text,
                                                      amount: double.parse("${wholeText}.${decimalText}"),
                                                      requestId:
                                                      widget.request.requestId!,
                                                      pin: result,
                                                      then: (){
                                                        pushTo(
                                                            context,
                                                            RequestSuccess(
                                                              text: "decline",
                                                            ));
                                                      }
                                                  );
                                                }
                                              } else
                                                checkBiometric(context);
                                            }
                                          }
                                        }
                                        else{
                                          showErrorBar(context, "Reason is Required");
                                        }

                                      });

                                  }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Decline",
                                      style: textTheme.bodyText2!.copyWith(
                                        fontSize: 16,
                                        fontFamily: "DMSans",
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(
                                        kMediumPadding),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kPrimaryWhite),
                                      borderRadius: kBorderSmallRadius,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: kMediumPadding,
                            ),
                            Expanded(
                                child: inkWell(
                                  onTap: () async {
                                    print(widget.request.requestId);
                                    if (wholeText == "0") {
                                      showErrorBar(
                                          context, "Please input an amount");
                                    } else {
                                      if (ref
                                          .watch(biometricProvider)
                                          .isPaymentBiometricActive ==
                                          null ||
                                          !ref
                                              .watch(biometricProvider)
                                              .isPaymentBiometricActive!) {
                                        final result =
                                        await buildShowModalBottomSheet(
                                            context,
                                            TransactionPinContainer(
                                              isData: false,
                                              isCard: false,
                                              isFundCard: false,
                                              isTransfer: true,
                                            ));
                                        if (result != null) {
                                          ref
                                              .read(moneyRequestStatusProvider
                                              .notifier)
                                              .moneyRequestStatus(
                                            action: "accept",
                                            amount: double.parse("${wholeText}.${decimalText}"),
                                            requestId:
                                            widget.request.requestId!,
                                            pin: result,
                                              then: (){
                                                pushTo(
                                                    context,
                                                    RequestSuccess(
                                                      text: "accept",
                                                    ));
                                              }
                                          );
                                        }
                                      } else {
                                        if (cred?.transactionPin == null ||
                                            cred?.transactionPin == "") {
                                          final result =
                                          await buildShowModalBottomSheet(
                                              context,
                                              TransactionPinContainer(
                                                isData: false,
                                                isCard: false,
                                                isFundCard: false,
                                                isTransfer: true,
                                              ));
                                          if (result != null) {
                                            ref
                                                .read(moneyRequestStatusProvider
                                                .notifier)
                                                .moneyRequestStatus(
                                              action: "accept",
                                              amount: double.parse("${wholeText}.${decimalText}"),
                                              requestId:
                                              widget.request.requestId!,
                                              pin: result,
                                                then: (){
                                                  pushTo(
                                                      context,
                                                      RequestSuccess(
                                                        text: "decline",
                                                      ));
                                                }
                                            );
                                          }
                                        } else
                                          checkBiometric(context);
                                      }
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Approve",
                                      style: textTheme.headline2!.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(
                                        kMediumPadding),
                                    decoration: BoxDecoration(
                                      color: kPrimaryWhite,
                                      borderRadius: kBorderSmallRadius,
                                    ),
                                  ),
                                ))
                          ],
                        );
                        return
                          // widget.isRequestMoney!
                          //   ?
                          ref.watch(moneyRequestStatusProvider).when(
                              done: (val) => _widget,
                              loading: () =>
                                  SpinKitDemo(color: kPrimaryWhite),
                              error: (val) => _widget);
                        // : ref.watch(p2pMoneyProvider).when(
                        //     done: (val) => _widget,
                        //     loading: () =>
                        //         SpinKitDemo(color: kPrimaryWhite),
                        //     error: (val) => _widget);
                      }),
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
    );
  }

  Future<void> checkBiometric(BuildContext context) async {
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      print("error biometrics $e");
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
    print("biometric is available: $canCheckBiometrics");
    List<BiometricType>? availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      print("error enumerate biometrics $e");
    }
    print("following biometrics are available");
    if (availableBiometrics!.isNotEmpty) {
      availableBiometrics.forEach((ab) {
        print("\ttech: $availableBiometrics");
      });
    } else {
      showErrorBar(context,
          "No biometrics available for this device, Please input your credentials");
    }

    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
          localizedReason: 'To Pay',
          options: const AuthenticationOptions(
            biometricOnly: true,
            useErrorDialogs: true,
            stickyAuth: false,
          ),
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
                signInTitle: "Please place your finger on the sensor",
                cancelButton: "Cancel"),
            IOSAuthMessages()
          ]);
    } catch (e) {}

    setState(() {
      isAuth = authenticated ? true : false;
    });
    if (isAuth) {
      ref.read(p2pMoneyProvider.notifier).p2pMoney(
          tag: contactInfo["tag"],
          amount: "$wholeText.$decimalText",
          note: noteText,
          transactionPin: cred!.transactionPin!);
    }
  }
}
