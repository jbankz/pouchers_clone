import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../../modules/account/screens/request/sent.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/gap.dart';
import '../../../../../notification/presentation/notifier/notification_notifier.dart';

class RequestOptionSheet extends HookConsumerWidget {
  const RequestOptionSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationState = ref.watch(notificationNotifierProvider);
    final int totalUnreadMessages =
        notificationState.unreadPaymentModel?.unreadPaymentRequestCount ?? 0;
    return SafeArea(
      minimum: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        width: double.infinity,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 250),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(AppString.requestMoney,
                      style: context.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 15)),
                ),
                const Gap(height: 31),
                InkWell(
                  onTap: () => PageRouter.pushNamed(Routes.transferMoneyView,
                      args: const TransferMoneyViewArguments(
                          isRequestingMoney: true)),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Flexible(
                          child: Text('New Requests',
                              style: context.headlineMedium?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kPrimaryTextColor)),
                        ),
                        Gap(width: 12),
                        if (totalUnreadMessages > 0)
                          Container(
                            height: 20.h,
                            width: 20.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2.5),
                                color: AppColors.kColorRed),
                            child: Text('$totalUnreadMessages',
                                style: context.bodyMedium?.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500)),
                          )
                      ],
                    ),
                  ),
                ),
                const Gap(height: 4),
                const Divider(),
                const Gap(height: 4),
                InkWell(
                  onTap: ()=> PageRouter.pushWidget(SentRequests()),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    color: Colors.transparent,
                    child: Text('Request History',
                        style: context.headlineMedium?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.kPrimaryTextColor)),
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
