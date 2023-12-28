import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/transfer/domain/model/transfer.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/profile_image.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../common/app_colors.dart';
import '../../../../widgets/dotted_line_widget.dart';
import '../../../../widgets/receipt_ticket_widget.dart';
import '../sheets/receipt_action_sheet.dart';
import 'receipt/transfer_receipt.dart';

class TransferReceipt extends StatefulWidget {
  const TransferReceipt({super.key, this.transfer});

  final Transfer? transfer;

  @override
  State<TransferReceipt> createState() => _TransferReceiptState();
}

class _TransferReceiptState extends State<TransferReceipt> {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => BottomSheets.showSheet(
    //     barrierColor: Colors.transparent,
    //     elevation: 4,
    //     enableDrag: false,
    //     isDismissible: false,
    //     child: ReceiptActionSheet(
    //         image: () async => await screenshotController.capture().then(
    //             (value) async =>
    //                 await AppHelper.shareReceipt(uint8list: value)),
    //         pdf: () async => await AppHelper.shareReceipt(
    //             widget: await generateTransferReceipt(widget.transfer)))));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.kBackgroundColor,
        appBar: AppBar(
            backgroundColor: AppColors.kBackgroundColor,
            title: Text(AppString.transactionReceipt)),
        body: Stack(
          children: [
            Screenshot(
              controller: screenshotController,
              child: SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: [
                  ReceiptTicketWidget(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ProfileImage(
                                image: '', height: 70, width: 70),
                            SvgPicture.asset(AppImage.logo,
                                height: 63.24.h, width: 63.24.w)
                          ],
                        ),
                        const Gap(height: 40),
                        _buildTileWidget(
                            context: context,
                            title: AppString.transactionDate,
                            value: widget.transfer?.transactionDate
                                    ?.replaceAll('-', ' ')
                                    .split(',')
                                    .first ??
                                ''),
                        const Gap(height: 26),
                        _buildTileWidget(
                            context: context,
                            title: AppString.transactionSender,
                            value:
                                widget.transfer?.senderName?.titleCase ?? ''),
                        const Gap(height: 26),
                        _buildTileWidget(
                            context: context,
                            title: AppString.transactionBeneficiary,
                            value:
                                widget.transfer?.receiverName?.titleCase ?? ''),
                        const Gap(height: 26),
                        _buildTileWidget(
                            context: context,
                            title: AppString.poucherTag,
                            value: widget.transfer?.receiverTag ?? ''),
                        const Gap(height: 26),
                        _buildTileWidget(
                            context: context,
                            title: AppString.transactionAmount,
                            value: (widget.transfer?.amount ?? 0).toNaira),
                        const Gap(height: 26),
                        _buildTileWidget(
                            context: context,
                            title: AppString.transactionStatus,
                            isSuccess: true,
                            value: widget.transfer?.status ?? ''),
                        const Gap(height: 40),
                        const DottedLineWidget(),
                        const Gap(height: 48),
                        Text(AppString.transactionStatusMessage,
                            style: context.headlineMedium?.copyWith(
                                color: AppColors.kSecondaryTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                            textAlign: TextAlign.center),
                        const Gap(height: 26),
                      ],
                    ),
                  ))
                ]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ReceiptActionSheet(
                  image: () async => await screenshotController.capture().then(
                      (value) async =>
                          await AppHelper.shareReceipt(uint8list: value)),
                  pdf: () async => await AppHelper.shareReceipt(
                      widget: await generateTransferReceipt(widget.transfer))),
            )
          ],
        ),
      );

  Row _buildTileWidget(
          {required BuildContext context,
          required String title,
          required String value,
          bool isSuccess = false}) =>
      Row(
        children: [
          Expanded(
              child: Text(title,
                  style: context.headlineMedium?.copyWith(
                      color: AppColors.kSecondaryTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  textAlign: TextAlign.left)),
          Expanded(
              child: Text(value,
                  style: context.headlineMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isSuccess ? AppColors.kColorGreen : null),
                  textAlign: TextAlign.right)),
        ],
      );
}
