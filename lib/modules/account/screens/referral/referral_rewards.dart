import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pouchers/app/common/listener.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/modules/account/models/referral_model.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/utils.dart';
import 'package:pouchers/utils/widgets.dart';

class ReferralRewards extends ConsumerStatefulWidget {
  @override
  ConsumerState<ReferralRewards> createState() => _ReferralRewardsState();
}

class _ReferralRewardsState extends ConsumerState<ReferralRewards> {
  final dateFormat = DateFormat('MMM-dd-yy');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getReferralProvider.notifier).getReferralTrail();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListenerPage(
      child: Consumer(builder: (context, ref, _) {
        return ref.watch(getReferralProvider).when(
            done: (referralData) {
              if (referralData != null) {
                // double amount = referralData.data!.fold<double>(
                //     0,
                //     (double sum, element) =>
                //         sum + (double.parse(element.referralAmount!)));
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RewardsContainer(
                      textTheme: textTheme,
                      icon: SvgPicture.asset(AssetPaths.ticketStarIcon),
                      widget: Column(
                        children: [
                          NairaWidget(
                              text: kPriceFormatter(double.parse(
                                   referralData.data!.earning![0].totalEarnings ?? "0"
                                     )),
                              textStyle1: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: kPrimaryTextColor,
                                fontFamily: null,
                                fontSize: 34,
                              ),
                              textStyle2: textTheme.headline4!.copyWith(
                                  fontSize: 34, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis, )),
                          Text(
                            bonusEarned,
                            style: textTheme.headline3,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kMicroPadding,
                    ),
                    Text(
                      invitation,
                      style: textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: kRegularPadding,
                    ),
                    Text(
                      invitedPeople,
                      style: textTheme.headline3,
                    ),
                    SizedBox(
                      height: kSmallPadding,
                    ),
                    referralData.data!.referralTrail!.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: kMicroPadding,
                                  vertical: kRegularPadding,
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: kLightPurple, width: 1),
                                  color: Color.fromRGBO(100, 99, 253, 0.1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(kSmallPadding),
                                    topRight: Radius.circular(
                                      kSmallPadding,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      inviteeName,
                                      style: textTheme.headline4!
                                          .copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      date,
                                      style: textTheme.headline4!
                                          .copyWith(fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: kMicroPadding,
                                    vertical: kRegularPadding,
                                  ),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: kLightPurple, width: 1),
                                    color: kPrimaryWhite,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(kSmallPadding),
                                      bottomRight: Radius.circular(
                                        kSmallPadding,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: kPadding,
                                      ),
                                      CircleAvatar(
                                          backgroundColor: kLightPurple,
                                          radius: 80,
                                          child: Image.asset(
                                            AssetPaths.inviteImage,
                                            height: 120,
                                          )),
                                      SizedBox(
                                        height: kPadding,
                                      ),
                                      Text(
                                        noRewards,
                                        textAlign: TextAlign.center,
                                        style: textTheme.headline1!
                                            .copyWith(fontSize: 18),
                                      ),
                                      Text(
                                        noInvite,
                                        style: textTheme.headline3,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: kMicroPadding,
                              ),
                              Text(
                                howToEarn,
                                style: textTheme.headline1!.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: kRegularPadding,
                              ),
                              RewardsContainer(
                                textTheme: textTheme,
                                widget: Text(
                                  inviteFriend,
                                  style: textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                icon: Icon(Icons.person_add_alt_1),
                              ),
                            ],
                          )
                        : Column(children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: kMicroPadding,
                                vertical: kRegularPadding,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: kLightPurple, width: 1),
                                color: Color.fromRGBO(100, 99, 253, 0.1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(kSmallPadding),
                                  topRight: Radius.circular(
                                    kSmallPadding,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    inviteeName,
                                    style: textTheme.headline4!
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    date,
                                    style: textTheme.headline4!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    status,
                                    style: textTheme.headline4!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: kMicroPadding,
                                  right: kMicroPadding,
                                  top: kMacroPadding,
                                  bottom: kRegularPadding),
                              decoration: BoxDecoration(
                                border: Border.all(color: kLightPurple, width: 1),
                                color: kPrimaryWhite,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(kSmallPadding),
                                  bottomRight: Radius.circular(
                                    kSmallPadding,
                                  ),
                                ),
                              ),
                              child: Column(
                                children: referralData.data!.referralTrail!
                                    .map((e) => Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    "${e.lastName} ${e.firstName}" ??
                                                        "",
                                                    style: textTheme.headline4!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 16),
                                                    softWrap: true,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text(
                                                    dateFormat
                                                        .format(e.createdAt!),
                                                    style: textTheme.headline4),
                                                Expanded(
                                                  flex: 1,
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(kPadding),
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: e.isPaid!
                                                              ? kColorGreen
                                                                  .withOpacity(0.2)
                                                              : kLightYellow100
                                                                  .withOpacity(0.2)),
                                                      child: Container(
                                                        height: 10,
                                                        width: 10,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: e.isPaid!
                                                                ? kColorGreen
                                                                : kLightYellow100),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: kSmallPadding,
                                            ),
                                            Divider(
                                              thickness: 2,
                                              color: Color.fromRGBO(
                                                  233, 230, 253, 0.5),
                                            ),
                                            SizedBox(
                                              height: kSmallPadding,
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              ),
                            ),
                          ])
                  ],
                );
              } else {
                return SizedBox();
              }
            },
            loading: () => SpinKitDemo(),
            error: (val) => SizedBox());
      }),
    );
    //   Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     RewardsContainer(
    //       textTheme: widget.textTheme,
    //       icon: SvgPicture.asset(AssetPaths.ticketStarIcon),
    //       widget: Column(
    //         children: [
    //           NairaWidget(
    //               text: "00.00",
    //               textStyle1: TextStyle(
    //                 fontWeight: FontWeight.w700,
    //                 color: kPrimaryTextColor,
    //                 fontFamily: null,
    //                 fontSize: 34,
    //               ),
    //               textStyle2: widget.textTheme.headline4!
    //                   .copyWith(fontSize: 34, fontWeight: FontWeight.w700)),
    //           Text(
    //             bonusEarned,
    //             style: widget.textTheme.headline3,
    //           ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(
    //       height: kMicroPadding,
    //     ),
    //     Text(
    //       invitation,
    //       style: widget.textTheme.subtitle1!.copyWith(
    //         fontWeight: FontWeight.w700,
    //       ),
    //     ),
    //     SizedBox(
    //       height: kRegularPadding,
    //     ),
    //     Text(
    //       invitedPeople,
    //       style: widget.textTheme.headline3,
    //     ),
    //     SizedBox(
    //       height: kSmallPadding,
    //     ),
    //
    //     widget.ref.watch(getReferralProvider).when(
    //         done: (referralData) {
    //           if (referralData != null) {
    //             return referralData.data!.isEmpty
    //                 ? widget._widget
    //                 : Column(children: [
    //                     Container(
    //                       padding: EdgeInsets.symmetric(
    //                         horizontal: kMicroPadding,
    //                         vertical: kRegularPadding,
    //                       ),
    //                       decoration: BoxDecoration(
    //                         border: Border.all(color: kLightPurple, width: 1),
    //                         color: Color.fromRGBO(100, 99, 253, 0.1),
    //                         borderRadius: BorderRadius.only(
    //                           topLeft: Radius.circular(kSmallPadding),
    //                           topRight: Radius.circular(
    //                             kSmallPadding,
    //                           ),
    //                         ),
    //                       ),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             inviteeName,
    //                             style: widget.textTheme.headline4!
    //                                 .copyWith(fontWeight: FontWeight.w700),
    //                           ),
    //                           Text(
    //                             date,
    //                             style: widget.textTheme.headline4!
    //                                 .copyWith(fontWeight: FontWeight.w500),
    //                           ),
    //                           Text(
    //                             status,
    //                             style: widget.textTheme.headline4!
    //                                 .copyWith(fontWeight: FontWeight.w500),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     Container(
    //                       width: double.infinity,
    //                       padding: EdgeInsets.only(
    //                           left: kMicroPadding,
    //                           right: kMicroPadding,
    //                           top: kMacroPadding,
    //                           bottom: kRegularPadding),
    //                       decoration: BoxDecoration(
    //                         border: Border.all(color: kLightPurple, width: 1),
    //                         color: kPrimaryWhite,
    //                         borderRadius: BorderRadius.only(
    //                           bottomLeft: Radius.circular(kSmallPadding),
    //                           bottomRight: Radius.circular(
    //                             kSmallPadding,
    //                           ),
    //                         ),
    //                       ),
    //                       child: Column(
    //                         children: widget.referralClass
    //                             .map((e) => Column(
    //                                   children: [
    //                                     Row(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.spaceBetween,
    //                                       children: [
    //                                         Text(
    //                                           e.name,
    //                                           style: widget.textTheme.headline4!
    //                                               .copyWith(
    //                                                   fontWeight:
    //                                                       FontWeight.w500,
    //                                                   fontSize: 16),
    //                                         ),
    //                                         Text(e.date,
    //                                             style: widget.textTheme.headline4),
    //                                         Container(
    //                                           padding: EdgeInsets.all(kPadding),
    //                                           decoration: BoxDecoration(
    //                                               shape: BoxShape.circle,
    //                                               color: kLightYellow100
    //                                                   .withOpacity(0.2)),
    //                                           child: Container(
    //                                             height: 10,
    //                                             width: 10,
    //                                             decoration: BoxDecoration(
    //                                                 shape: BoxShape.circle,
    //                                                 color: kLightYellow100),
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                     SizedBox(
    //                                       height: kSmallPadding,
    //                                     ),
    //                                     Divider(
    //                                       thickness: 2,
    //                                       color: Color.fromRGBO(
    //                                           233, 230, 253, 0.5),
    //                                     ),
    //                                     SizedBox(
    //                                       height: kSmallPadding,
    //                                     ),
    //                                   ],
    //                                 ))
    //                             .toList(),
    //                       ),
    //                     ),
    //                   ]);
    //           } else {
    //             return SizedBox();
    //           }
    //         },
    //         loading: () => SpinKitDemo(),
    //         error: (val) => widget._widget)
    //   ],
    // );
  }
}
