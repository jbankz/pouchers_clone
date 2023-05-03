import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/copy_code.dart';
import 'package:Pouchers/modules/cards/providers/cards_providers.dart';
import 'package:Pouchers/modules/cards/screens/card_home.dart';
import 'package:Pouchers/modules/cards/screens/card_widgets.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class CreateCard extends ConsumerStatefulWidget {
  static const String routeName = "createCard";

  const CreateCard({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateCard> createState() => _CreateCardState();
}

class _CreateCardState extends ConsumerState<CreateCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getAllFeesProvider.notifier).getAllFees(amount: 0);
      ref.read(getAllVirtualCardProvider.notifier).getAllVirtualCards();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var _widget = Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(),
                child:
                Stack(
                  children: [
                    Positioned(
                      child: SvgPicture.asset(AssetPaths.nairaCardIcon),
                      top: 50,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SvgPicture.asset(AssetPaths.dollarCardIcon),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kMacroPadding,
              ),
              Text(
                creationFee,
                style: textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: kFullPadding,
              ),
              Padding(
                padding: EdgeInsets.only(left: kSmallPadding),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AssetPaths.faIcon),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal! * 4,
                        ),
                        Expanded(
                            child: RichText(
                          text: TextSpan(
                              text: instantPay,
                              style: textTheme.headline4!.copyWith(
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: nairaText,
                                  style: textTheme.headline4!.copyWith(
                                      fontSize: 16, color: kColorGreen),
                                ),
                                TextSpan(
                                  text: orText,
                                  style: textTheme.headline4!.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: dollarText,
                                  style: textTheme.headline4!.copyWith(
                                      fontSize: 16, color: kSecondaryPurple),
                                ),
                                TextSpan(
                                  text: virtualCard,
                                  style: textTheme.headline4!.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ]),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: kSmallPadding,
                    ),
                    CopyCodeRow(
                      textTheme: textTheme,
                      text: payOnline,
                      color: kPrimaryTextColor,
                    ),
                    SizedBox(
                      height: kSmallPadding,
                    ),
                    CopyCodeRow(
                      textTheme: textTheme,
                      text: easyPay,
                      color: kPrimaryTextColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kSmallPadding,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: kSmallPadding),
          child: LargeButton(
            title: createVirtualCard,
            onPressed: () {
              buildShowModalBottomSheet(
                context,
                CreateCardWidget(
                  textTheme: textTheme,
                  cardType: "",
                ),
              );
            },
          ),
        )
      ],
    );
    return Container(
        padding: EdgeInsets.only(
            left: kMediumPadding, right: kMediumPadding, top: kSmallPadding),
        child: ref.watch(getAllVirtualCardProvider).when(
            done: (card) {
              if (card != null) {
                if (card.data!.isEmpty || card.data == null) {
                  return _widget;
                } else
                  return Column(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myCard,
                              style: textTheme.headline1,
                            ),
                            ...card.data!.map((e) => e == null
                                ? SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kMediumPadding),
                                    child: inkWell(
                                      onTap: e.cardStatus == "inactive"
                                          ? () {
                                              showErrorBar(context,
                                                  "Card is frozen, Please contact admin.");
                                            }
                                          : () {
                                              pushTo(
                                                  context,
                                                  CardHome(
                                                    cardType: e.currency!,
                                                    cardInfo: e,
                                                  ),
                                                  settings:
                                                      const RouteSettings(
                                                          name: CardHome
                                                              .routeName));
                                            },
                                      child: Stack(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                child: SvgPicture.asset(
                                                  e.currency == "NGN"
                                                      ? AssetPaths
                                                          .cardNairaIcon
                                                      : AssetPaths
                                                          .cardDollarIcon,
                                                  fit: BoxFit.fill,
                                                ),
                                                width: double.infinity,
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            bottom: kRegularPadding,
                                            right: kRegularPadding,
                                            child: SvgPicture.asset(
                                              e.currency == "NGN"
                                                  ?  AssetPaths.verveIcon : AssetPaths.masterCardIcon,
                                              height: 30,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: kSmallPadding,
                                                  horizontal: kMediumPadding),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          e.currency == "NGN"
                                                              ? virtualNairaCard
                                                              : virtualDollarCard,
                                                          style: textTheme
                                                              .bodyText2!
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      20),
                                                        ),
                                                        SizedBox(
                                                          height: kPadding,
                                                        ),
                                                        Text(
                                                          "**** ****",
                                                          style: textTheme
                                                              .bodyText2!
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          0.8)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                          ],
                        ),
                      ),
                      card.data!.length == 2
                          ? SizedBox()
                          : LargeButton(
                              title: card.data!.length == 1 &&
                                      card.data![0]!.currency == "NGN"
                                  ? createDollarCard
                                  : createNairaCard,
                              onPressed: () {
                                buildShowModalBottomSheet(
                                  context,
                                  CreateCardWidget(
                                    textTheme: textTheme,
                                    cardType: card.data!.length == 1 &&
                                            card.data![0]!.currency == "NGN"
                                        ? "dollar"
                                        : "naira",
                                  ),
                                );
                              }),
                      SizedBox(
                        height: kRegularPadding,
                      )
                    ],
                  );
              } else {
                return SizedBox();
              }
            },
            loading: () => SpinKitDemo(),
            error: (val) => _widget));
  }
}
