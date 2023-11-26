import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/ui/features/dashboard/views/card/presentation/notifier/card_notifier.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../../common/app_images.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/dialog/bottom_sheet.dart';
import '../../../../../../widgets/elevated_button_widget.dart';
import '../../../../../../widgets/gap.dart';
import '../../../../../profile/data/dao/user_dao.dart';
import '../../data/dao/card_dao.dart';
import '../../domain/dto/card_dto.dart';
import '../../domain/enum/currency.dart';
import '../../domain/util/card_icon.dart';
import 'widgets/card_empty_state.dart';
import 'widgets/card_type.dart';

class VirtualCardView extends ConsumerStatefulWidget {
  const VirtualCardView({super.key});

  @override
  ConsumerState<VirtualCardView> createState() => _VirtualCardViewState();
}

class _VirtualCardViewState extends ConsumerState<VirtualCardView> {
  late CardNotifier _cardNotifier;
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _cardNotifier = ref.read(cardNotifierProvider.notifier)
        ..getCards(CardDto(userId: userDao.user.userId), _cancelToken);
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
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(AppString.myCards, style: context.displayLarge)),
      body: ValueListenableBuilder<Box>(
          valueListenable: cardsDao.getListenable(),
          builder: (_, box, __) {
            final cards = cardsDao.fetchCards(box);
            if (appState.isBusy && cards.isEmpty) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (cards.isEmpty) return const CardEmptyState();

            return SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemCount: cards.length,
                        separatorBuilder: (_, __) => const Gap(height: 40),
                        itemBuilder: (_, index) {
                          final card = cards[index];
                          return InkWell(
                            onTap: () => _cardNotifier.navigateToDetails(card),
                            borderRadius: BorderRadius.circular(16.r),
                            child: Hero(
                              tag: card.sudoId ?? '',
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 21.w, vertical: 13.h),
                                decoration: BoxDecoration(
                                    color: card.currency == Currency.NGN
                                        ? AppColors.kGreen100Color
                                        : AppColors.kPurple400,
                                    borderRadius: BorderRadius.circular(16.r),
                                    image: DecorationImage(
                                        image: AssetImage(AppImage.ellipses),
                                        fit: BoxFit.cover)),
                                child: Column(
                                  children: [
                                    const Gap(height: 42),
                                    Image.asset(
                                        card.currency == Currency.NGN
                                            ? AppImage.virtualNaira
                                            : AppImage.virtualDollar,
                                        height: 71.h,
                                        width: 71.w),
                                    const Gap(height: 9),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Virtual Naira card',
                                                style: context.displayLarge
                                                    ?.copyWith(
                                                        color: AppColors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                              const Gap(height: 4),
                                              Text(
                                                AppHelper.maskNumber(
                                                    card.accountNumber ?? ''),
                                                style: context.displayLarge
                                                    ?.copyWith(
                                                        color: AppColors.white
                                                            .withOpacity(.80),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SvgPicture.asset(
                                            CardIcon.returnIcon(card.brand))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  if (cards.length != 2)
                    ElevatedButtonWidget(
                        title: cards.first.currency == Currency.NGN
                            ? AppString.createDollarCard
                            : AppString.createNairaCard,
                        onPressed: () => BottomSheets.showSheet(
                            child:
                                CardTypeWidget(currency: cards.first.currency)))
                ],
              ),
            );
          }),
    );
  }
}
