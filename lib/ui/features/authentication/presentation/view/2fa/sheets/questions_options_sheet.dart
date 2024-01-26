import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/app/core/skeleton/widgets.dart';
import 'package:Pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionsOptionsSheet extends ConsumerStatefulWidget {
  const QuestionsOptionsSheet({super.key});

  @override
  ConsumerState<QuestionsOptionsSheet> createState() =>
      _QuestionsOptionsSheetState();
}

class _QuestionsOptionsSheetState extends ConsumerState<QuestionsOptionsSheet> {
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Skeleton(
          isLoading: authState.isBusy,
          skeleton: ListView.separated(
              shrinkWrap: authState.isBusy,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemBuilder: (_, index) => Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r)),
                  ),
              separatorBuilder: (_, __) => const Column(
                    children: [Gap(height: 4), Divider(), Gap(height: 4)],
                  ),
              itemCount: 5),
          child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemBuilder: (_, index) {
                final question = authState.securityQuestion[index];
                return InkWell(
                  onTap: () => PageRouter.pop(question),
                  child: Text(question.question ?? '',
                      style: context.headlineMedium, textAlign: TextAlign.left),
                );
              },
              separatorBuilder: (_, __) => const Column(
                    children: [Gap(height: 4), Divider(), Gap(height: 4)],
                  ),
              itemCount: authState.securityQuestion.length),
        ),
      ),
    );
  }
}
