import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/app/core/state/app_state.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/card_activity_type.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/enum/card_status.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/card_notifier.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/params_notifier.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/wallet_notifier.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/app_strings.dart';
import '../../../../../admin/domain/model/envs/envs.dart';
import '../../../../../admin/presentation/notifier/admin_notifier.dart';
import '../../../../../authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
import '../../../../../profile/domain/model/wallet.dart';
import '../../../../../profile/presentation/state/wallet_state.dart';
import '../../domain/dto/card_dto.dart';
import '../../domain/enum/card_brand.dart';
import '../../domain/enum/currency.dart';

class CardCreationSymmaryView extends ConsumerStatefulWidget {
  const CardCreationSymmaryView({super.key, required this.cardDto});

  final CardDto cardDto;

  @override
  ConsumerState<CardCreationSymmaryView> createState() =>
      _CardCreationSymmaryViewState();
}

class _CardCreationSymmaryViewState
    extends ConsumerState<CardCreationSymmaryView> {
  late CardNotifier _cardNotifier;
  late WalletNotifier _walletNotifier;
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    _cardNotifier = ref.read(cardNotifierProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _walletNotifier = ref.read(walletNotifierProvider.notifier)
        ..getWalletBalance(_cancelToken);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) => HookConsumer(builder: (_, ref, __) {
        final cardState = ref.watch(cardNotifierProvider);
        final param = ref.watch(paramModule);
        final walletState = ref.watch(walletNotifierProvider);
        final appState = ref.watch(adminNotifierProvider);

        final envs = appState.data;

        final totalNairaFee = _cardNotifier.calculateTotalNairaFee(envs);
        final totalDollarFee = _cardNotifier.calculateTotalDollarFee(envs);

        final bool insufficient =
            ((widget.cardDto.amount ?? 0) + totalNairaFee) >
                num.parse((walletState.data as Wallet?)?.balance ?? '0');

        return Scaffold(
          appBar: AppBar(title: Text(param.appTitle)),
          body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    Text(AppString.confirmation,
                        style: context.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700)),
                    const Gap(height: 24),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 30.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          color: AppColors.kContainerColor),
                      child: Column(
                        children: [
                          _tileWidget(
                              context: context,
                              title: AppString.amount,
                              value: param.isNairaCardType
                                  ? (widget.cardDto.amount ?? 0).toNaira
                                  : (widget.cardDto.amount ?? 0).toDollar),
                          const Gap(height: 30),
                          if (param.isCreatingCardActivity)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _tileWidget(
                                    context: context,
                                    title: AppString.creationFee,
                                    value: param.isNairaCardType
                                        ? totalNairaFee.toNaira
                                        : totalDollarFee.toDollar),
                                const Gap(height: 30),
                              ],
                            ),
                          if (!param.isNairaCardType)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _tileWidget(
                                    context: context,
                                    title: AppString.totalInDollar,
                                    value: (totalDollarFee +
                                            (widget.cardDto.amount ?? 0))
                                        .toDollar),
                                const Gap(height: 30),
                                _tileWidget(
                                    context: context,
                                    title: AppString.totalInNaira,
                                    value: ((totalDollarFee +
                                                (widget.cardDto.amount ?? 0)) *
                                            (param.exchangeRate ?? 0))
                                        .toNaira),
                                const Gap(height: 30),
                                RichText(
                                    text: TextSpan(
                                        text: 'Current exchange rate ',
                                        style: context.titleLarge?.copyWith(
                                            fontWeight: FontWeight.w400),
                                        children: [
                                      TextSpan(
                                          text:
                                              '\$${1} = ${(param.exchangeRate ?? 0).toNaira.replaceAll('.00', '')}',
                                          style: context.titleLarge?.copyWith(
                                              color: AppColors.kIconGrey,
                                              fontWeight: FontWeight.w500)),
                                    ])),
                              ],
                            ),
                          if (param.isNairaCardType)
                            _tileWidget(
                                context: context,
                                title: AppString.total,
                                value: param.isNairaCardType
                                    ? ((widget.cardDto.amount ?? 0) +
                                            totalNairaFee)
                                        .toNaira
                                    : ((widget.cardDto.amount ?? 0) +
                                            totalDollarFee)
                                        .toDollar),
                        ],
                      ),
                    ),
                    const Gap(height: 36),
                    RichText(
                        text: TextSpan(
                            text: AppString.youWillDebited,
                            style: context.titleLarge?.copyWith(
                                color: AppColors.kIconGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            children: [
                          TextSpan(
                              text: param.isNairaCardType
                                  ? ((widget.cardDto.amount ?? 0) +
                                          totalNairaFee)
                                      .toNaira
                                  : ((totalDollarFee +
                                              (widget.cardDto.amount ?? 0)) *
                                          (param.exchangeRate ?? 0))
                                      .toNaira,
                              style: context.titleLarge?.copyWith(
                                  color: AppColors.kPrimaryTextColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                          TextSpan(
                              text: AppString.fromWallet,
                              style: context.titleLarge?.copyWith(
                                  color: AppColors.kIconGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ])),
                    const Gap(height: 113),
                    !insufficient
                        ? _buildBalaceIndicator(walletState, context)
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildBalaceIndicator(walletState, context),
                              const Spacer(),
                              if (!walletState.isBusy && insufficient)
                                InkWell(
                                  borderRadius: BorderRadius.circular(8.r),
                                  onTap: () async {
                                    await PageRouter.pushNamed(
                                        Routes.fundWalletView);
                                    _walletNotifier
                                        .getWalletBalance(_cancelToken);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                        color: AppColors.kPurpleColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Text(
                                      AppString.fundWallet,
                                      style: context.titleLarge?.copyWith(
                                          color: AppColors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                )
                            ],
                          ),
                    const Gap(height: 9),
                    if (!walletState.isBusy && insufficient)
                      Text(
                        AppString.insufficientFund,
                        style: context.titleLarge?.copyWith(
                            color: AppColors.kColorOrange, fontSize: 12),
                      )
                  ],
                )),
                const Gap(height: 16),
                ElevatedButtonWidget(
                    title: param.appTitle,
                    loading: walletState.isBusy || cardState.isBusy,
                    onPressed: (walletState.isBusy ||
                            cardState.isBusy ||
                            insufficient)
                        ? null
                        : () async {
                            final pin = await BottomSheets.showSheet(
                                child: const PinConfirmationSheet()) as String?;
                            if (pin != null) {
                              _handleActivity(
                                  pin, param, totalNairaFee, totalDollarFee);
                            }
                          })
              ],
            ),
          ),
        );
      });

  void _createNairaCard(num totalNairaFee, ParamNotifier param, String pin) {
    _cardNotifier.createNairaVirtualCard(
        CardDto(
            amount: ((widget.cardDto.amount ?? 0) + totalNairaFee),
            country: param.country,
            bvn: param.bvn,
            transactionPin: pin,
            brand: CardBrand.Verve,
            currency: Currency.NGN),
        _cancelToken);
  }

  void _createDollarCard(num totalDollarFee, ParamNotifier param, String pin) {
    _cardNotifier.createDollarVirtualCard(
        CardDto(
            amount: ((totalDollarFee + (widget.cardDto.amount ?? 0)) *
                (param.exchangeRate ?? 0)),
            country: param.country,
            bvn: param.bvn,
            transactionPin: pin,
            brand: CardBrand.Visa,
            currency: Currency.USD),
        _cancelToken);
  }

  Row _buildBalaceIndicator(
          WalletState<dynamic> walletState, BuildContext context) =>
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 32.h,
              width: 32.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.kLightPurple),
              child:
                  SvgPicture.asset(AppImage.walletIcon, fit: BoxFit.scaleDown)),
          const Gap(width: 5),
          AnimatedSize(
            duration: const Duration(milliseconds: 350),
            reverseDuration: const Duration(milliseconds: 350),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              child: walletState.isBusy
                  ? const CupertinoActivityIndicator()
                  : Text(
                      'Balance - ${num.parse((walletState.data as Wallet?)?.balance ?? '0').toNaira}',
                      style: context.titleLarge?.copyWith(
                          color: AppColors.kPrimaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
            ),
          ),
        ],
      );

  Row _tileWidget(
          {required BuildContext context,
          required String title,
          required String value}) =>
      Row(
        children: [
          Expanded(
              child: Text(title,
                  style: context.bodyMedium?.copyWith(
                      color: AppColors.kIconGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left)),
          const Gap(width: 16),
          Expanded(
              child: Text(value,
                  style: context.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.right))
        ],
      );

  void _handleActivity(
      String pin, ParamNotifier param, num totalNairaFee, num totalDollarFee) {
    switch (param.cardActivityType) {
      case CardActivityType.creating:
        param.isNairaCardType
            ? _createNairaCard(totalNairaFee, param, pin)
            : _createDollarCard(totalDollarFee, param, pin);
        return;
      case CardActivityType.funding:
        _fundVirtualCard(totalDollarFee, totalDollarFee, param, pin);
    }
  }

  void _fundVirtualCard(
      num totalNairaFee, num totalDollarFee, ParamNotifier param, String pin) {
    _cardNotifier.fundVirtualCard(
        CardDto(
            amount: param.isNairaCardType
                ? ((widget.cardDto.amount ?? 0) + totalNairaFee)
                : ((totalDollarFee + (widget.cardDto.amount ?? 0)) *
                    (param.exchangeRate ?? 0)),
            transactionPin: pin,
            currency: param.isNairaCardType ? Currency.NGN : Currency.USD,
            status: CardStatus.active),
        _cancelToken);
  }
}
