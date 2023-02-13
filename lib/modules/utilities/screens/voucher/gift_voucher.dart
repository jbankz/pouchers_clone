import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/models/ui_models_class.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

import '../../providers/utilities_provider.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(fetchVoucherProvider.notifier).fetchVoucher(status: "active");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: giftVoucher,
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

              validator: (val) {
                if (val != null) {
                  if (val.length < 3){
                    return lessTagValueField;
                  }else{
                    if (_voucherType == onlyEmailText) {
                      if (!isEmail(val)) {
                        return invalidEmail;
                      }
                    } else {
                      if (isEmail(val)) {
                        return invalidTag;
                      }
                    }
                  }

                }
              },
            ),
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
                      message: voucherSuccess,
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
                    if(_formKey.currentState!.validate()){
                      if (_value.code == "#12345647") {
                        showErrorBar(context, "Please select a voucher code");
                      } else {
                        if (giftController.text.isNotEmpty) {
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
                            ref.read(giftVoucherProvider.notifier).giftVoucher(
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
                          showErrorBar(context, "Please input the email or tag");
                        }
                      }
                    }

                  });
              return ref.watch(giftVoucherProvider).when(
                  done: (done) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget);
            }),
            SizedBox(
              height: kMicroPadding,
            ),
            Text(
              sendCodeVia,
              style: textTheme.headline6!.copyWith(color: kIconGrey),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: kPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetPaths.facebookIcon),
                SizedBox(
                  width: kSmallPadding,
                ),
                SvgPicture.asset(AssetPaths.whatsappIcon),
                SizedBox(
                  width: kSmallPadding,
                ),
                SvgPicture.asset(AssetPaths.instagramIcon),
              ],
            )
          ],
        ),
      ),
    );
  }
}
