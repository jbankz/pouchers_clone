import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/modules/account/models/referral_model.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/modules/account/screens/referral/referral_invite.dart';
import 'package:pouchers/modules/account/screens/referral/referral_rewards.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../app/common/listener.dart';

class Referral extends ConsumerStatefulWidget {
  static const String routeName = "referral";

  Referral({Key? key}) : super(key: key);

  @override
  ConsumerState<Referral> createState() => _ReferralState();
}

class _ReferralState extends ConsumerState<Referral> {
  int refIndex = 0;
  List<String> text = ["Invite", "Rewards"];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: "${referralText}s",
      child: ListenerPage(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: EdgeInsets.symmetric(
                    horizontal: kRegularPadding,
                    vertical: kSmallPadding,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kSupremePadding),
                      color: kPrimaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        2,
                        (index) => inkWell(
                          onTap: () {
                            setState(() {
                              refIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: refIndex == index
                                  ? kPrimaryWhite
                                  : kTransparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: kMicroPadding,
                              vertical: kPadding,
                            ),
                            child: Text(
                              text[index],
                              style: textTheme.headline4!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: refIndex == index
                                      ? kPrimaryTextColor
                                      : kPrimaryWhite),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: kMediumPadding,
              ),
              refIndex == 0
                  ? ReferralInvite()
                  : ReferralRewards()
            ],
          ),
        ),
      ),
    );
  }
}


