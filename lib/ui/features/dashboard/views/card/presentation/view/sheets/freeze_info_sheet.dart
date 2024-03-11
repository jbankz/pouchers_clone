import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/card_status.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/card_notifier.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../common/app_colors.dart';
import '../../../../../../../common/app_strings.dart';
import '../../../../../../../widgets/gap.dart';
import '../../../../../../authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import '../../notifier/module/module.dart';

class FreezeCardInfoSheet extends ConsumerStatefulWidget {
  const FreezeCardInfoSheet({super.key});

  @override
  ConsumerState<FreezeCardInfoSheet> createState() =>
      _FreezeCardInfoSheetState();
}

class _FreezeCardInfoSheetState extends ConsumerState<FreezeCardInfoSheet> {
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final cardState = ref.watch(cardNotifierProvider);
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 34.h),
          margin: EdgeInsets.symmetric(horizontal: 11.w),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppString.whatThisMean,
                  style: context.titleMedium
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
              const Gap(height: 9),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppString.whatThisMean1,
                        style: context.titleLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.kIconGrey,
                            fontSize: 14,
                            height: 1.9)),
                    Text(AppString.whatThisMean2,
                        style: context.titleLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.kIconGrey,
                            fontSize: 14,
                            height: 1.9)),
                  ],
                ),
              ),
              const Gap(height: 45),
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 350),
                  child: cardState.isBusy
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
                                child: Text(AppString.freezeCard,
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
      ref.read(cardNotifierProvider.notifier).freezeCard(CardDto(
          cardId: ref.read(paramModule.notifier).cardDetail?.cardId,
          status: CardStatus.inactive,
          currency: ref.read(paramModule.notifier).isNairaCardType
              ? Currency.ngn
              : Currency.usd,
          transactionPin: pin));
    }
  }
}
