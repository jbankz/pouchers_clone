import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../app/core/router/page_router.dart';
import '../../../../../widgets/gap.dart';
import '../../../domain/model/filter_model.dart';

class RequestFilterSheet extends StatelessWidget {
  const RequestFilterSheet({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Wrap(
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemBuilder: (_, index) {
                  final filterBy = requestFilter[index];
                  return InkWell(
                      onTap: () => PageRouter.pop(filterBy),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        color: Colors.transparent,
                        child: Text(filterBy.key,
                            style: context.headlineMedium,
                            textAlign: TextAlign.left),
                      ));
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: requestFilter.length),
          ],
        ),
      );
}
