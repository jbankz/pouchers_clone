import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../../common/app_strings.dart';
import '../../../../payment/domain/dto/debit_card_dto.dart';
import '../../../../profile/presentation/views/wallet/widget/balance_indicator_widget.dart';
import '../../../domain/dto/summary_dto.dart';
import '../widget/utility_icon.dart';

class SummaryWidget extends StatefulWidget {
  const SummaryWidget({super.key, required this.summaryDto});

  final SummaryDto summaryDto;

  @override
  State<SummaryWidget> createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  final paymentOptions = [AppString.payWithCard, AppString.payWithUssd];

  String _paymentOption = AppString.payWithCard;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Box>(
        valueListenable: walletDao.getListenable(),
        builder: (_, box, __) {
          final bool isAffordable = (widget.summaryDto.amount ?? 0) >
              num.parse(walletDao.retrieve(box).balance ?? '0');

          return SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 20.w),
            child: Wrap(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildImage(),
                    const Gap(height: 5),
                    _buildTitle(),
                    const Gap(height: 70),
                    _buildSummaryContainer(),
                    if (!widget.summaryDto.isGuest) _buildBalanceIndicator(),
                    const Gap(height: 35),
                    if (widget.summaryDto.isGuest) _buildPaymentOptions(),
                    _buildProceedButton(isAffordable),
                  ],
                ),
              ],
            ),
          );
        },
      );

  // Widget _buildImage() => Container(
  //       height: 70.h,
  //       width: 70.w,
  //       decoration: const BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: AppColors.paleLavenderGray,
  //       ),
  //       child: CachedNetworkImage(
  //         height: 34.h,
  //         width: 34.w,
  //         imageUrl: widget.summaryDto.imageUrl ?? '',
  //         errorWidget: (_, __, ___) => const SizedBox.shrink(),
  //       ),
  //     );

  Widget _buildImage() => UtitlityIcon(image: widget.summaryDto.imageUrl ?? '');

  Widget _buildTitle() => Text(
        widget.summaryDto.title ?? '',
        style: context.titleLarge?.copyWith(color: AppColors.kPrimaryTextColor),
        textAlign: TextAlign.center,
      );

  Widget _buildSummaryContainer() => Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color: AppColors.kContainerColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRow('Recipient', widget.summaryDto.recipient ?? '',
                widget: widget.summaryDto.recipientWidget),
            const Gap(height: 22),
            _buildRow('Amount', widget.summaryDto.amount?.toNaira ?? ''),
            const Gap(height: 22),
            _buildRow('Fee', widget.summaryDto.fee?.toNaira ?? ''),
            const Gap(height: 22),
            if (!widget.summaryDto.isGuest)
              _buildRow('Cashback', widget.summaryDto.cashBack?.toNaira ?? ''),
          ],
        ),
      );

  Widget _buildBalanceIndicator() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(height: 35),
          BalanceIndicatorWidget(amount: widget.summaryDto.amount ?? 0),
        ],
      );

  Widget _buildPaymentOptions() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.paymentOption,
            style: context.headlineMedium?.copyWith(
              color: AppColors.kIconGrey,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.left,
          ),
          const Gap(height: 20),
          _buildPaymentOptionsList(),
          const Gap(height: 54),
        ],
      );

  Widget _buildPaymentOptionsList() => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final paymentOption = paymentOptions[index];
          final bool isSelected = _paymentOption == paymentOption;

          return InkWell(
            borderRadius: BorderRadius.circular(9.r),
            onTap: () => setState(() => _paymentOption = paymentOption),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 17.5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                border: Border.all(
                  color: isSelected
                      ? AppColors.kPrimaryColor
                      : AppColors.kLightPurple,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    isSelected
                        ? Icons.radio_button_on_outlined
                        : Icons.radio_button_off_outlined,
                    color: isSelected
                        ? AppColors.kPrimaryColor
                        : AppColors.kPurpleColor400,
                  ),
                  const Gap(width: 10),
                  Flexible(
                    child: Text(
                      paymentOption,
                      style: context.headlineMedium?.copyWith(
                        color: AppColors.kPrimaryTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const Gap(height: 18),
        itemCount: 2,
      );

  Widget _buildProceedButton(bool isAffordable) => ElevatedButtonWidget(
        title: widget.summaryDto.isGuest
            ? AppString.proceed
            : 'Pay ${widget.summaryDto.amount?.toNaira}',
        onPressed: widget.summaryDto.isGuest
            ? () async {
                _handleCardPayment();
              }
            : (isAffordable ? null : () => PageRouter.pop(true)),
      );

  Widget _buildRow(String title, String content, {Widget? widget}) => Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: context.titleLarge?.copyWith(color: AppColors.kIconGrey),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: widget ??
                Text(
                  content,
                  style: context.titleLarge?.copyWith(
                      color: AppColors.kPrimaryTextColor,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.right,
                ),
          ),
        ],
      );

  Future<void> _handleCardPayment() async {
    final response = _paymentOption == paymentOptions.first
        ? await PageRouter.pushNamed(Routes.debitCardView,
            args: DebitCardViewArguments(
                amount: widget.summaryDto.amount?.toNaira)) as DebitCardDto?
        : await PageRouter.pushNamed(Routes.ussdView,
            args: UssdViewArguments(
                amount: widget.summaryDto.amount?.toNaira)) as DebitCardDto?;

    PageRouter.pop(response);

    // if (response != null) {
    //   PageRouter.pushNamed(Routes.successState,
    //       args: SuccessStateArguments(
    //           title: AppString.rechargeSuccessful,
    //           message: AppString.completedAirtimePurchase,
    //           btnTitle: AppString.proceed,
    //           tap: () => PageRouter.popToRoot(Routes.guestView)));
    // }
  }
}
