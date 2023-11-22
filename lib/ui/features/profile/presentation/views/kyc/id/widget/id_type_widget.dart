import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/features/profile/domain/model/idenitification_type.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/valid_id_notifier.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../common/app_strings.dart';
import '../../../../../../../widgets/gap.dart';

class IdTypesWidget extends ConsumerWidget {
  const IdTypesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(AppString.idType,
                    style: context.titleMedium
                        ?.copyWith(fontSize: 15, fontWeight: FontWeight.w500)),
                const Gap(height: 31),
                ...(ref.watch(validIdNotifierProvider).data
                        as List<IdentificationType>)
                    .map((type) => InkWell(
                          onTap: () => PageRouter.pop(type),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 23.w,
                                    right: 23.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                child: Text(type.key,
                                    style: context.titleMedium?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ),
                              const Divider()
                            ],
                          ),
                        ))
              ],
            ),
          ),
        ),
      );
}
