import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/gap.dart';
import '../../../../../notification/presentation/notifier/notification_notifier.dart';

class RequestOptionSheet extends ConsumerStatefulWidget {
  const RequestOptionSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RequestOptionSheetState();
}

class _RequestOptionSheetState extends ConsumerState<RequestOptionSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250))
      ..forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(AppString.requestMoney,
                    style: context.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 15)),
              ),
              const Gap(height: 31),
              SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                        .animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: InkWell(
                    onTap: () => PageRouter.pushNamed(Routes.transferMoneyView,
                        args: const TransferMoneyViewArguments(
                            isRequestingMoney: true)),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 13.h),
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(AppString.newRequest,
                                style: context.headlineMedium?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.kPrimaryTextColor)),
                          ),
                          const Gap(width: 12),
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
                ),
              ),
              const Gap(height: 4),
              const Divider(),
              const Gap(height: 4),
              SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                        .animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: InkWell(
                    onTap: () => PageRouter.pushNamed(Routes.requestView),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 13.h),
                      color: Colors.transparent,
                      child: Text(AppString.requestHistory,
                          style: context.headlineMedium?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.kPrimaryTextColor)),
                    ),
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
