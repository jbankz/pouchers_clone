import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/ui_models_class.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/account/screens/account_settings/schedule_payments.dart';
import 'package:Pouchers/modules/account/screens/disable_account/disable_modal.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/schedule_purchase/provider/schedule_provider.dart';
import 'package:Pouchers/modules/schedule_purchase/schedule_modal.dart';
import 'package:Pouchers/modules/schedule_purchase/schedule_widget_constants.dart';
import 'package:Pouchers/modules/tab_layout/screens/tab_layout.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';

class ScheduleTransfer extends ConsumerStatefulWidget {
  static const String routeName = "scheduleTransfer";
  final String? text,
      transferName,
      accNo,
      amount,
      beneficiary,
      tag,
      note,
      typeOfTransfer,
      frequency,
      id;

  const ScheduleTransfer(
      {Key? key,
      this.text,
      this.tag,
      this.amount,
      this.accNo,
      this.beneficiary,
      this.transferName,
      this.typeOfTransfer,
      this.frequency,
      this.note,
      this.id})
      : super(key: key);

  @override
  ConsumerState<ScheduleTransfer> createState() => _ScheduleTransferState();
}

class _ScheduleTransferState extends ConsumerState<ScheduleTransfer> {
  String frequency = "";
  String topUpDate = "";
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.frequency != null) {
      frequency = widget.frequency!.startsWith(RegExp("[0-9:\s]"))
          ? ordinal_suffix_of(int.parse(widget.frequency!))
          : widget.frequency!;
      topUpDate = "Next top-up date is the next $frequency";
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: scheduleTransfer,
      child: ListenerPage(
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
                              subText: widget.beneficiary ??
                                  "${userProfile.firstName!.substring(0, 1).toUpperCase()}${userProfile.firstName!.substring(1).toLowerCase()} ${userProfile.lastName!.substring(0, 1).toUpperCase()}${userProfile.lastName!.substring(1).toLowerCase()}",
                              isCopyIcon: false,
                              noSymbol: true,
                              style: textTheme.headline4!.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: widget.typeOfTransfer == "localBank"
                                  ? kMacroPadding
                                  : 0,
                            ),
                            widget.typeOfTransfer == "localBank"
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
                              height: widget.typeOfTransfer == "localBank"
                                  ? kMacroPadding
                                  : 0,
                            ),
                            widget.typeOfTransfer == "localBank"
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
                              height: widget.typeOfTransfer == "localBank"
                                  ? 0
                                  : kMacroPadding,
                            ),
                            widget.typeOfTransfer == "localBank"
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
                              subText: kPriceFormatter(
                                double.parse(widget.amount ?? "0"),
                              ),
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
                        child: ClipRRect(
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
                                                ImageChunkEvent?
                                                    loadingProgress) {
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
                                        : Center(
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
                  Text(
                    choosePeriod,
                    style: textTheme.headline6,
                  ),
                  SizedBox(
                    height: kSmallPadding,
                  ),
                  inkWell(
                    onTap: () async {
                      final result = await buildShowModalBottomSheet(
                          context, ScheduleModal());
                      if (result != null) {
                        setState(() {
                          frequency = result;
                          topUpDate = "Next top-up date is the next $frequency";
                        });
                      }
                    },
                    child: SelectFrequencyWidget(
                      textTheme: textTheme,
                      frequency: frequency,
                    ),
                  ),
                  SizedBox(
                    height: kRegularPadding,
                  ),
                  frequency == ""
                      ? SizedBox()
                      : NextUpdateContainer(
                          textTheme: textTheme,
                          text: topUpDate,
                        )
                ],
              ),
            ),
            Consumer(builder: (context, ref, _) {
              widget.typeOfTransfer == "localBank"
                  ? ref.listen(scheduleLocalProvider,
                      (previous, NotifierState<String> next) {
                      if (next.status == NotifierStatus.done) {
                        pushTo(
                          context,
                          SuccessMessage(
                            text: dataSuccess,
                            subText: widget.text == "viewSchedule"
                                ? scheduleUpdateSuccess
                                : scheduleTransferSuccess,
                            onTap: () {
                              widget.text == "viewSchedule"
                                  ? Navigator.popUntil(
                                      context,
                                      (route) =>
                                          route.settings.name ==
                                          SchedulePayments.routeName,
                                    )
                                  : pushToAndClearStack(
                                      context,
                                      TabLayout(
                                        gottenIndex: 0,
                                      ));
                            },
                          ),
                        );
                      } else if (next.status == NotifierStatus.error) {
                        showErrorBar(context, next.message ?? "");
                      }
                    })
                  : ref.listen(scheduleP2PProvider,
                      (previous, NotifierState<String> next) {
                      if (next.status == NotifierStatus.done) {
                        pushTo(
                          context,
                          SuccessMessage(
                            text: dataSuccess,
                            subText: widget.text == "viewSchedule"
                                ? scheduleUpdateSuccess
                                : scheduleTransferSuccess,
                            onTap: () {
                              widget.text == "viewSchedule"
                                  ? Navigator.popUntil(
                                      context,
                                      (route) =>
                                          route.settings.name ==
                                          SchedulePayments.routeName,
                                    )
                                  : pushToAndClearStack(
                                      context,
                                      TabLayout(
                                        gottenIndex: 0,
                                      ));
                            },
                          ),
                        );
                      } else if (next.status == NotifierStatus.error) {
                        showErrorBar(context, next.message ?? "");
                      }
                    });
              var _widget = LargeButton(
                title: save,
                onPressed: () async {
                  final result = await buildShowModalBottomSheet(
                      context,
                      TransactionPinContainer(
                        isData: false,
                        isCable: false,
                        isCard: false,
                        isFundCard: false,
                      ));
                  if (result != null) {
                    if (widget.typeOfTransfer == "localBank") {
                      ref
                          .read(scheduleLocalProvider.notifier)
                          .scheduleLocalTransfer(
                            frequency: frequency.startsWith(RegExp("[0-9:\s]"))
                                ? frequency.replaceAll(RegExp("[a-zA-Z:\s]"), "")
                                : frequency,
                            scheduleId: widget.id,
                            status: "active",
                            bankName: widget.transferName ?? "",
                            amount: double.parse(widget.amount ?? "0"),
                            accountNumber: widget.accNo ?? "",
                            transactionPin: result,
                          );
                    } else {
                      ref.read(scheduleP2PProvider.notifier).scheduleP2PTransfer(
                            category: "p2p-transfer",
                            subCategory: "none",
                            scheduleId: widget.id,
                            status: "active",
                            frequency: frequency.startsWith(RegExp("[0-9:\s]"))
                                ? frequency.replaceAll(RegExp("[a-zA-Z:\s]"), "")
                                : frequency,
                            tag: widget.tag ?? "",
                            amount: double.parse(widget.amount ?? "0"),
                            note: widget.note ?? "",
                            transactionPin: result,
                          );
                    }
                  }
                },
              );

              return widget.typeOfTransfer == "localBank"
                  ? ref.watch(scheduleLocalProvider).when(
                        done: (done) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget,
                      )
                  : ref.watch(scheduleP2PProvider).when(
                        done: (done) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget,
                      );
            }),
            SizedBox(
              height: kMicroPadding,
            ),
            widget.text == "viewSchedule"
                ? DeleteScheduleText(
                    textTheme: textTheme,
                    onTap: () async {
                      final result = await buildShowModalBottomSheet(
                        context,
                        CommonModal(
                            textTheme: textTheme,
                            buttonText: yesDelete,
                            title: deleteTopUp,
                            subTitle: deleteTopUpSub,
                            color: kLightOrange),
                      );
                      if (result != null) {
                        if (result == "yes") {
                          final result = await buildShowModalBottomSheet(
                              context,
                              TransactionPinContainer(
                                isData: false,
                                isCable: false,
                                isCard: false,
                                isFundCard: false,
                              ));
                          if (result != null) {
                            if (widget.typeOfTransfer == "localBank") {
                              ref
                                  .read(deleteScheduleProvider.notifier)
                                  .deleteSchedule(
                                    scheduleId: widget.id!,
                                    transactionPin: result,
                                    then: () => pushTo(
                                      context,
                                      SuccessMessage(
                                        text: dataSuccess,
                                        subText: billDeleteSuccess,
                                        onTap: () {
                                          Navigator.popUntil(
                                            context,
                                            (route) =>
                                                route.settings.name ==
                                                SchedulePayments.routeName,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                            } else {
                              ref
                                  .read(deleteScheduleProvider.notifier)
                                  .deleteSchedule(
                                    scheduleId: widget.id!,
                                    transactionPin: result,
                                    then: () => pushTo(
                                      context,
                                      SuccessMessage(
                                        text: dataSuccess,
                                        subText: billDeleteSuccess,
                                        onTap: () {
                                          Navigator.popUntil(
                                            context,
                                            (route) =>
                                                route.settings.name ==
                                                SchedulePayments.routeName,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                            }
                          }
                        }
                      }
                    },
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
