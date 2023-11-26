import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/card_notifier.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../app/config/app_helper.dart';
import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_images.dart';
import '../../../../../../widgets/gap.dart';
import '../../domain/enum/currency.dart';
import '../../domain/util/card_icon.dart';

class VirtualCardDetailView extends ConsumerStatefulWidget {
  const VirtualCardDetailView({super.key});

  @override
  ConsumerState<VirtualCardDetailView> createState() =>
      _VirtualCardDetailViewState();
}

class _VirtualCardDetailViewState extends ConsumerState<VirtualCardDetailView> {
  late CardNotifier _cardNotifier;
  final CancelToken _cancelToken = CancelToken();
  late String _cardId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _cardId = ref.read(paramModule.notifier).cardDetail?.sudoId ?? '';
      _cardNotifier = ref.read(cardNotifierProvider.notifier)
        ..getAccountBalance(CardDto(sudoId: _cardId));
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
    final card = param.cardDetail;
    return Scaffold(
      appBar: AppBar(title: Text(param.appTitle)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            Hero(
              tag: card?.sudoId ?? '',
              child: Container(
                height: 206.h,
                decoration: BoxDecoration(
                    color: card?.currency == Currency.NGN
                        ? AppColors.kGreen100Color
                        : AppColors.kPurple400,
                    borderRadius: BorderRadius.circular(16.r),
                    image: DecorationImage(
                        image: AssetImage(AppImage.ellipses),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        card?.currency == Currency.NGN
                            ? AppImage.curvedNairaIcon
                            : AppImage.curvedDollarIcon,
                        height: 85.h,
                        width: 85.w,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 19.w, vertical: 18.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Balance',
                                  style: context.titleLarge
                                      ?.copyWith(color: AppColors.white)),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 350),
                                child: appState.isBusy
                                    ? const CupertinoActivityIndicator(
                                        color: Colors.white)
                                    : Text(
                                        param.cardDetail?.currency ==
                                                Currency.NGN
                                            ? appState.virtualAccountBalance
                                                    ?.currentBalance?.toNaira ??
                                                ''
                                            : appState
                                                    .virtualAccountBalance
                                                    ?.currentBalance
                                                    ?.toDollar ??
                                                '',
                                        style: context.displayLarge?.copyWith(
                                            color: AppColors.white,
                                            fontSize: 24),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.fromLTRB(19.w, 9.h, 16.w, 19.h),
                          decoration: BoxDecoration(
                              color: AppColors.kDeepPurple,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(16.r))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      card?.accountName?.titleCase ?? '',
                                      style: context.displayLarge?.copyWith(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Gap(height: 4),
                                    Text(
                                      AppHelper.maskNumber(
                                          card?.accountNumber ?? ''),
                                      style: context.displayLarge?.copyWith(
                                          color:
                                              AppColors.white.withOpacity(.80),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(CardIcon.returnIcon(card?.brand))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Gap(height: 32),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(
                    context: context,
                    icon: AppImage.fundCardIcon,
                    label: 'Fund card',
                    onTap: () {}),
                const Gap(width: 40),
                _buildActionButton(
                    context: context,
                    width: 78,
                    icon: AppImage.cardDetailIcon,
                    label: AppString.cardDetail,
                    onTap: () => _cardNotifier.triggerDetails()),
                const Gap(width: 40),
                _buildActionButton(
                    context: context,
                    width: 51,
                    icon: AppImage.manageIcon,
                    label: AppString.manage,
                    onTap: () async {
                      await _cardNotifier.triggerManageCard();
                      _cardNotifier
                          .getVirtualCardDetails(CardDto(sudoId: _cardId));
                    }),
              ],
            ),
            const Gap(height: 49),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(AppString.transactionHistory,
                  style: context.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.kDarkFill)),
            ),
            const Gap(height: 14),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 10,
                separatorBuilder: (_, __) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: const Divider(),
                ),
                itemBuilder: (_, index) => Row(
                  children: [
                    Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.kContainerColor),
                        child: SvgPicture.asset(AppImage.sendGreen,
                            fit: BoxFit.scaleDown)),
                    const Gap(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Card funding',
                              style: context.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.kDarkFill),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          const Gap(height: 1),
                          Text('12 sep, 2022',
                              style: context.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 14))
                        ],
                      ),
                    ),
                    Text(
                      '+ ₦407,000.00 ',
                      style: context.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.kDarkFill),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _buildActionButton(
          {required BuildContext context,
          required String icon,
          required String label,
          required void Function()? onTap,
          double width = 66}) =>
      SizedBox(
        width: width,
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 36.h,
                width: 36.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kPrimaryColor.withOpacity(.90)),
                child: SvgPicture.asset(icon, fit: BoxFit.scaleDown),
              ),
              const Gap(height: 6),
              Text(label, style: context.headlineMedium)
            ],
          ),
        ),
      );
}
