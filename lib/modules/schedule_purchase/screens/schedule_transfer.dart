import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/disable_account/disable_modal.dart';
import 'package:pouchers/modules/login/models/login_response.dart';
import 'package:pouchers/modules/schedule_purchase/schedule_modal.dart';
import 'package:pouchers/modules/schedule_purchase/schedule_widget_constants.dart';
import 'package:pouchers/modules/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/modules/tab_layout/providers/account_provider.dart';
import 'package:pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ScheduleTransfer extends ConsumerStatefulWidget {
  static const String routeName = "scheduleTransfer";
  final String? text, transferName, accNo, amount, beneficiary, tag;


  const ScheduleTransfer({Key? key, this.text, this.tag, this.amount,
    this.accNo, this.beneficiary, this.transferName,}) : super(key: key);

  @override
  ConsumerState<ScheduleTransfer> createState() => _ScheduleTransferState();
}

class _ScheduleTransferState extends ConsumerState<ScheduleTransfer> {
  String frequency = "";
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: scheduleTransfer,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: kRegularPadding, vertical: kMacroPadding),
                      margin: EdgeInsets.only(top: kMacroPadding),
                      decoration: BoxDecoration(
                        color: kContainerColor,
                        borderRadius: BorderRadius.circular(kSmallPadding),
                      ),
                      child: Column(
                        children: [
                          AirtimeRow(
                            textTheme: textTheme,
                            text: accName,
                            subText:  "${userProfile.firstName!.substring(0, 1).toUpperCase()}${userProfile.firstName!.substring(1).toLowerCase()} ${userProfile.lastName!.substring(0, 1).toUpperCase()}${userProfile.lastName!.substring(1).toLowerCase()}" ,
                            isCopyIcon: false,
                            noSymbol: true,
                            style: textTheme.headline4!.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: widget.text == "bank" ? kMacroPadding : 0,
                          ),
                          widget.text == "bank"
                              ? AirtimeRow(
                                  textTheme: textTheme,
                                  text: bankName,
                                  subText: widget.transferName ?? "",
                                  isCopyIcon: false,
                                  noSymbol: true,
                                  style: textTheme.headline4!.copyWith(
                                    fontSize: 16,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: widget.text == "bank" ? kMacroPadding : 0,
                          ),
                          widget.text == "bank"
                              ? AirtimeRow(
                                  textTheme: textTheme,
                                  text: accNumber,
                                  subText: widget.accNo ?? "",
                                  isCopyIcon: false,
                                  noSymbol: true,
                                  style: textTheme.headline4!.copyWith(
                                    fontSize: 16,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: widget.text == "bank" ? 0 : kMacroPadding,
                          ),
                          widget.text == "bank"
                              ? SizedBox()
                              : AirtimeRow(
                                  textTheme: textTheme,
                                  text: poucherTag,
                                  subText: "@${widget.tag}",
                                  isCopyIcon: false,
                                  noSymbol: true,
                                  style: textTheme.headline4!.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                          SizedBox(
                            height: kMacroPadding,
                          ),
                          AirtimeRow(
                            textTheme: textTheme,
                            text: amountText,
                            subText: widget.amount ?? "",
                            isCopyIcon: false,
                            noSymbol: false,
                            isNaira: true,
                            style: textTheme.headline4!.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      // left: 0,
                      // right: 0,
                      child:  ClipRRect(
                        borderRadius: BorderRadius.circular(116),
                        child: CachedNetworkImage(
                            height: 50,
                            width: 50,
                            imageUrl: ref
                                .watch(editProfileInHouseProvider)
                                .profilePicture ??
                                "",
                            placeholder: (context, url) => Container(
                              color: Colors.transparent,
                              height: 50,
                              width: 50,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      kPrimaryColor),
                                ),
                              ),
                            ),
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kPrimaryColor,
                              ),
                              child: ref
                                  .watch(editProfileInHouseProvider)
                                  .profilePicture !=
                                  null
                                  ? Image.network(
                                ref
                                    .watch(editProfileInHouseProvider)
                                    .profilePicture!,
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null)
                                    return child;
                                  return Center(
                                    child: CircularProgressIndicator(
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
                                  :
                              Center(
                                child: Text(
                                    ref
                                        .watch(
                                        editProfileInHouseProvider)
                                        .firstName ==
                                        null ||
                                        ref
                                            .watch(
                                            editProfileInHouseProvider)
                                            .lastName ==
                                            null
                                        ? "${userProfile.firstName!.substring(0, 1).toUpperCase()}${userProfile.lastName!.substring(0, 1).toUpperCase()}"
                                        : "${ref.watch(editProfileInHouseProvider).firstName!.substring(0, 1).toUpperCase()}${ref.watch(editProfileInHouseProvider).lastName!.substring(0, 1).toLowerCase()}",
                                    style: textTheme.bodyText2!
                                        .copyWith(fontSize: 22)),
                              ),
                            )),
                      ),
                    )
                  ],
                  alignment: Alignment.topCenter,
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                TextInputNoIcon(
                  textTheme: textTheme,
                  text: choosePeriod,
                  hintText: selectFrequency,
                  read: true,
                  suffixIcon: frequency == ""
                      ? SizedBox()
                      : Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Every $frequency",
                                style: textTheme.headline2!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: kSecondaryTextColor,
                              )
                            ],
                          ),
                        ),
                  onTap: () async {
                    final result = await buildShowModalBottomSheet(
                        context, ScheduleModal());
                    setState(() => frequency = result);
                  },
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
                NextUpdateContainer(
                  textTheme: textTheme,
                  text: "Next top-up date is 12:00pm, Dec 5, 2022 ",
                )
              ],
            ),
          ),
          LargeButton(
            title: save,
            onPressed: () {
              pushTo(
                context,
                SuccessMessage(
                  text: dataSuccess,
                  subText: scheduleTransferSuccess,
                  onTap: () {
                    pushToAndClearStack(
                        context,
                        TabLayout(
                          gottenIndex: 0,
                        ));
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: kMicroPadding,
          ),
          widget.text == "viewSchedule"
              ? DeleteScheduleText(
                  textTheme: textTheme,
                  onTap: () {
                    buildShowModalBottomSheet(
                      context,
                      CommonModal(
                          textTheme: textTheme,
                          buttonText: yesDelete,
                          title: deleteTopUp,
                          subTitle: deleteTopUpSub,
                          color: kLightOrange),
                    );
                  },
                )
              : SizedBox()
        ],
      ),
    );
  }
}
