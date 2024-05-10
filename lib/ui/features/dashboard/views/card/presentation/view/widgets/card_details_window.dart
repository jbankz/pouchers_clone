import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../common/app_colors.dart';
import '../../../domain/model/virtual_card_details/virtual_card_details.dart';
import 'card_details_tile.dart';

class CardDetailsWindow extends StatelessWidget {
  const CardDetailsWindow({super.key, required this.cardDetail});

  final VirtualCardDetails? cardDetail;

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
                title: AppString.cardNumber, value: cardDetail?.number ?? ''),
            const Gap(height: 20),
            BuildCardDetailsTile(
                title: AppString.cardCVV, value: cardDetail?.cvv2 ?? ''),
            const Gap(height: 20),
            BuildCardDetailsTile(
                title: AppString.cardExpiry,
                value:
                    '${cardDetail?.expiryMonth ?? ''}/${cardDetail?.expiryYear ?? ''}'),
            const Gap(height: 20),
            BuildCardDetailsTile(
                title: AppString.cardName,
                value: cardDetail?.customer?.name?.titleCase ?? ''),
          ],
        ),
      );
}
