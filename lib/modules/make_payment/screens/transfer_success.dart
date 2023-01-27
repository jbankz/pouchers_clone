import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/make_payment/models/make_payment_model.dart';
import 'package:pouchers/modules/make_payment/screens/transaction_receipt.dart';
import 'package:pouchers/modules/schedule_purchase/screens/schedule_transfer.dart';
import 'package:pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';
import 'dart:math' as math;

class TransferSuccess extends StatelessWidget {
  final String text;
  final String? typeOfTransfer;
  final bool isRequest;
  final P2PResponse? response;
  final String? transferName, accNo, amount, beneficiary, tag;

  const TransferSuccess(
      {Key? key, required this.text, required this.isRequest,  this.typeOfTransfer, this.amount,
        this.accNo, this.beneficiary, this.transferName, this.response, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        noBackButton: true,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AssetPaths.success, height: 200, width: 200),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                  Text(
                    isRequest ? requestCompleted : transferCompleted,
                    style: textTheme.headline1,
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Text(
                    isRequest ? requestCompletedSub : transferCompletedSub,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyText1!
                        .copyWith(fontWeight: FontWeight.normal, height: 1.6),
                  ),
                ],
              ),
            ),
            isRequest
                ? SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TransferRowWidget(
                        onTap: () {
                          pushTo(
                              context,
                              ScheduleTransfer(
                                text: text,
                                tag: tag,
                                transferName: transferName,
                                amount: amount,
                                accNo: accNo,
                                beneficiary: beneficiary,
                              ),
                              settings: RouteSettings(
                                  name: ScheduleTransfer.routeName));
                        },
                        icon: Transform(
                          transform: Matrix4(
                            1,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                            0,
                            0,
                            0,
                            1,
                          )..rotateX(math.pi),
                          alignment: Alignment.center,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(0.87),
                            child: Icon(
                              Icons.sync,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        text: schedule,
                      ),
                      SizedBox(
                        width: kMediumPadding,
                      ),
                      TransferRowWidget(
                        onTap: () {
                          pushTo(context, TransactionReceipt(
                            typeOfTransfer: typeOfTransfer,
                            accNo: accNo,
                            amount: amount,
                            transferName: transferName,
                              beneficiary: beneficiary
                          ),
                              settings: RouteSettings(
                                  name: TransactionReceipt.routeName));
                        },
                        icon: SvgPicture.asset(
                          AssetPaths.uploadOutlineIcon,
                        ),
                        text: shareReceipt,
                      ),
                    ],
                  ),
            SizedBox(
              height: kMacroPadding,
            ),
            LargeButton(
                title: continueText,
                disableColor: kPurpleColor,
                onPressed: () {
                  pushToAndClearStack(
                    context,
                    TabLayout(
                      gottenIndex: 0,
                    ),
                  );
                }),
            SizedBox(
              height: kMediumPadding,
            ),
          ],
        ));
  }
}

class TransferRowWidget extends StatelessWidget {
  final Widget icon;
  final String text;
  final Function() onTap;

  const TransferRowWidget({
    required this.icon,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Expanded(
        child: inkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: kMediumPadding, vertical: kRegularPadding),
        decoration: BoxDecoration(
          color: kContainerColor,
          borderRadius: BorderRadius.circular(kSmallPadding),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: kSmallPadding,
            ),
            Expanded(
              child: Text(
                text,
                style: textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
