import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/models/ui_models_class.dart';
import 'package:pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:pouchers/modules/utilities/model/utilities_model.dart';
import 'package:pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class RedeemVoucher extends ConsumerStatefulWidget {
  static const String routeName = "redeemVoucher";

  const RedeemVoucher({Key? key}) : super(key: key);

  @override
  ConsumerState<RedeemVoucher> createState() => _RedeemVoucherState();
}

class _RedeemVoucherState extends ConsumerState<RedeemVoucher> {
  Voucher _value = Voucher(
      code: "#12345647",
      amount: "",
      buyerId: "",
      status: "status",
      redeemed: false,
      createdAt: DateTime.now());
  List<Voucher> activeVouchers = [];

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
      title: redeemVouchers,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  setState(() {
                    _value.code = result.code;
                    _value.amount = result.amount;
                  });
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
            height: 10,
          ),
          _value.code == "#12345647"
              ? SizedBox()
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: kContainerColor,
                    borderRadius: BorderRadius.circular(kRegularPadding),
                  ),
                  child: VoucherImage(
                    amount: _value.amount,
                    voucherCode: _value.code,
                  ),
                ),
          SizedBox(
            height: kLargePadding,
          ),
          Consumer(builder: (context, ref, _) {
            ref.listen(redeemVoucherProvider,
                (previous, NotifierState<String> next) {
              if (next.status == NotifierStatus.done) {
                ref.read(getWalletProvider.notifier).getWalletDetails();
                pushReplacementTo(
                  context,
                  VoucherSuccessful(
                    isRedeem: true,
                    message : redeemVoucherSuccessful
                  ),
                );
              } else if (next.status == NotifierStatus.error) {
                showErrorBar(context, next.message ?? "");
              }
            });
            var _widget = LargeButton(
                title: redeemVouchers.substring(0, 14),
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (_value.code != "#12345647") {
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
                      ref.read(redeemVoucherProvider.notifier).redeemVoucher(
                          transactionPin: result, code: _value.code);
                    }
                  } else {
                    showErrorBar(context, "Please select a voucher code");
                  }
                });
            return ref.watch(redeemVoucherProvider).when(
                done: (done) => _widget,
                loading: () => SpinKitDemo(),
                error: (val) => _widget);
          }),
          // LargeButton(
          //     title: redeemVouchers.substring(0, 14),
          //     onPressed: () {
          //       pushTo(
          //           context,
          //           SuccessMessage(
          //             text: dataSuccess,
          //             subText: redeemVoucherSuccessful,
          //             onTap: () {
          //               pushToAndClearStack(
          //                   context,
          //                   TabLayout(
          //                     gottenIndex: 0,
          //                   ));
          //             },
          //           ));
          //     })
        ],
      ),
    );
  }
}
