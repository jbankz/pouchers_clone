import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../common/app_colors.dart';
import '../../../domain/model/virtual_card_details/virtual_card_details.dart';
import 'card_details_tile.dart';

class CardBillingWindow extends StatelessWidget {
  const CardBillingWindow({super.key, required this.billingAddress});

  final BillingAddress? billingAddress;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
            color: AppColors.kBackgroundColor),
        child: Column(
          children: [
            BuildCardDetailsTile(
                title: AppString.billingAddress,
                value: billingAddress?.line1 ?? ''),
            const Gap(height: 20),
            BuildCardDetailsTile(
                title: AppString.zipCode,
                value: billingAddress?.postalCode ?? ''),
            const Gap(height: 20),
            BuildCardDetailsTile(
                title: AppString.city, value: billingAddress?.city ?? ''),
            const Gap(height: 20),
            BuildCardDetailsTile(
                title: AppString.state, value: billingAddress?.state ?? ''),
          ],
        ),
      );
}
