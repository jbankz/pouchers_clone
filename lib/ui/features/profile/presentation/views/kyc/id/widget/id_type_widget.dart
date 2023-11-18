import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../common/app_strings.dart';
import '../../../../../../../widgets/gap.dart';

class IdTypesWidget extends StatelessWidget {
  const IdTypesWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(left: 23.w, right: 23.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(AppString.idType,
                  style: context.titleMedium
                      ?.copyWith(fontSize: 15, fontWeight: FontWeight.w500)),
              const Gap(height: 31),
              ...['Driver\'s license', 'NIN', 'Voter\'s card']
                  .map((e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 13.h),
                            child: Text(e,
                                style: context.titleMedium?.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                          ),
                          const Divider()
                        ],
                      ))
            ],
          ),
        ),
      );
}
