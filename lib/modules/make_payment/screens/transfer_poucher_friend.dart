import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/core/manager/biometric_manager.dart';
import 'package:Pouchers/app/helpers/session_manager.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:Pouchers/ui/features/profile/presentation/views/biometric/dao/biometric_dao.dart';
import 'package:Pouchers/utils/extension.dart';
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

import '../../../ui/features/profile/domain/model/user.dart';
import '../../../ui/features/profile/presentation/views/biometric/notifier/module.dart';

class TransferPoucherFriend extends ConsumerStatefulWidget {
  static const String routeName = "transferPoucherFriend";
  final bool? isRequestMoney;

  const TransferPoucherFriend({Key? key, this.isRequestMoney})
      : super(key: key);

  @override
  ConsumerState<TransferPoucherFriend> createState() =>
      _TransferPoucherFriendState();
}

class _TransferPoucherFriendState extends ConsumerState<TransferPoucherFriend> {
  List<int> pinPicked = [];
  List<int> decimalPinPicked = [];
  String wholeText = "0";
  String decimalText = "00";
  bool wholeTextString = true;
  FocusNode _focusNode = FocusNode();
  bool visible = false;
  String noteText = addNote;
  TextEditingController noteController = TextEditingController();
  Map<String, dynamic> contactInfo = {};
  // HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  User userProfile = userDao.user;
  bool? _canCheckBiometrics;
  bool isAuth = false;
  UserCredentials? cred;

