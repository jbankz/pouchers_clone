import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../common/app_strings.dart';
import '../../../../../../../widgets/gap.dart';
import '../../../../../../authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import '../../../domain/dto/card_dto.dart';
import '../../../domain/enum/card_status.dart';
import '../../../domain/enum/currency.dart';
import '../../notifier/card_notifier.dart';
import '../../notifier/module/module.dart';
import 'freeze_info_sheet.dart';

class ManageCardSheet extends ConsumerStatefulWidget {
  const ManageCardSheet({super.key});

  @override
  ConsumerState<ManageCardSheet> createState() => _ManageCardSheetState();
}

class _ManageCardSheetState extends ConsumerState<ManageCardSheet> {
  late CardNotifier _cardNotifier;
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cardId = ref.read(paramModule.notifier).cardDetail?.sudoId ?? '';

      _cardNotifier = ref.read(cardNotifierProvider.notifier)
        ..getVirtualCardDetails(CardDto(sudoId: cardId), _cancelToken);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final cardState = ref.watch(cardNotifierProvider);

    final data = cardState.virtualCardDetails;
    return Wrap(
      children: [
        SizedBox(
          width: double.infinity,
          child: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('${AppString.manage} card',
                      style: context.titleMedium?.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w700)),
                  const Gap(height: 35),
                  Row(
                    children: [
                      Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.paleLavenderGray),
                          child: SvgPicture.asset(AppImage.freeze,
                              fit: BoxFit.scaleDown)),
                      const Gap(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppString.freezeCard,
                                style: context.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 16)),
                            const Gap(height: 1),
                            Text(AppString.freezeCardInfo,
                                style: context.displaySmall?.copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 12)),
                          ],
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 350),
                        child: cardState.isBusy
                            ? const CupertinoActivityIndicator()
                            : Switch.adaptive(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: data?.status == CardStatus.inactive,
                                onChanged: (value) =>
                                    _triggerPinVerification(ref, value)),
                      )
                    ],
                  ),
                  const Gap(height: 35),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> _triggerPinVerification(WidgetRef ref, bool value) async {
    if (value) {
      await BottomSheets.showAlertDialog(
          barrierDismissible: false, child: const FreezeCardInfoSheet());
    } else {
      final pin =
          await BottomSheets.showSheet(child: const PinConfirmationSheet())
              as String?;

      if (pin != null) {
        _cardNotifier.freezeCard(
            CardDto(
                sudoId: ref.read(paramModule.notifier).cardDetail?.sudoId,
                status: CardStatus.active,
                currency: ref.read(paramModule.notifier).isNairaCardType
                    ? Currency.NGN
                    : Currency.USD,
                transactionPin: pin),
            _cancelToken);
      }
    }
  }
}
