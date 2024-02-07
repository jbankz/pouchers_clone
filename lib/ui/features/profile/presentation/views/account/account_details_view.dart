import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../app/config/app_helper.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/gap.dart';
import '../../../data/dao/wallet_dao.dart';

class AccountDetailsView extends StatelessWidget {
  const AccountDetailsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(AppString.accountDetails)),
        body: ValueListenableBuilder<Box>(
            valueListenable: walletDao.getListenable(),
            builder: (_, box, __) {
              final wallet = walletDao.retrieve(box);
              return SafeArea(
                minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.kUnknownColor3),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(AppImage.ngn),
                            const Gap(width: 4),
                            Flexible(
                              child: Text('NGN',
                                  style: context.headlineMedium?.copyWith(
                                      color: AppColors.kUnknownColor2,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                  textAlign: TextAlign.center),
                            ),
                            const Gap(width: 4),
                            SvgPicture.asset(AppImage.arrowDown),
                          ],
                        ),
                      ),
                    ),
                    const Gap(height: 12),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 18.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.kBackgroundColor,
                            borderRadius: BorderRadius.circular(16.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppString.accountName,
                                style: context.displaySmall
                                    ?.copyWith(color: AppColors.kIconGrey),
                                textAlign: TextAlign.left),
                            Gap(height: 7.5.h),
                            Text(wallet.accountName?.titleCase ?? '',
                                style: context.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                                textAlign: TextAlign.left),
                            const Gap(height: 22),
                            Text(AppString.accountNumber,
                                style: context.displaySmall
                                    ?.copyWith(color: AppColors.kIconGrey),
                                textAlign: TextAlign.left),
                            Gap(height: 7.5.h),
                            GestureDetector(
                              onTap: () =>
                                  AppHelper.copy(wallet.accountNumber ?? ''),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                        wallet.accountNumber?.titleCase ?? '',
                                        style: context.headlineMedium?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                        textAlign: TextAlign.left,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const Gap(width: 3.75),
                                  SvgPicture.asset(AppImage.copyIcon)
                                ],
                              ),
                            ),
                            const Gap(height: 22),
                            Text(AppString.bankName,
                                style: context.displaySmall
                                    ?.copyWith(color: AppColors.kIconGrey),
                                textAlign: TextAlign.left),
                            Gap(height: 7.5.h),
                            Text(wallet.bankProvider?.titleCase ?? '',
                                style: context.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                                textAlign: TextAlign.left)
                          ],
                        )),
                  ],
                ),
              );
            }),
      );
}
