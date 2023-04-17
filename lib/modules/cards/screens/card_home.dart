import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/common/listener.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/cards/model/cards_model.dart';
import 'package:pouchers/modules/cards/providers/cards_providers.dart';
import 'package:pouchers/modules/cards/screens/card_widgets.dart';
import 'package:pouchers/modules/cards/screens/create_virtual_card.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/input_formatters.dart';
import 'package:pouchers/utils/logger.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

class CardHome extends ConsumerStatefulWidget {
  static const String routeName = "cardHome";
  final String? cardType;
  final GetAllCardsResponseData? cardInfo;

  const CardHome({Key? key, this.cardType, this.cardInfo}) : super(key: key);

  @override
  ConsumerState<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends ConsumerState<CardHome> {
  bool _switchSides = false;
  bool _flipXAxis = false;
  String cardCvv = "";
  String cardNumber = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(getCardDetailsProvider.notifier)
          .getCardDetails(cardId: widget.cardInfo!.cardId);
      ref.read(getCardTokenProvider.notifier).getCardToken(
            cardId: widget.cardInfo!.cardId,
          );
      ref.read(getCardBalanceProvider.notifier).getCardBalance(
            cardId: widget.cardInfo!.accountId,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: widget.cardType == "NGN" ? nairaVirtualCard : dollarVirtualCard,
      child:  ListenerPage(
        child:
      ref.watch(getCardDetailsProvider).when(
            done: (data) {
              if (data == null) {
                return SizedBox();
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      balance,
                      style: textTheme.headline6!.copyWith(
                        color: kIconGrey,
                      ),
                    ),
                    Consumer(builder: (context, ref, _) {
                      return ref.watch(getCardTokenProvider).when(loading: () {
                        return Container(
                          width: 50,
                          height: 50,
                          child: SpinKitDemo(
                            color: Colors.white,
                          ),
                        );
                      }, error: (err) {
                        logPrint("Card token err: $err");
                        return SizedBox();
                      }, done: (data) {
                        if (data != null) {
                          fetch(data);
                          return SizedBox();
                        } else {
                          return SizedBox();
                        }
                      });
                    }),
                    ref.watch(getCardBalanceProvider).when(done: (done) {
                      if (done != null) {
                        return RichText(
                          text: TextSpan(
                            text: widget.cardType == "NGN" ? "₦" : "\$",
                            style: TextStyle(
                              color: kPrimaryTextColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 26,
                            ),
                            children: [
                              TextSpan(
                                  text: kPriceFormatter(
                                    double.parse(done),
                                  ),
                                  style: textTheme.headline1)
                            ],
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
                    SizedBox(
                      height: kSmallPadding,
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 800),
                      layoutBuilder: (widget, list) =>
                          Stack(children: [widget!, ...list]),
                      transitionBuilder:
                          (Widget widget, Animation<double> animation) {
                        final rotateAnim =
                            Tween(begin: pi, end: 0.0).animate(animation);
                        return AnimatedBuilder(
                          animation: rotateAnim,
                          child: widget,
                          builder: (context, widget) {
                            final isUnder = (ValueKey(
                                  frontCard(textTheme, data.data!),
                                ) !=
                                widget!.key);
                            var tilt =
                                ((animation.value - 0.5).abs() - 0.5) * 0.003;
                            tilt *= isUnder ? 1.0 : -1.0;
                            final value = isUnder
                                ? min(rotateAnim.value, pi / 2)
                                : rotateAnim.value;
                            return Transform(
                              transform:
                                  // _flipXAxis
                                  //     ?
                                  (Matrix4.rotationY(value)
                                    ..setEntry(3, 0, tilt)),
                              // (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
                              child: widget,
                              alignment: Alignment.center,
                            );
                          },
                        );
                      },
                      switchInCurve: Curves.easeInBack,
                      switchOutCurve: Curves.easeInBack.flipped,
                      child: _switchSides
                          ? rearCard(textTheme)
                          : frontCard(textTheme, data.data!),
                    ),
                    SizedBox(
                      height: kSmallPadding,
                    ),
                    inkWell(
                      onTap: () => setState(() {
                        _switchSides = !_switchSides;
                        // _flipXAxis = !_flipXAxis;
                      }),
                      child: Text(
                        flipCard,
                        style: textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: kIconGrey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: kMacroPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardColumn(
                            onTap: () {
                              pushTo(
                                      context,
                                      CreateVirtualCard(
                                        isFundCard: true,
                                        isNaira: widget.cardType == "NGN"
                                            ? true
                                            : false,
                                        isFundNaira: widget.cardType == "NGN"
                                            ? true
                                            : false,
                                      ),
                                      settings: const RouteSettings(
                                          name: CreateVirtualCard.routeName))
                                  .then((value) {
                                ref
                                    .read(getCardDetailsProvider.notifier)
                                    .getCardDetails(
                                        cardId: widget.cardInfo!.cardId);
                                ref
                                    .read(getCardBalanceProvider.notifier)
                                    .getCardBalance(
                                      cardId: widget.cardInfo!.accountId,
                                    );
                                ref.read(getCardTokenProvider.notifier).getCardToken(
                                  cardId: widget.cardInfo!.cardId,
                                );
                              });
                            },
                            textTheme: textTheme,
                            text: fundCard,
                            icon: AssetPaths.fundCardIcon),
                        CardColumn(
                            onTap: () {
                              buildShowModalBottomSheet(
                                context,
                                CardDetails(
                                  cardData: data.data!,
                                  cardCvv: cardCvv,
                                ),
                              );
                            },
                            textTheme: textTheme,
                            text: cardDetails,
                            icon: AssetPaths.cardDetailIcon),
                        CardColumn(
                            textTheme: textTheme,
                            text: manage,
                            onTap: () {
                              buildShowModalBottomSheet(
                                context,
                                ManageCard(cardData: data.data!),
                              );
                            },
                            icon: AssetPaths.manageIcon)
                      ],
                    ),
                    SizedBox(
                      height: kLargePadding,
                    ),
                    Text(
                      transHistory,
                      style: textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.w700, color: kDarkFill),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: kFullPadding,
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 13,
                                  left: kSmallPadding,
                                  right: kSmallPadding,
                                  bottom: kMediumPadding),
                              decoration: BoxDecoration(
                                  color: kContainerColor,
                                  borderRadius:
                                      BorderRadius.circular(kSmallPadding)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: kSmallPadding,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: kSecondaryTextColor,
                                        borderRadius:
                                            BorderRadius.circular(kPadding)),
                                  ),
                                  SizedBox(
                                    height: kSmallPadding,
                                  ),
                                  Container(
                                    height: kSmallPadding,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: kSecondaryTextColor,
                                        borderRadius:
                                            BorderRadius.circular(kPadding)),
                                  ),
                                  SizedBox(
                                    height: kRegularPadding,
                                  ),
                                  Container(
                                    height: kSmallPadding,
                                    width: kLargePadding,
                                    decoration: BoxDecoration(
                                      color: kLightColor200,
                                      borderRadius:
                                          BorderRadius.circular(kPadding),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: kMediumPadding,
                          ),
                          Center(
                            child: Text(
                              noTransaction,
                              style: textTheme.headline4!.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Container(
                          //       decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //           color: kContainerColor),
                          //       alignment: Alignment.center,
                          //       padding: EdgeInsets.all(10),
                          //       child: RotationTransition(
                          //         child: Icon(
                          //           Icons.send_rounded,
                          //           color: kColorGreen,
                          //           size: 17,
                          //         ),
                          //         turns: AlwaysStoppedAnimation(0.9),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: kSmallPadding,
                          //     ),
                          //     Expanded(
                          //         child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           "Card funding",
                          //           style: textTheme.subtitle1!
                          //               .copyWith(fontWeight: FontWeight.w500),
                          //         ),
                          //         SizedBox(
                          //           height: 2,
                          //         ),
                          //         Text(
                          //           "12 sep, 2022",
                          //           style: textTheme.headline3,
                          //         )
                          //       ],
                          //     )),
                          //     Row(
                          //       children: [
                          //         Text(
                          //           "+ ",
                          //           style: textTheme.subtitle1!
                          //               .copyWith(fontSize: 16),
                          //         ),
                          //         RichText(
                          //           text: TextSpan(
                          //             text: "₦",
                          //             style: TextStyle(
                          //               color: kPrimaryTextColor,
                          //               fontWeight: FontWeight.normal,
                          //               fontSize: 16,
                          //             ),
                          //             children: [
                          //               TextSpan(
                          //                 text: "407,000.00",
                          //                 style: textTheme.subtitle1!.copyWith(
                          //                   fontSize: 16,
                          //                 ),
                          //               )
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     )
                          //   ],
                          // ),
                          // SizedBox(height: kRegularPadding),
                          // Divider(
                          //   thickness: 1,
                          //   color: kLight100,
                          // ),
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Container(
                          //       decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //           color: kContainerColor),
                          //       alignment: Alignment.center,
                          //       padding: EdgeInsets.all(10),
                          //       child: RotationTransition(
                          //         child: Icon(
                          //           Icons.send_rounded,
                          //           color: kColorOrange,
                          //           size: 17,
                          //         ),
                          //         turns: AlwaysStoppedAnimation(1.4),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: kSmallPadding,
                          //     ),
                          //     Expanded(
                          //         child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           "Card funding",
                          //           style: textTheme.subtitle1!
                          //               .copyWith(fontWeight: FontWeight.w500),
                          //         ),
                          //         SizedBox(
                          //           height: 2,
                          //         ),
                          //         Text(
                          //           "12 sep, 2022",
                          //           style: textTheme.headline3,
                          //         )
                          //       ],
                          //     )),
                          //     Text(
                          //       "- \$407,000.00",
                          //       style:
                          //           textTheme.subtitle1!.copyWith(fontSize: 16),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
            loading: () => SpinKitDemo(),
          ),
    ));
  }

  Future fetch(String cardUrl) async {
    Map<String, String> _authHeaders = {
      HttpHeaders.connectionHeader: "keep-alive",
      HttpHeaders.contentTypeHeader: "application/json",
      "Authorization": "Bearer $cardUrl"
    };
    final url =
        "https://tntpaxvvvet.live.verygoodproxy.com/cards/${widget.cardInfo!.cardId}/secure-data/cvv2";
    final url2 =
        "https://tntpaxvvvet.live.verygoodproxy.com/cards/${widget.cardInfo!.cardId}/secure-data/number";

    http.Response response = await http.get(
      Uri.parse(url),
      headers: _authHeaders,
    );
    http.Response response2 = await http.get(
      Uri.parse(url2),
      headers: _authHeaders,
    );
    var responseBody = jsonDecode(response.body);
    var responseBody2 = jsonDecode(response2.body);

    if (response.statusCode == 200) {
      setState(() {
        cardCvv = responseBody["data"]["cvv2"];
      });
    }
    if (response2.statusCode == 200) {
      setState(() {
        cardNumber = responseBody2["data"]["number"];
      });
    }
  }

  Stack frontCard(TextTheme textTheme, GetCardDetailsData data) {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              child: SvgPicture.asset(
                widget.cardType == "NGN"
                    ? AssetPaths.cardHomeNairaIcon
                    : AssetPaths.cardHomeDollarIcon,
                fit: BoxFit.fill,
              ),
              width: double.infinity,
            ),
          ],
        ),
        Positioned(
          top: kRegularPadding,
          right: kRegularPadding,
          child: SvgPicture.asset(
            widget.cardType == "NGN"
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
                vertical: kSmallPadding, horizontal: kMediumPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        cardNumber,
                        style: textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      SizedBox(
                        height: kPadding,
                      ),
                      Text(
                        data.customer!.name!.toTitleCase2(),
                        style: textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(255, 255, 255, 0.8)),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Exp: ${data.expiryMonth}/${data.expiryYear}",
                  style: textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(255, 255, 255, 0.8)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container rearCard(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.only(top: kRegularPadding, bottom: 85),
      decoration: BoxDecoration(
        color: widget.cardType == "NGN" ? kGreen100Color : kPurple400,
        borderRadius: BorderRadius.circular(kRegularPadding),
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: kPrimaryTextColor,
            ),
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Row(
            children: [
              Container(
                width: 170,
                margin: EdgeInsets.symmetric(horizontal: kSmallPadding),
                padding: EdgeInsets.only(
                    left: kPadding,
                    right: kMediumPadding,
                    top: kPadding,
                    bottom: kPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: kPrimaryWhite),
                child: Wrap(
                  children: List.generate(
                      144,
                      (index) => Container(
                            margin: EdgeInsets.only(
                                left: 2, top: 2, bottom: 2, right: 2),
                            padding: EdgeInsets.only(right: kMacroPadding),
                            height: 2,
                            width: 2,
                            decoration:
                                BoxDecoration(color: kColorBackgroundLight300),
                          )),
                ),
              ),
              SizedBox(
                width: kMediumPadding,
              ),
              Padding(
                padding: const EdgeInsets.only(top: kRegularPadding),
                child: Text(
                  cardCvv,
                  style: textTheme.bodyText2!.copyWith(
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                    fontFamily: "DMSans",
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