  @override
  void initState() {
    super.initState();
    getUserCred();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  getUserCred() async {
    cred = await getUserCredentials();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        addSpace: false,
        color: kPrimaryColor,
        titleColor: kPrimaryWhite,
        title: widget.isRequestMoney! ? requestMoney : transferMoney,
        child: ValueListenableBuilder<Box>(
            valueListenable: walletDao.getListenable(),
            builder: (_, box, __) {
              final wallet = walletDao.retrieve(box);
              return ListenerPage(
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kMediumPadding),
                          child: ListView(
                            children: [
                              const SizedBox(height: kSmallPadding),
                              widget.isRequestMoney!
                                  ? const SizedBox()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                          Container(
                                              decoration: const BoxDecoration(
                                                  color: kLightPurple,
                                                  shape: BoxShape.circle),
                                              padding: const EdgeInsets.all(
                                                  kSmallPadding),
                                              child: SvgPicture.asset(
                                                  AssetPaths.walletIcon,
                                                  height: kRegularPadding,
                                                  width: kRegularPadding)),
                                          Text(
                                            "  $balance - ",
                                            style:
                                                textTheme.subtitle2!.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: kLightPurple,
                                              fontFamily: "DMSans",
                                            ),
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  // text: "₦",
                                                  style: const TextStyle(
                                                      color: kLightPurple,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                  children: [
                                                TextSpan(
                                                    // text: ref
                                                    //             .watch(
                                                    //                 getWalletProvider)
                                                    //             .data ==
                                                    //         null
                                                    //     ? "0.00"
                                                    //     : kPriceFormatter(
                                                    //         double.parse(ref
                                                    //                 .watch(
                                                    //                     getWalletProvider)
                                                    //                 .data!
                                                    //                 .data!
                                                    //                 .balance ??
                                                    //             "0.00"),

                                                    // ),
                                                    text: num.parse(
                                                            wallet.balance ??
                                                                '0')
                                                        .toNaira,
                                                    style: textTheme.subtitle2!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: kLightPurple,
                                                            fontFamily:
                                                                "DMSans"))
                                              ]))
                                        ]),
                              const SizedBox(height: kMicroPadding),
                              inkWell(
                                onTap: () async {
                                  final Map<String, dynamic> result =
                                      await buildShowModalBottomSheet(
                                    context,
                                    TransferModal(
                                        isRequest: widget.isRequestMoney!),
                                  );
                                  setState(() {
                                    contactInfo = result;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: kMacroPadding,
                                      right: kMacroPadding,
                                      top: kMacroPadding,
                                      bottom: kSmallPadding),
                                  decoration: BoxDecoration(
                                      color: kPrimaryWhite,
                                      borderRadius:
                                          BorderRadius.circular(kSmallPadding)),
                                  child: Column(
                                    children: [
                                      contactInfo["phoneNumber"] == null
                                          ? Row(
                                              children: [
                                                Text(
                                                  "@ ",
                                                  style: textTheme.subtitle1!
                                                      .copyWith(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    widget.isRequestMoney!
                                                        ? " $selectRecipient"
                                                        : " $enterPoucherTag",
                                                    style: textTheme.subtitle1!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: widget
                                                                    .isRequestMoney!
                                                                ? kPrimaryTextColor
                                                                : kIconGrey),
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                      kPadding),
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: kPrimaryColor),
                                                  child: const Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 12,
                                                    color: kPrimaryWhite,
                                                  ),
                                                )
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                contactInfo["profilePicture"] ==
                                                        null
                                                    ? const SizedBox()
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(116),
                                                        child:
                                                            CachedNetworkImage(
                                                          height: 40,
                                                          width: 40,
                                                          imageUrl: contactInfo[
                                                                  "profilePicture"] ??
                                                              "",
                                                          placeholder:
                                                              (context, url) =>
                                                                  Container(
                                                            color: Colors
                                                                .transparent,
                                                            height: 40,
                                                            width: 40,
                                                            child: const Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                strokeWidth: 2,
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                            Color>(
                                                                        kPrimaryColor),
                                                              ),
                                                            ),
                                                          ),
                                                          fit: BoxFit.cover,
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              contactInfo["profilePicture"] !=
                                                                      null
                                                                  ? Image
                                                                      .network(
                                                                      contactInfo[
                                                                          "profilePicture"],
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      loadingBuilder: (BuildContext context,
                                                                          Widget
                                                                              child,
                                                                          ImageChunkEvent?
                                                                              loadingProgress) {
                                                                        if (loadingProgress ==
                                                                            null)
                                                                          return child;
                                                                        return Center(
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            value: loadingProgress.expectedTotalBytes != null
                                                                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                                                : null,
                                                                          ),
                                                                        );
                                                                      },
                                                                    )
                                                                  : Center(
                                                                      child: Text(
                                                                          "${contactInfo["firstName"]!.substring(0, 1).toUpperCase()}${contactInfo["lastName"]!.substring(0, 1).toUpperCase()}",
                                                                          style: textTheme
                                                                              .bodyText2!
                                                                              .copyWith(fontSize: 22)),
                                                                    ),
                                                        ),
                                                      ),
                                                const SizedBox(
                                                  width: kRegularPadding,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "${contactInfo["firstName"].toString().toTitleCase2()} ${contactInfo["lastName"].toString().toTitleCase2()}",
                                                    style: textTheme.headline4!
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                      kPadding),
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: kPrimaryColor),
                                                  child: const Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 12,
                                                    color: kPrimaryWhite,
                                                  ),
                                                )
                                              ],
                                            ),
                                      const SizedBox(
                                        height: kSmallPadding,
                                      ),
                                      inkWell(
                                        onTap: () {
                                          setState(() {
                                            visible = true;
                                            noteText = "";
                                          });
                                          _focusNode.requestFocus();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "$noteText ",
                                              style: textTheme.headline3,
                                            ),
                                            const Icon(Icons.arrow_forward)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: kFullPadding,
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: "₦",
                                    style: const TextStyle(
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
                                            color: kBackgroundColor
                                                .withOpacity(0.5),
                                            fontSize: 22,
                                          )),
                                      TextSpan(
                                          text: decimalText,
                                          style: textTheme.headline3!.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: kBackgroundColor
                                                .withOpacity(0.5),
                                            fontSize: 22,
                                          )),
                                    ]),
                              ),
                              ref.watch(getWalletProvider).data == null ||
                                      widget.isRequestMoney!
                                  ? const SizedBox()
                                  : double.parse(wholeText) >
                                          double.parse(ref
                                                  .watch(getWalletProvider)
                                                  .data!
                                                  .data!
                                                  .balance ??
                                              "0")
                                      ? Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                insufficient,
                                                style: textTheme.headline4!
                                                    .copyWith(
                                                        color: kColorOrange),
                                              ),
                                              const SizedBox(
                                                height: kRegularPadding,
                                              )
                                            ],
                                          ),
                                        )
                                      : const SizedBox(),
                              const SizedBox(
                                height: kFullPadding,
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: GridView.count(
                                  primary: false,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1.5,
                                  children: List.generate(
                                    guestNumberDot.length,
                                    (index) => Column(
                                      children: [
                                        inkWell(
                                          onTap: guestNumberDot[index].title ==
                                                  "Delete"
                                              ? () {
                                                  wholeTextString
                                                      ? setState(() {
                                                          if (pinPicked
                                                              .isNotEmpty) {
                                                            pinPicked
                                                                .removeLast();
                                                            if (pinPicked
                                                                .isEmpty) {
                                                              wholeText = "0";
                                                            } else {
                                                              wholeText =
                                                                  pinPicked
                                                                      .join("");
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
                                                              decimalText =
                                                                  "00";
                                                              wholeTextString =
                                                                  true;
                                                            } else {
                                                              decimalText =
                                                                  decimalPinPicked
                                                                      .join("");
                                                            }
                                                          }
                                                        });
                                                }
                                              : guestNumberDot[index].title ==
                                                      "."
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
                                                              if (pinPicked
                                                                      .first ==
                                                                  0) {
                                                                pinPicked
                                                                    .removeAt(
                                                                        0);
                                                                wholeText = "0";
                                                              } else {
                                                                wholeText =
                                                                    pinPicked
                                                                        .join(
                                                                            "");
                                                              }
                                                            })
                                                          : setState(() {
                                                              if (decimalPinPicked
                                                                      .length !=
                                                                  2) {
                                                                decimalPinPicked
                                                                    .add(
                                                                  int.parse(guestNumber[
                                                                          index]
                                                                      .title),
                                                                );
                                                                decimalText =
                                                                    decimalPinPicked
                                                                        .join(
                                                                            "");
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
                                                            color:
                                                                kPrimaryWhite,
                                                            fontWeight:
                                                                FontWeight.w700,
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
                                widget.isRequestMoney!
                                    ? ref.listen(requestMoneyProvider,
                                        (previous,
                                            NotifierState<RequestResponse>
                                                next) {
                                        if (next.status ==
                                            NotifierStatus.done) {
                                          pushTo(
                                              context,
                                              const TransferSuccess(
                                                isRequest: true,
                                                text: "tag",
                                              ));
                                        } else if (next.status ==
                                            NotifierStatus.error) {
                                          showErrorBar(
                                              context,
                                              next.message ??
                                                  "Try Again Later");
                                        }
                                      })
                                    : ref.listen(p2pMoneyProvider, (previous,
                                        NotifierState<P2PResponse> next) {
                                        if (next.status ==
                                            NotifierStatus.done) {
                                          pushTo(
                                              context,
                                              TransferSuccess(
                                                isRequest: false,
                                                text: "tag",
                                                response: next.data,
                                                typeOfTransfer: "p2p",
                                                tag: next.data!.data!
                                                        .receiverTag ??
                                                    "",
                                                amount:
                                                    "$wholeText.$decimalText",
                                                note: noteText,
                                                transactionId: next
                                                    .data!.data!.transactionId,
                                                senderName:
                                                    next.data!.data!.senderName,
                                                status: next.data!.data!.status,
                                                beneficiary:
                                                    "${contactInfo["firstName"]!.substring(0, 1).toUpperCase()}${contactInfo["firstName"]!.substring(1).toLowerCase()} ${contactInfo["lastName"]!.substring(0, 1).toUpperCase()}${contactInfo["lastName"]!.substring(1).toLowerCase()}",
                                              ));
                                        } else if (next.status ==
                                            NotifierStatus.error) {
                                          print(
                                              "${contactInfo["firstName"]!.substring(0, 1).toUpperCase()}${contactInfo["firstName"]!.substring(1).toLowerCase()}${contactInfo["lastName"]!.substring(0, 1).toUpperCase()}${contactInfo["lastName"]!.substring(1).toLowerCase()}");

                                          showErrorBar(
                                              context,
                                              next.message ??
                                                  "Try Again Later");
                                        }
                                      });
                                final _widget = LargeButton(
                                  disableColor: kPurpleDeep,
                                  title: widget.isRequestMoney!
                                      ? request
                                      : transfer.substring(0, 8),
                                  onPressed: () {
                                    if (wholeText == "0")
                                      showErrorBar(
                                          context, "Please input an amount");
                                    else if (contactInfo.isEmpty)
                                      showErrorBar(context,
                                          "Please choose a user to request from");
                                    else if ((double.parse(wholeText) >
                                            double.parse(
                                                wallet.balance ?? "0")) &&
                                        // double.parse(ref
                                        //         .watch(getWalletProvider)
                                        //         .data!
                                        //         .data!
                                        //         .balance ??
                                        //     "0")) &&
                                        !widget.isRequestMoney!) {
                                      showErrorBar(context, insufficient);
                                    } else
                                      buildShowModalBottomSheet(
                                        context,
                                        CommonModal(
                                            textTheme: textTheme,
                                            buttonText: confirm,
                                            title: pleaseConfirm,
                                            widget: RichText(
                                              text: TextSpan(
                                                  text: widget.isRequestMoney!
                                                      ? aboutRequest
                                                      : aboutTransfer,
                                                  style: const TextStyle(
                                                    color: kIconGrey,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          " ₦$wholeText.$decimalText",
                                                      style: const TextStyle(
                                                        color:
                                                            kPrimaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                        text: " to ",
                                                        style: textTheme
                                                            .headline3!
                                                            .copyWith(
                                                          color: kIconGrey,
                                                        )),
                                                    TextSpan(
                                                        text:
                                                            "${contactInfo["firstName"].toString().toTitleCase2()} ${contactInfo["lastName"].toString().toTitleCase2()}",
                                                        style: textTheme
                                                            .headline4!
                                                            .copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                  ]),
                                            ),
                                            subTitle: "",
                                            color: kPrimaryColor),
                                      ).then((value) async {
                                        if (value == "yes") {
                                          if (widget.isRequestMoney!)
                                            ref
                                                .read(requestMoneyProvider
                                                    .notifier)
                                                .requestMoney(
                                                  tag: contactInfo["tag"],
                                                  amount:
                                                      "$wholeText.$decimalText",
                                                  note: noteText,
                                                );
                                          else {
                                            if (ref
                                                        .watch(
                                                            biometricProvider)
                                                        .isPaymentBiometricActive ==
                                                    null ||
                                                !ref
                                                    .watch(biometricProvider)
                                                    .isPaymentBiometricActive!) {
                                              final result =
                                                  await buildShowModalBottomSheet(
                                                      context,
                                                      const TransactionPinContainer(
                                                        isData: false,
                                                        isCard: false,
                                                        isFundCard: false,
                                                        isTransfer: true,
                                                      ));
                                              if (result != null) {
                                                ref
                                                    .read(p2pMoneyProvider
                                                        .notifier)
                                                    .p2pMoney(
                                                        tag: contactInfo["tag"],
                                                        amount:
                                                            "$wholeText.$decimalText",
                                                        note: noteText,
                                                        transactionPin: result);
                                              }
                                            } else {
                                              if (cred?.transactionPin ==
                                                      null ||
                                                  cred?.transactionPin == "") {
                                                final result =
                                                    await buildShowModalBottomSheet(
                                                        context,
                                                        const TransactionPinContainer(
                                                          isData: false,
                                                          isCard: false,
                                                          isFundCard: false,
                                                          isTransfer: true,
                                                        ));
                                                if (result != null) {
                                                  ref
                                                      .read(p2pMoneyProvider
                                                          .notifier)
                                                      .p2pMoney(
                                                          tag: contactInfo[
                                                              "tag"],
                                                          amount:
                                                              "$wholeText.$decimalText",
                                                          note: noteText,
                                                          transactionPin:
                                                              result);
                                                }
                                              } else
                                                checkBiometric();
                                            }
                                          }
                                        }
                                      });
                                  },
                                );
                                return widget.isRequestMoney!
                                    ? ref.watch(requestMoneyProvider).when(
                                        done: (val) => _widget,
                                        loading: () => const SpinKitDemo(
                                            color: kPrimaryWhite),
                                        error: (val) => _widget)
                                    : ref.watch(p2pMoneyProvider).when(
                                        done: (val) => _widget,
                                        loading: () => const SpinKitDemo(
                                            color: kPrimaryWhite),
                                        error: (val) => _widget);
                              }),
                              const SizedBox(
                                height: kSmallPadding,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visible,
                        child: Container(
                          padding: const EdgeInsets.all(kMediumPadding),
                          decoration: const BoxDecoration(
                              color: kPrimaryWhite,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(kSmallPadding),
                                  topRight: Radius.circular(kSmallPadding))),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: iconList
                                      .map(
                                        (e) => inkWell(
                                          onTap: () {
                                            setState(() {
                                              noteController.text = e;
                                            });
                                            noteController.selection =
                                                TextSelection.fromPosition(
                                                    TextPosition(
                                                        offset: noteController
                                                            .text.length));
                                          },
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  color: kLightPurple,
                                                  shape: BoxShape.circle),
                                              padding: const EdgeInsets.all(
                                                  kSmallPadding),
                                              child: Text(e)),
                                        ),
                                      )
                                      .toList()),
                              const SizedBox(
                                height: kRegularPadding,
                              ),
                              TextInputNoIcon(
                                textTheme: textTheme,
                                focusNode: _focusNode,
                                widget: const SizedBox(),
                                addSpace: false,
                                controller: noteController,
                                suffixIcon: inkWell(
                                  onTap: () {
                                    setState(() {
                                      visible = false;
                                      noteText = noteController.text;
                                      noteController.clear();
                                    });
                                    _focusNode.unfocus();
                                  },
                                  child: Text(
                                    send,
                                    style: textTheme.headline2!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  Future<void> checkBiometric() async {
    if (biometricDao.pay) {
      final String pin =
          await ref.read(biometricNotifier.notifier).retrieveTransactionPin();

      ref.read(biometricNotifier.notifier).authenticateUser(
          callbackAction: () => ref.read(p2pMoneyProvider.notifier).p2pMoney(
              tag: contactInfo["tag"],
              amount: "$wholeText.$decimalText",
              note: noteText,
              transactionPin: pin));
    }

    // final LocalAuthentication auth = LocalAuthentication();
    // bool canCheckBiometrics = false;
    // try {
    //   canCheckBiometrics = await auth.canCheckBiometrics;
    // } catch (e) {
    //   print("error biometrics $e");
    // }
    // if (!mounted) return;
    // setState(() {
    //   _canCheckBiometrics = canCheckBiometrics;
    // });
    // print("biometric is available: $canCheckBiometrics");
    // List<BiometricType>? availableBiometrics;
    // try {
    //   availableBiometrics = await auth.getAvailableBiometrics();
    // } catch (e) {
    //   print("error enumerate biometrics $e");
    // }
    // print("following biometrics are available");
    // if (availableBiometrics!.isNotEmpty) {
    //   availableBiometrics.forEach((ab) {
    //     print("\ttech: $availableBiometrics");
    //   });
    // } else {
    //   showErrorBar(context,
    //       "No biometrics available for this device, Please input your credentials");
    // }

    // bool authenticated = false;

    // try {
    //   authenticated = await auth.authenticate(
    //       localizedReason: 'To Pay',
    //       options: const AuthenticationOptions(
    //         biometricOnly: true,
    //         useErrorDialogs: true,
    //         stickyAuth: false,
    //       ),
    //       authMessages: const <AuthMessages>[
    //         AndroidAuthMessages(
    //             signInTitle: "Please place your finger on the sensor",
    //             cancelButton: "Cancel"),
    //         IOSAuthMessages()
    //       ]);
    // } catch (e) {}

    // setState(() {
    //   isAuth = authenticated ? true : false;
    // });
    // if (isAuth) {
    //   ref.read(p2pMoneyProvider.notifier).p2pMoney(
    //       tag: contactInfo["tag"],
    //       amount: "$wholeText.$decimalText",
    //       note: noteText,
    //       transactionPin: cred!.transactionPin!);
    // }
  }
}
