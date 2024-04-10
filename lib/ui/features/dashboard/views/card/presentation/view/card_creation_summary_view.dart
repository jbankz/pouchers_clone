import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/features/admin/data/dao/env_dao.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/enum/card_activity_type.dart';
import 'package:pouchers/ui/features/dashboard/views/card/domain/enum/card_status.dart';
import 'package:pouchers/ui/features/dashboard/views/card/presentation/notifier/card_notifier.dart';
import 'package:pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:pouchers/ui/features/dashboard/views/card/presentation/notifier/params_notifier.dart';
import 'package:pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:pouchers/ui/features/profile/presentation/notifier/wallet_notifier.dart';
import 'package:pouchers/ui/features/profile/presentation/views/wallet/widget/balance_indicator_widget.dart';
import 'package:pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';

import '../../../../../../common/app_strings.dart';
import '../../../../../admin/domain/enum/fees.dart';
import '../../../../../authentication/presentation/view/pin/sheet/pin_confirmation_sheet.dart';
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
  final CancelToken _cancelToken = CancelToken();

  num _amount = 0;

  @override
  void initState() {
    _cardNotifier = ref.read(cardNotifierProvider.notifier);
    _amount = widget.cardDto.amount ?? 0;
    super.initState();
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

        final envs = envDao.envs;

        final totalNairaFee = _cardNotifier.calculateCreationFeeTotalNairaFee(
            envs,
            amount: _amount.toDouble(),
            isFunding: !param.isCreatingCardActivity);
        final totalDollarFee = _cardNotifier.calculateCreationFeeTotalDollarFee(
            envs,
            amount: _amount.toDouble(),
            isFunding: !param.isCreatingCardActivity);

        final bool insufficient = (_amount + totalNairaFee) >
            num.parse((walletDao.wallet.balance ?? '0'));

        final adminEnv = envs.firstWhereOrNull(
            (element) => element.name == Fees.currentDollarRate);

        final dollarRate = num.tryParse(adminEnv?.value ?? '0') ?? 0;

        final grandTotal = param.isNairaCardType
            ? (_amount + totalNairaFee)
            : ((totalDollarFee + _amount) * dollarRate);

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
                                  ? _amount.toNaira
                                  : _amount.toDollar),
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
                          if (!param.isCreatingCardActivity)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _tileWidget(
                                    context: context,
                                    title: AppString.fundingFee,
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
                                    value: (totalDollarFee + _amount).toDollar),
                                const Gap(height: 30),
                                _tileWidget(
                                    context: context,
                                    title: AppString.totalInNaira,
                                    value: ((totalDollarFee + _amount) *
                                            dollarRate)
                                        .toNaira),
                                const Gap(height: 30),
                                RichText(
                                    text: TextSpan(
                                        text: AppString.currentExchangeRate,
                                        style: context.titleLarge?.copyWith(
                                            fontWeight: FontWeight.w400),
                                        children: [
                                      TextSpan(
                                          text:
                                              '\$${1} = ${dollarRate.toNaira.replaceAll('.00', '')}',
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
                                    ? (_amount + totalNairaFee).toNaira
                                    : (_amount + totalDollarFee).toDollar),
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
                              text: grandTotal.toNaira,
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
                    BalanceIndicatorWidget(amount: grandTotal),
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
                              _handleActivity(pin, param, totalNairaFee,
                                  totalDollarFee, dollarRate);
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
            amount: _amount,
            // amount: _amount + totalNairaFee,
            country: param.country,
            transactionPin: pin,
            brand: CardBrand.verve,
            currency: Currency.ngn),
        _cancelToken);
  }

  void _createDollarCard(
      num totalDollarFee, ParamNotifier param, String pin, num dollarRate) {
    _cardNotifier.createDollarVirtualCard(
        CardDto(
            amount: _amount,
            // amount: ((totalDollarFee + _amount) * dollarRate),
            country: param.country,
            transactionPin: pin,
            brand: CardBrand.visa,
            currency: Currency.usd),
        _cancelToken);
  }

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
                  style: context.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.kPrimaryTextColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.right))
        ],
      );

  void _handleActivity(String pin, ParamNotifier param, num totalNairaFee,
      num totalDollarFee, num dollarRate) {
    switch (param.cardActivityType) {
      case CardActivityType.creating:
        param.isNairaCardType
            ? _createNairaCard(totalNairaFee, param, pin)
            : _createDollarCard(totalDollarFee, param, pin, dollarRate);
        return;
      case CardActivityType.funding:
        _fundVirtualCard(
            totalDollarFee, totalDollarFee, param, pin, dollarRate);
    }
  }

  void _fundVirtualCard(num totalNairaFee, num totalDollarFee,
      ParamNotifier param, String pin, num dollarRate) {
    _cardNotifier.fundVirtualCard(
        CardDto(
            amount: _amount,
            // amount: param.isNairaCardType
            //     ? (_amount + totalNairaFee)
            //     : ((totalDollarFee + _amount) * dollarRate),
            transactionPin: pin,
            currency: param.isNairaCardType ? Currency.ngn : Currency.usd),
        _cancelToken);
  }
}
