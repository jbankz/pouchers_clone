import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/app_strings.dart';

class FrequencySheet extends StatefulWidget {
  const FrequencySheet({super.key});

  @override
  State<FrequencySheet> createState() => _FrequencySheetState();
}

class _FrequencySheetState extends State<FrequencySheet> {
  final List<String> _tabs = ['Day', 'Month'];
  late String _tab;
  final List<String> _weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  String _weekday = '';

  @override
  void initState() {
    super.initState();
    _tab = _tabs.first;
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20.w),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
          child: SizedBox(
            width: double.infinity,
            child: Wrap(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(AppString.selectFrequency,
                          style: context.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: AppColors.kPrimaryTextColor)),
                      const Gap(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: _tabs
                            .map((tab) => CupertinoButton(
                                  onPressed: () {
                                    _weekday = '';
                                    setState(() => _tab = tab);
                                  },
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 23.w),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 9.h),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: _tab == tab
                                                    ? AppColors.kPrimaryColor
                                                    : AppColors.kPurpleColor200,
                                                width: 2.w))),
                                    child: Text(tab,
                                        style: context.titleLarge?.copyWith(
                                            fontWeight: _tab == tab
                                                ? FontWeight.w700
                                                : FontWeight.w400,
                                            fontSize: 16,
                                            color: AppColors.kPrimaryTextColor),
                                        textAlign: TextAlign.center),
                                  ),
                                ))
                            .toList(),
                      ),
                      const Gap(height: 22),
                      PageTransitionSwitcher(
                        reverse: true,
                        transitionBuilder: (child, primary, secondary) =>
                            FadeThroughTransition(
                                animation: primary,
                                secondaryAnimation: secondary,
                                child: child),
                        child: _tab == _tabs.first
                            ? _buildDayWidget(context)
                            : _buildDateWidget(context),
                      ),
                      const Gap(height: 31),
                      if (_weekday.isNotEmpty)
                        Text(
                            _tab == _tabs.first
                                ? AppString.weekDays
                                    .replaceAll('weekday', _weekday)
                                : AppString.weekDates
                                    .replaceAll('date', _weekday),
                            style: context.titleLarge?.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 16),
                            textAlign: TextAlign.center),
                      const Gap(height: 15),
                      ElevatedButtonWidget(
                          title: AppString.proceed,
                          onPressed: () => PageRouter.pop(_weekday))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  GridView _buildDateWidget(BuildContext context) => GridView.builder(
      key: const ValueKey<String>('_buildDateWidget'),
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 31,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 14.w, crossAxisSpacing: 16.h, crossAxisCount: 7),
      itemBuilder: (_, index) {
        final bool isSelected = _weekday == (index + 1).ordinals;

        return CupertinoButton(
            onPressed: () {
              setState(() => _weekday = num.parse('${index + 1}').ordinals);
              HapticFeedback.selectionClick();
            },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                      width: 1.w,
                      color: isSelected
                          ? AppColors.kPrimaryColor
                          : Colors.transparent)),
              child: Text('${index + 1}',
                  style: context.titleLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.kDarkFill100)),
            ));
      });

  GridView _buildDayWidget(BuildContext context) => GridView.builder(
      key: const ValueKey<String>('_buildDayWidget'),
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _weekdays.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 14.w,
          crossAxisSpacing: 16.h,
          childAspectRatio: 1.8,
          crossAxisCount: 3),
      itemBuilder: (_, index) {
        final weekday = _weekdays[index];
        final bool isSelected = weekday == _weekday;
        return CupertinoButton(
          onPressed: () {
            setState(() => _weekday = weekday);
            HapticFeedback.selectionClick();
          },
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 2.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                    width: 1.w,
                    color: isSelected
                        ? AppColors.kPrimaryColor
                        : AppColors.kLightPurple)),
            child: Text(weekday,
                style: context.displayMedium?.copyWith(
                    fontSize: 16,
                    color: isSelected
                        ? AppColors.kPrimaryColor
                        : AppColors.kIconGrey,
                    fontWeight: FontWeight.w400)),
          ),
        );
      });
}
