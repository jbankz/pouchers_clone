import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/transfer/presentation/notifier/transfer_notifier.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/profile_image.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../utils/field_validator.dart';
import '../../../../widgets/dialog/bottom_sheet.dart';
import '../../../../widgets/edit_text_field_with.dart';
import '../../../authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import '../../../utilities/domain/dto/mobile_dto.dart';
import '../../../utilities/domain/enum/service_category.dart';
import '../../../utilities/presentation/views/sheet/frequency_sheet.dart';
import '../../domain/model/transfer.dart';
import 'schedule_transfer_view.form.dart';

@FormView(fields: [FormTextField(name: 'frequency')])
class ScheduleTransferMoneyView extends ConsumerStatefulWidget {
  const ScheduleTransferMoneyView({super.key, this.transfer});

  final Transfer? transfer;

  @override
  ConsumerState<ScheduleTransferMoneyView> createState() =>
      _ScheduleTransferMoneyViewState();
}

class _ScheduleTransferMoneyViewState
    extends ConsumerState<ScheduleTransferMoneyView>
    with $ScheduleTransferMoneyView {
  late TransferNotifier _transferNotifier;

  final CancelToken _cancelToken = CancelToken();
  String _frequency = '';

  @override
  void initState() {
    super.initState();
    _transferNotifier = ref.read(transferNotifierProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final transferState = ref.watch(transferNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(AppString.scheduleTransfer)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                const Gap(height: 50),
                Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 30.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.kBackgroundColor,
                          borderRadius: BorderRadius.circular(7.r)),
                      child: Column(
                        children: [
                          const Gap(height: 12),
                          _buildTile(
                              title: AppString.accountName,
                              value: widget.transfer?.receiverName?.titleCase ??
                                  ''),
                          const Gap(height: 30),
                          _buildTile(
                              title: AppString.poucherTag,
                              value: widget.transfer?.receiverTag ?? ''),
                          const Gap(height: 30),
                          _buildTile(
                              title: AppString.amount,
                              value: (widget.transfer?.amount ?? 0).toNaira),
                        ],
                      ),
                    ),
                    const Positioned(top: -50, child: ProfileImage(image: '')),
                  ],
                ),
                const Gap(height: 29),
                EditTextFieldWidget(
                    title: AppString.choosePeriod,
                    label: AppString.frequency,
                    controller: frequencyController,
                    focusNode: frequencyFocusNode,
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    validator: FieldValidator.validateFrequency(_frequency),
                    suffixIcon: _frequency.isEmpty
                        ? const Icon(Icons.keyboard_arrow_down_outlined,
                            color: AppColors.kSecondaryTextColor)
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (_frequency.isNotEmpty)
                                Flexible(
                                  child: Text(_frequency,
                                      style: context.titleLarge?.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.kPurpleColor)),
                                ),
                              const Icon(Icons.keyboard_arrow_down_outlined,
                                  color: AppColors.kSecondaryTextColor),
                              if (_frequency.isNotEmpty) const Gap(width: 16)
                            ],
                          ),
                    onTap: () async {
                      final response = await BottomSheets.showSheet(
                          child: const FrequencySheet()) as String;
                      if (response.isNotEmpty) {
                        _frequency = 'Every $response';
                      }
                      setState(() {});
                    }),
                const Gap(height: 14),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, animation) =>
                      SizeTransition(sizeFactor: animation, child: child),
                  child: 1 < 2
                      ? const SizedBox.shrink()
                      : Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: AppColors.kBlueColor.withOpacity(.2)),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppImage.notification,
                                  color: AppColors.kBlueColor),
                              const Gap(width: 5),
                              Expanded(
                                  child: Text(
                                      'Next top-up date is ${DateTime.now().dayMonthTime1}',
                                      style: PageRouter
                                          .globalContext.headlineMedium
                                          ?.copyWith(
                                              color: AppColors.kBlueColor200,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left)),
                            ],
                          ),
                        ),
                )
              ],
            )),
            ElevatedButtonWidget(
                title: AppString.save,
                loading: transferState.isBusy,
                onPressed: () async {
                  final pin = await BottomSheets.showSheet(
                      child: const PinConfirmationSheet()) as String?;
                  if (pin != null) _submit(pin);
                })
          ],
        ),
      ),
    );
  }

  Row _buildTile({required String title, required String value}) => Row(
        children: [
          Expanded(
              child: Text(title,
                  style: PageRouter.globalContext.headlineMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.kIconGrey),
                  textAlign: TextAlign.left)),
          Expanded(
              child: Text(value,
                  style: PageRouter.globalContext.headlineMedium
                      ?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.right)),
        ],
      );

  Future<void> _submit(String pin) => _transferNotifier.schedule(
      mobileDto: MobileDto(
          category: ServiceCategory.p2p,
          subCategory: 'none',
          frequency: _frequency,
          tag: widget.transfer?.receiverTag,
          amount: widget.transfer?.amount,
          note: widget.transfer?.note,
          transactionPin: pin),
      cancelToken: _cancelToken);
}
