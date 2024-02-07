import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/hint_widget.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

import '../../../../../../app/config/app_helper.dart';
import '../../notifier/wallet_notifier.dart';

class FundWalletView extends ConsumerStatefulWidget {
  const FundWalletView({super.key});

  @override
  ConsumerState<FundWalletView> createState() => _FundWalletViewState();
}

class _FundWalletViewState extends ConsumerState<FundWalletView> {
  late WalletNotifier _walletNotifier;
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    _walletNotifier = ref.read(walletNotifierProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(AppString.fundWallet)),
        body: ValueListenableBuilder<Box>(
            valueListenable: walletDao.getListenable(),
            builder: (_, box, __) {
              final wallet = walletDao.retrieve(box);
              return SafeArea(
                minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 30.h),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.kBackgroundColor,
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Column(
                                children: [
                                  Text(AppString.accountNumber,
                                      style: context.displaySmall),
                                  const Gap(height: 5),
                                  InkWell(
                                    onTap: () => AppHelper.copy(
                                        wallet.accountNumber ?? ''),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                            child: Text(
                                                wallet.accountNumber ?? '',
                                                style: context.displayLarge
                                                    ?.copyWith(
                                                        color: AppColors
                                                            .kPrimaryBlack,
                                                        fontSize: 32,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 3))),
                                        const Gap(width: 14),
                                        SvgPicture.asset(AppImage.copyIcon)
                                      ],
                                    ),
                                  ),
                                  const Gap(height: 33),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(AppString.accountName,
                                              style: context.displaySmall
                                                  ?.copyWith(
                                                      color:
                                                          AppColors.kIconGrey),
                                              textAlign: TextAlign.left)),
                                      Expanded(
                                          child: Text(
                                              wallet.accountName?.titleCase ??
                                                  '',
                                              style: context.headlineMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                              textAlign: TextAlign.right)),
                                    ],
                                  ),
                                  const Gap(height: 20),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(AppString.bankName,
                                              style: context.displaySmall
                                                  ?.copyWith(
                                                      color:
                                                          AppColors.kIconGrey),
                                              textAlign: TextAlign.left)),
                                      Expanded(
                                          child: Text(
                                              wallet.bankProvider?.titleCase ??
                                                  '',
                                              style: context.headlineMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                              textAlign: TextAlign.right)),
                                    ],
                                  ),
                                ],
                              )),
                          const Gap(height: 40),
                          Center(
                            child: Text(AppString.howToFund,
                                style: context.displayLarge?.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          ),
                          const Gap(height: 28),
                          HintWidget(hint: AppString.fundInstr1),
                          const Gap(height: 20),
                          HintWidget(
                              hint: '',
                              widget: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                      text: AppString.fundInstr2,
                                      style: context.titleLarge?.copyWith(
                                          color: AppColors.kIconGrey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                      children: [
                                        TextSpan(
                                            text: AppString.fundInstr3,
                                            style: context.titleLarge?.copyWith(
                                                color: AppColors.kIconGrey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700)),
                                        TextSpan(
                                            text: AppString.fundInstr4,
                                            style: context.titleLarge?.copyWith(
                                                color:
                                                    AppColors.kPrimaryTextColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: AppString.fundInstr5,
                                            style: context.titleLarge?.copyWith(
                                                color: AppColors.kIconGrey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700)),
                                      ]))),
                          const Gap(height: 20),
                          HintWidget(
                              hint:
                                  'Select ${wallet.bankProvider?.titleCase ?? ''}'),
                          const Gap(height: 20),
                          HintWidget(
                              hint:
                                  '${AppString.fundInstr7} "${wallet.accountNumber ?? ''}"'),
                          const Gap(height: 20),
                          HintWidget(hint: AppString.fundInstr8),
                        ],
                      ),
                    ),
                    const Gap(height: 16),
                    ElevatedButtonWidget(
                        title: AppString.completedFunding,
                        loading: ref.watch(walletNotifierProvider).isBusy,
                        onPressed: () async {
                          await _walletNotifier.getWalletBalance(_cancelToken);
                          PageRouter.pop();
                        })
                  ],
                ),
              );
            }),
      );
}
