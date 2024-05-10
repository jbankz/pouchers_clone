import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/core/router/page_router.dart';
import '../features/requests/domain/model/filter_model.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet(
      {super.key, required this.filters, this.height = 286, this.title});

  final List<Filter> filters;
  final double? height;
  final Widget? title;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: SizedBox(
          height: height?.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null) title!,
              Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemBuilder: (_, index) {
                      final filterBy = filters[index];
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
                    itemCount: filters.length),
              ),
            ],
          ),
        ),
      );
}
