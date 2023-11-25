import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/features/admin/domain/model/envs/envs.dart';
import 'package:Pouchers/ui/features/admin/presentation/notifier/admin_notifier.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/card_type.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/currency.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/params_notifier.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../common/app_strings.dart';
import '../../../../../../../widgets/gap.dart';

class CardTypeWidget extends ConsumerStatefulWidget {
  const CardTypeWidget({super.key, this.currency});

  final Currency? currency;

  @override
  ConsumerState<CardTypeWidget> createState() => _CardTypeWidgetState();
}

class _CardTypeWidgetState extends ConsumerState<CardTypeWidget> {
  late ParamNotifier _paramNotifier;

  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _paramNotifier = ref.read(paramModule.notifier);
      ref.read(adminNotifierProvider.notifier).getEnvs();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(adminNotifierProvider);

    /// TODO: Reformat here

    final envs = (appState.data as List<Envs>);

    final Envs nairaCreation = envs.isEmpty
        ? Envs()
        : envs.singleWhere((env) => env.name == 'naira_card_creation_fee');

    final Envs dollarCreation = envs.isEmpty
        ? Envs()
        : envs.singleWhere((env) => env.name == 'dollar_card_creation_fee');
    return Wrap(
      children: [
        SizedBox(
          width: double.infinity,
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Text(AppString.cardType,
                      style: context.titleMedium?.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w700)),
                  const Gap(height: 31),
                  Skeleton(
                    isLoading: appState.isBusy,
                    skeleton: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, __) => Container(
                              height: 150.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.r),
                                  color: Colors.white),
                            ),
                        separatorBuilder: (_, __) => const Gap(height: 30),
                        itemCount: widget.currency != null ? 1 : 2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.currency != Currency.NGN)
                          _buildCardWidget(
                              title: 'Naira virtual card',
                              fee:
                                  num.parse(nairaCreation.value ?? '0').toNaira,
                              icon: AppImage.nairaSign,
                              color: AppColors.kGreen100Color,
                              callback: () {
                                _paramNotifier.setCardType(CardType.naira);
                                PageRouter.pushNamed(Routes.requestBVNView);
                              }),
                        if (widget.currency != Currency.NGN)
                          const Gap(height: 30),
                        if (widget.currency != Currency.USD)
                          _buildCardWidget(
                              title: 'Dollar virtual card',
                              fee: num.parse(dollarCreation.value ?? '0')
                                  .toDollar,
                              icon: AppImage.dollarSign,
                              color: AppColors.kBrightPurple,
                              callback: () {
                                _paramNotifier.setCardType(CardType.dollar);
                                PageRouter.pushNamed(Routes.requestBVNView);
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCardWidget(
          {required String icon,
          required String title,
          required String fee,
          required Color color,
          required Function() callback}) =>
      InkWell(
        borderRadius: BorderRadius.circular(13.r),
        onTap: callback,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(13.r)),
          padding: EdgeInsets.fromLTRB(25.w, 23.h, 22.h, 17.h),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: context.titleMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                  const Gap(height: 22),
                  Text(fee,
                      style: context.titleMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                  const Gap(height: 2),
                  Text(AppString.creationFeeApplies,
                      style: context.titleMedium?.copyWith(
                          color: AppColors.white.withOpacity(.80),
                          fontSize: 12))
                ],
              )),
              Container(
                height: 100.h,
                width: 100.w,
                padding: EdgeInsets.fromLTRB(12.w, 9.h, 12.w, 15.h),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white.withOpacity(.10)),
                child: Container(
                  height: 76.h,
                  width: 76.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white.withOpacity(.3)),
                  child: SvgPicture.asset(icon, fit: BoxFit.scaleDown),
                ),
              )
            ],
          ),
        ),
      );
}
