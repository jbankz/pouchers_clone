import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/features/requests/domain/model/request_model.dart';
import 'package:pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:pouchers/ui/widgets/edit_text_field_with.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/gap.dart';
import '../../../../authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import '../../../../transfer/presentation/notifier/transfer_notifier.dart';
import '../../../domain/dto/request_dto.dart';
import '../../../domain/enum/request_money_action.dart';
import 'decline_requested_money_sheet.form.dart';

@FormView(fields: [FormTextField(name: 'note')])
class DeclineRequestedMoneySheet extends ConsumerStatefulWidget {
  const DeclineRequestedMoneySheet({super.key, required this.request});

  final RequestModel? request;

  @override
  ConsumerState<DeclineRequestedMoneySheet> createState() =>
      _DeclineRequestedMoneySheetState();
}

class _DeclineRequestedMoneySheetState
    extends ConsumerState<DeclineRequestedMoneySheet>
    with $DeclineRequestedMoneySheet {
  final CancelToken _cancelToken = CancelToken();

  late TransferNotifier _transferNotifier;

  @override
  void initState() {
    super.initState();
    _transferNotifier = ref.read(transferNotifierProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) {
    final transactionState = ref.watch(transferNotifierProvider);
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        minimum:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: double.infinity,
          padding:
              EdgeInsets.only(left: 16.w, top: 32.h, right: 16.w, bottom: 16.h),
          margin: EdgeInsets.symmetric(horizontal: 11.w),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppString.declineReason,
                  style: context.titleMedium?.copyWith(
                      fontSize: 18,
                      color: AppColors.kPrimaryTextColor,
                      fontWeight: FontWeight.w500)),
              const Gap(height: 9),
              RichText(
                text: TextSpan(
                    text: AppString.aboutToDecline,
                    style: context.titleLarge?.copyWith(
                        color: AppColors.kIconGrey,
                        fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                          text: widget.request?.amount.toNaira
                              .replaceAll('.00', ''),
                          style: context.titleLarge?.copyWith(
                              color: AppColors.kPrimaryTextColor,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: ' from ',
                          style: context.titleLarge?.copyWith(
                              color: AppColors.kIconGrey,
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text:
                              '${widget.request?.firstName ?? ''} ${widget.request?.lastName ?? ''}',
                          style: context.titleLarge?.copyWith(
                              color: AppColors.kPrimaryTextColor,
                              fontWeight: FontWeight.w700))
                    ]),
              ),
              const Gap(height: 16),
              Material(
                child: EditTextFieldWidget(
                    readOnly: transactionState.isBusy,
                    title: AppString.password,
                    titleWidget: Row(
                      children: [
                        Text('Add note',
                            style: context.titleLarge?.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.kPrimaryTextColor),
                            maxLines: 1),
                        const Gap(width: 3),
                        Flexible(
                          child: Text('(Optional)',
                              style: context.titleLarge?.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kSecondaryTextColor),
                              maxLines: 1),
                        )
                      ],
                    ),
                    label: 'Type here...',
                    maxLines: 3,
                    alignLabelWithHint: true,
                    controller: noteController,
                    focusNode: noteFocusNode,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {}),
              ),
              const Gap(height: 32),
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 350),
                  child: transactionState.isBusy
                      ? const CupertinoActivityIndicator()
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => PageRouter.pop(),
                              child: Text(AppString.cancel,
                                  style: context.titleMedium?.copyWith(
                                      fontSize: 18,
                                      color: AppColors.kSecondaryTextColor,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const Gap(width: 45),
                            Flexible(
                              child: GestureDetector(
                                onTap: () => _triggerPinVerification(ref),
                                child: Text(AppString.confirm,
                                    style: context.titleMedium?.copyWith(
                                        fontSize: 18,
                                        color: AppColors.kPrimaryColor,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ],
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _triggerPinVerification(WidgetRef ref) async {
    final pin =
        await BottomSheets.showSheet(child: const PinConfirmationSheet())
            as String?;

    if (pin != null) {
      _transferNotifier.requestedMoney(
        requestDto: RequestDto(
            requestedMoneyAction: RequestMoneyAction.decline,
            requestId: widget.request?.requestId,
            transactionPin: pin,
            reason: noteController.text.isEmpty ? null : noteController.text),
        cancelToken: _cancelToken,
      );
    }
  }
}
