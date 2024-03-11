import 'dart:math';

import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/domain/dto/card_dto.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/card_notifier.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/module/module.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_images.dart';
import '../../../../../../widgets/empty_state_widget.dart';
import '../../../../../../widgets/gap.dart';
import '../../domain/model/cards/cards.dart';
import 'widgets/back_card_view_widget.dart';
import 'widgets/front_card_view_widget.dart';

class VirtualCardDetailView extends ConsumerStatefulWidget {
  const VirtualCardDetailView({super.key});

  @override
  ConsumerState<VirtualCardDetailView> createState() =>
      _VirtualCardDetailViewState();
}

class _VirtualCardDetailViewState extends ConsumerState<VirtualCardDetailView>
    with SingleTickerProviderStateMixin {
  late CardNotifier _cardNotifier;
  final CancelToken _cancelToken = CancelToken();
  Cards? _card;

  late AnimationController _animationController;
  late Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;
  final RefreshController _refreshController = RefreshController();
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(end: 1, begin: 0).animate(_animationController)
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) => _animationStatus = status);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _card = ref.read(paramModule.notifier).cardDetail;
      _cardNotifier = ref.read(cardNotifierProvider.notifier);
      _refresh();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  void _flip() {
    if (_animationStatus == AnimationStatus.dismissed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  Future<void> _refresh() async {
    try {
      await _cardNotifier.getAccountBalance(CardDto(cardId: _card?.accountId));
      await _cardNotifier.getVirtualCardDetails(CardDto(cardId: _card?.cardId));
      await _cardNotifier.getCardTransactions(CardDto(cardId: _card?.cardId));
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(cardNotifierProvider);

    final param = ref.watch(paramModule);
    final card = param.cardDetail;

    final bool isBack = _animation.value >= 0.5;

    final transactions = appState.transactions;

    return Scaffold(
      appBar: AppBar(title: Text(param.cardDetailsTitle)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SmartRefresher(
          controller: _refreshController,
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: card?.cardId ?? '',
                  child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY((pi * _animation.value)),
                      child: GestureDetector(
                          onTap: _flip,
                          child: isBack
                              ? Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateY((pi)),
                                  child: const BackCardViewWidget())
                              : const FrontCardViewWidget())),
                ),
                const Gap(height: 32),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton(
                        context: context,
                        icon: AppImage.fundCardIcon,
                        label: AppString.fundCard,
                        onTap: () => _cardNotifier.navigateToFundCard()),
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
                          _cardNotifier.getVirtualCardDetails(
                              CardDto(cardId: _card?.cardId));
                        }),
                  ],
                ),
                const Gap(height: 49),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppString.transactionHistory,
                      style: context.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.kDarkFill)),
                ),
                const Gap(height: 14),
                transactions.isEmpty
                    ? Column(mainAxisSize: MainAxisSize.min, children: [
                        const Gap(height: 61),
                        EmptyStateWidget(
                            icon: AppImage.emptyTransactionIcon,
                            message: 'No transactions yet')
                      ])
                    : Flexible(
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: transactions.length,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (_, __) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                child: const Divider()),
                            itemBuilder: (_, index) => Row(
                                  children: [
                                    Container(
                                        height: 40.h,
                                        width: 40.w,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.kContainerColor),
                                        child: SvgPicture.asset(
                                            AppImage.sendGreen,
                                            fit: BoxFit.scaleDown)),
                                    const Gap(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Card funding',
                                              style: context.titleLarge
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      color:
                                                          AppColors.kDarkFill),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis),
                                          const Gap(height: 1),
                                          Text('12 sep, 2022',
                                              style: context.titleLarge
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14))
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
                                )),
                      )
              ],
            ),
          ),
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
