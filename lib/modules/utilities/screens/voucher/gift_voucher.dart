import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:Pouchers/app/common/credentials.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/common/model.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/modules/utilities/model/utilities_model.dart';
import 'package:Pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/input_formatters.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

import '../../providers/utilities_provider.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';


class GiftVoucher extends ConsumerStatefulWidget {
  static const String routeName = "giftVoucher";

  const GiftVoucher({Key? key}) : super(key: key);

  @override
  ConsumerState<GiftVoucher> createState() => _GiftVoucherState();
}

class _GiftVoucherState extends ConsumerState<GiftVoucher> {
  Voucher _value = Voucher(
      code: "#12345647",
      amount: "",
      buyerId: "",
      status: "status",
      redeemed: false,
      createdAt: DateTime.now());
  String _voucherType = onlyEmailText;
  List<Voucher> activeVouchers = [];
  TextEditingController giftController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? lastInputValue;

  bool? _canCheckBiometrics;
  bool isAuth = false;
  UserCredentials? cred;




  @override
  void initState() {
    super.initState();
    getUserCred();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(fetchVoucherProvider.notifier).fetchVoucher(status: "active");
    });
  }

  getUserCred() async {
    cred = await getUserCredentials();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: giftVoucher,
      child: ListenerPage(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                enterVoucherCode,
                style: textTheme.headline6,
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              inkWell(
                onTap: () async {
                  final result = await buildShowModalBottomSheet(
                      context,
                      VoucherModal(
                        voucherItems: activeVouchers,
                      ));
                  if (result != null) {
                    setState(() => _value.code = result.code);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(kRegularPadding),
                  decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(kSmallPadding)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _value.code,
                        style: textTheme.headline2!.copyWith(
                            color: _value.code != "#12345647"
                                ? kPrimaryTextColor
                                : kLightColor200),
                      ),
                      Consumer(
                        builder: (context, ref, _) {
                          ref.listen(fetchVoucherProvider,
                              (previous, NotifierState<GetVoucherResponse> next) {
                            if (next.status == NotifierStatus.done) {
                              next.data!.data!.vouchers.forEach((element) {
                                activeVouchers.add(element);
                              });
                            }
                          });
                          var _widget = Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: kSecondaryTextColor,
                          );
                          return ref.watch(fetchVoucherProvider).when(
                                done: (data) => _widget,
                                loading: () => SpinKitDemo(
                                  size: 25,
                                ),
                                error: (val) => _widget,
                              );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: kMicroPadding,
              ),
              Row(
                children: [
                  inkWell(
                    onTap: () {
                      setState(() => _voucherType = onlyEmailText);
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _voucherType == onlyEmailText
                                  ? kPrimaryColor
                                  : kSecondaryTextColor,
                              width: 1.5,
                            ),
                          ),
                          child: _voucherType == onlyEmailText
                              ? Container(
                                  height: kSmallPadding,
                                  width: kSmallPadding,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPrimaryColor,
                                  ),
                                )
                              : SizedBox(
                                  height: kSmallPadding,
                                  width: kSmallPadding,
                                ),
                        ),
                        SizedBox(
                          width: kSmallPadding,
                        ),
                        Text(
                          onlyEmailText,
                          style: textTheme.headline3!
                              .copyWith(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: kRegularPadding,
                  ),
                  inkWell(
                    onTap: () {
                      setState(() => _voucherType = poucherTag);
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _voucherType == poucherTag
                                  ? kPrimaryColor
                                  : kSecondaryTextColor,
                              width: 1.5,
                            ),
                          ),
                          child: _voucherType == poucherTag
                              ? Container(
                                  height: kSmallPadding,
                                  width: kSmallPadding,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPrimaryColor,
                                  ),
                                )
                              : SizedBox(
                                  height: kSmallPadding,
                                  width: kSmallPadding,
                                ),
                        ),
                        SizedBox(
                          width: kSmallPadding,
                        ),
                        Text(
                          poucherTag,
                          style: textTheme.headline3!
                              .copyWith(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              TextInputNoIcon(
                textTheme: textTheme,
                widget: SizedBox(),
                hintText:
                    _voucherType == onlyEmailText ? enterEmail : enterPoucherTag,
                controller: giftController,
                suffixIcon: ref.watch(getContactByPoucherTagProvider).when(
                    done: (done) {
                      return SizedBox();
                    },
                    error: (val) => SizedBox(),
                    loading: () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(giftController.text),
                            SpinKitDemo(
                              size: 25,
                            ),
                          ],
                        )),
                onChanged: (inputValue) {
                  if (_voucherType != onlyEmailText) {
                    if (inputValue!.isNotEmpty) {
                      if (lastInputValue != inputValue) {
                        lastInputValue = inputValue;
                        ref
                            .read(getContactByPoucherTagProvider.notifier)
                            .getContactByPoucherTag(poucherTag: inputValue);
                      }
                    }
                  }
                },
                validator: (val) {
                  if (val != null) {
                    if (_voucherType == onlyEmailText) {
                      if (!isEmail(val)) {
                        return invalidEmail;
                      }
                    } else {
                      if (isEmail(val)) {
                        return invalidTag;
                      }
                    }
                    // }
                  }
                },
              ),
              ref.watch(getContactByPoucherTagProvider).when(
                  error: (val) => Text(
                        val ?? "",
                        style: textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                  done: (done) {
                    if (done != null) {
                      return Row(
                        children: [
                          done["profilePicture"] == null
                              ? SizedBox()
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(116),
                                  child: CachedNetworkImage(
                                    height: 40,
                                    width: 40,
                                    imageUrl: done["profilePicture"] ?? "",
                                    placeholder: (context, url) => Container(
                                      color: Colors.transparent,
                                      height: 40,
                                      width: 40,
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  kPrimaryColor),
                                        ),
                                      ),
                                    ),
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        done["profilePicture"] != null
                                            ? Image.network(
                                                done["profilePicture"],
                                                fit: BoxFit.fill,
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (loadingProgress == null)
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
                                                    "${done["firstName"]!.substring(0, 1).toUpperCase()}${done["lastName"]!.substring(0, 1).toUpperCase()}",
                                                    style: textTheme.bodyText2!
                                                        .copyWith(fontSize: 22)),
                                              ),
                                  ),
                                ),
                          SizedBox(
                            width: kRegularPadding,
                          ),
                          Expanded(
                            child: Text(
                              "${done["firstName"].toString().toTitleCase2()} ${done["lastName"].toString().toTitleCase2()}",
                              style: textTheme.headline4!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(kPadding),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: kPrimaryColor),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: kPrimaryWhite,
                            ),
                          )
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
              SizedBox(
                height: kLargePadding,
              ),
              Consumer(builder: (context, ref, _) {
                ref.listen(giftVoucherProvider,
                    (previous, NotifierState<String> next) {
                  if (next.status == NotifierStatus.done) {
                    pushReplacementTo(
                      context,
                      VoucherSuccessful(
                        isGift: true,
                        message: giftVoucherSuccessful,
                      ),
                    );
                  } else if (next.status == NotifierStatus.error) {
                    showErrorBar(context, next.message ?? "");
                  }
                });
                var _widget = LargeButton(
                    title: giftVoucher.substring(0, 12),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        if (_value.code == "#12345647") {
                          showErrorBar(context, "Please select a voucher code");
                        } else {
                          if (giftController.text.isNotEmpty) {
                            if (ref.watch(biometricProvider).isPaymentBiometricActive == null || !ref.watch(biometricProvider).isPaymentBiometricActive!) {
                              var result = await buildShowModalBottomSheet(
                                context,
                                TransactionPinContainer(
                                  isData: false,
                                  isCard: false,
                                  isFundCard: false,
                                  isGiftVoucher: true,
                                ),
                              );
                              if (result != null) {
                                ref
                                    .read(giftVoucherProvider.notifier)
                                    .giftVoucher(
                                        email: _voucherType == onlyEmailText
                                            ? giftController.text
                                            : "",
                                        tag: _voucherType == poucherTag
                                            ? giftController.text
                                            : "",
                                        transactionPin: result,
                                        code: _value.code);
                              }
                            } else {
                              if(cred?.transactionPin == null || cred?.transactionPin == ""){
                                var result = await buildShowModalBottomSheet(
                                  context,
                                  TransactionPinContainer(
                                    isData: false,
                                    isCard: false,
                                    isFundCard: false,
                                    isGiftVoucher: true,
                                  ),
                                );
                                if (result != null) {
                                  ref
                                      .read(giftVoucherProvider.notifier)
                                      .giftVoucher(
                                      email: _voucherType == onlyEmailText
                                          ? giftController.text
                                          : "",
                                      tag: _voucherType == poucherTag
                                          ? giftController.text
                                          : "",
                                      transactionPin: result,
                                      code: _value.code);
                                }
                              }
                             else checkBiometric(context);
                            }
                          } else {
                            showErrorBar(
                                context, "Please input the email or tag");
                          }
                        }
                      }
                    });
                return ref.watch(giftVoucherProvider).when(
                    done: (done) => _widget,
                    loading: () => SpinKitDemo(),
                    error: (val) => _widget);
              }),
              // SizedBox(
              //   height: kMicroPadding,
              // ),
              // Text(
              //   sendCodeVia,
              //   style: textTheme.headline6!.copyWith(color: kIconGrey),
              //   textAlign: TextAlign.center,
              // ),
              // SizedBox(
              //   height: kPadding,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SvgPicture.asset(AssetPaths.facebookIcon),
              //     SizedBox(
              //       width: kSmallPadding,
              //     ),
              //     SvgPicture.asset(AssetPaths.whatsappIcon),
              //     SizedBox(
              //       width: kSmallPadding,
              //     ),
              //     SvgPicture.asset(AssetPaths.instagramIcon),
              //   ],
              // )
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
      ref
          .read(giftVoucherProvider.notifier)
          .giftVoucher(
          email: _voucherType == onlyEmailText
              ? giftController.text
              : "",
          tag: _voucherType == poucherTag
              ? giftController.text
              : "",
          transactionPin: cred!.transactionPin!,
          code: _value.code);

    }
  }

}
