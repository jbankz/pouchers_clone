import 'package:pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../app/core/router/page_router.dart';
import '../../../../../../widgets/gap.dart';

class DisableReasonSheet extends ConsumerWidget {
  const DisableReasonSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemBuilder: (_, index) {
              final reason = userState.disableReason[index];
              return InkWell(
                onTap: () => PageRouter.pop(reason),
                child: Text(reason,
                    style: context.headlineMedium, textAlign: TextAlign.left),
              );
            },
            separatorBuilder: (_, __) => const Column(
                  children: [Gap(height: 4), Divider(), Gap(height: 4)],
                ),
            itemCount: userState.disableReason.length),
      ),
    );
  }
}
