import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/profile/data/dao/wallet_dao.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../../../../app/navigators/navigators.dart';
import '../../../../../../../modules/make_payment/screens/transfer_poucher_friend.dart';
import '../../../../../../common/app_colors.dart';
import '../../../../../../widgets/dialog/bottom_sheet.dart';
import '../../../../../transfer/presentation/sheets/transfer_money_sheet.dart';
import 'build_action_button.dart';

class BalanceWidget extends ConsumerWidget {
  const 
  BalanceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ValueListenableBuilder<Box>(
          valueListenable: walletDao.getListenable(),
          builder: (_, box, __) {
            final wallet = walletDao.retrieve(box);
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.kPrimaryColor),
              child: Column(
                children: [
                  Text(
                    AppString.totalBalance,
                    style: context.headlineLarge?.copyWith(
                        color: AppColors.kPurpleLight,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
                  ),
                  const Gap(height: 2),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                            walletDao.balanceVisibilty
                                ? num.parse(wallet.balance ?? '0').toNaira
                                : '*****',
                            style: context.headlineLarge?.copyWith(
                                fontSize: 28.sp, fontWeight: FontWeight.w700)),
                      ),
                      const Gap(width: 6),
                      GestureDetector(
                          onTap: () => walletDao.toggleBalanceVisibility(),
                          child: walletDao.balanceVisibilty
                              ? const Icon(Icons.visibility_off_outlined,
                                  color: AppColors.kSecondaryTextColor)
                              : const Icon(Icons.visibility_outlined,
                                  color: AppColors.kSecondaryTextColor))
                    ],
                  ),
                  const Gap(height: 29),
                  Row(
                    children: [
                      BuildActionButton(
                        icon: AppImage.walletOne,
                        title: AppString.fundWallet,
                        width: 65,
                        checkUsersLevel: false,
                        onTap: () =>
                            PageRouter.pushNamed(Routes.fundWalletView),
                      ),
                      Gap(width: 46.5.w),
                      BuildActionButton(
                          icon: AppImage.swap,
                          title: AppString.transfer,
                          width: 45,
                          onTap: () => BottomSheets.showSheet(
                              wrap: false, child: const TransferMoneySheet())),
                      Gap(width: 46.5.w),
                      BuildActionButton(
                          icon: AppImage.bag,
                          title: AppString.request,
                          width: 46,
                          onTap: () => pushTo(context,
                              const TransferPoucherFriend(isRequestMoney: true),
                              settings: const RouteSettings(
                                  name: TransferPoucherFriend.routeName)))
                    ],
                  ),
                  // const Gap(height: 18),
                  // InkWell(
                  //   onTap: () =>
                  //       PageRouter.pushNamed(Routes.accountDetailsView),
                  //   borderRadius: BorderRadius.circular(20.r),
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 16, vertical: 4),
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20.r),
                  //         color: AppColors.kUnknownColor),
                  //     child: Text(
                  //       AppString.viewAccount,
                  //       style: context.headlineLarge?.copyWith(
                  //           color: AppColors.kPrimaryColor,
                  //           fontWeight: FontWeight.w400,
                  //           fontSize: 12),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            );
          });
}
