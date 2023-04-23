import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/copy_code.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/input_formatters.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class FundWallet extends ConsumerWidget {
  static const String routeName = "fundWallet";

  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

  FundWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title:
            "${fundWallet.split(" ").first} ${fundWallet.split(" ").last.substring(0, 1)}${fundWallet.split(" ").last.substring(1)}",
        child: ListenerPage(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: kMacroPadding,
                        horizontal: kMediumPadding,
                      ),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(kRegularPadding),
                      ),
                      child: Column(
                        children: [
                          Text(
                            accNumber,
                            style: textTheme.headline3,
                          ),
                          SizedBox(
                            height: kPadding,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ref.watch(getWalletProvider).data == null
                                    ? ""
                                    : ref
                                            .watch(getWalletProvider)
                                            .data!
                                            .data!
                                            .accountNumber ??
                                        "",
                                style: textTheme.headline1!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                              SizedBox(
                                width: kPadding,
                              ),
                              inkWell(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                      text: ref
                                              .watch(getWalletProvider)
                                              .data!
                                              .data!
                                              .accountNumber ??
                                          ""));
                                  showSuccessBar(context, "Copied");
                                },
                                child: SvgPicture.asset(
                                  AssetPaths.copyIcon,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: kMacroPadding,
                          ),
                          buildFundRow(
                              textTheme,
                              accName,
                              ref.watch(getWalletProvider).data == null
                                  ? "Paga"
                                  : ref
                                          .watch(getWalletProvider)
                                          .data!
                                          .data!
                                          .accountName ??
                                      "Paga"),
                          SizedBox(
                            height: kMediumPadding,
                          ),
                          buildFundRow(
                              textTheme,
                              bankName,
                              ref.watch(getWalletProvider).data == null
                                  ? "Paga"
                                  : ref
                                          .watch(getWalletProvider)
                                          .data!
                                          .data!
                                          .bankProvider == "" ? "Paga" : ref
                                  .watch(getWalletProvider)
                                  .data!
                                  .data!
                                  .bankProvider!.toCapitalized()),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kLargePadding,
                    ),
                    Text(
                      fundAccount,
                      style: textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: kMacroPadding,
                    ),
                    CopyCodeRow(
                      textTheme: textTheme,
                      text: logToApp,
                    ),
                    SizedBox(
                      height: kMediumPadding,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AssetPaths.faIcon),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal! * 4,
                        ),
                        Expanded(
                            child: RichText(
                          text: TextSpan(
                              text: "$select ",
                              style:
                                  textTheme.headline3!.copyWith(color: kIconGrey),
                              children: [
                                TextSpan(
                                  text: "\"Transfer Money\"",
                                  style: textTheme.headline3!.copyWith(
                                    color: kIconGrey,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: orText,
                                  style: textTheme.headline3!
                                      .copyWith(color: kIconGrey),
                                ),
                                TextSpan(
                                  text: "\"Send Money\"",
                                  style: textTheme.headline3!.copyWith(
                                    color: kIconGrey,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: kMediumPadding,
                    ),
                    CopyCodeRow(
                      textTheme: textTheme,
                      text: selectBank,
                    ),
                    SizedBox(
                      height: kMediumPadding,
                    ),
                    ref.watch(getWalletProvider).data == null
                        ? SizedBox()
                        : CopyCodeRow(
                            textTheme: textTheme,
                            text:
                                "$enterAccNo \"${ref.watch(getWalletProvider).data!.data!.accountNumber}\""),
                    SizedBox(
                      height: ref.watch(getWalletProvider).data == null
                          ? 0
                          : kMediumPadding,
                    ),
                    CopyCodeRow(
                      textTheme: textTheme,
                      text: confirmTransPin,
                    ),
                  ],
                ),
              ),
              LargeButton(
                title: completedPayment,
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          ),
        ));
  }

  Row buildFundRow(TextTheme textTheme, String text, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textTheme.headline3!.copyWith(
            color: kIconGrey,
          ),
        ),
        Text(
          subtitle,
          style: textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
