import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../common/app_strings.dart';
import '../../../../../../../widgets/gap.dart';
import '../../notifier/card_notifier.dart';

class CardDetailsSheet extends ConsumerStatefulWidget {
  const CardDetailsSheet({super.key});

  @override
  ConsumerState<CardDetailsSheet> createState() => _CardDetailsSheetState();
}

class _CardDetailsSheetState extends ConsumerState<CardDetailsSheet> {
  late CardNotifier _cardNotifier;
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cardNotifier = ref.read(cardNotifierProvider.notifier)
        ..getVirtualCardDetails(
            CardDto(sudoId: ref.read(paramModule.notifier).cardDetail?.sudoId),
            _cancelToken);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(cardNotifierProvider);
    final param = ref.watch(paramModule);

    final data = appState.virtualCardDetails;
    return Wrap(
      children: [
        SizedBox(
          width: double.infinity,
          child: SafeArea(
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: appState.isBusy
                  ? const CupertinoActivityIndicator()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(AppString.cardDetail,
                              style: context.titleMedium?.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w700)),
                          const Gap(height: 13),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.w, vertical: 30.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: AppColors.kBackgroundColor),
                            child: Column(
                              children: [
                                _buildTile(
                                    context: context,
                                    title: AppString.cardNumber,
                                    value: data?.number ?? ''),
                                const Gap(height: 20),
                                _buildTile(
                                    context: context,
                                    title: AppString.cardCVV,
                                    value: data?.cvv ?? ''),
                                const Gap(height: 20),
                                _buildTile(
                                    context: context,
                                    title: AppString.cardExpiry,
                                    value:
                                        '${data?.expiryMonth ?? ''}/${data?.expiryYear ?? ''}'),
                                const Gap(height: 20),
                                _buildTile(
                                    context: context,
                                    title: AppString.cardName,
                                    value: param.cardDetail?.accountName
                                            ?.titleCase ??
                                        ''),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ),
        )
      ],
    );
  }

  GestureDetector _buildTile(
          {required BuildContext context,
          required String title,
          required String value}) =>
      GestureDetector(
        onTap: () => AppHelper.copy(value),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:
                    context.displaySmall?.copyWith(fontWeight: FontWeight.w400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            const Gap(width: 47),
            Expanded(
              child: Text(
                value,
                style: context.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Gap(width: 9),
            SvgPicture.asset(AppImage.copyIcon)
          ],
        ),
      );
}
