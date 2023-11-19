import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/app_strings.dart';

class UtilityBillView extends StatefulWidget {
  const UtilityBillView({super.key});

  @override
  State<UtilityBillView> createState() => _UtilityBillViewState();
}

class _UtilityBillViewState extends State<UtilityBillView> {
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(AppString.utilityBill)),
        body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      Text(AppString.validBillInst,
                          style: context.titleLarge?.copyWith(fontSize: 14)),
                      const Gap(height: 35),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            color: AppColors.kBackgroundColor,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Row(
                          children: [
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 13.h),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(AppImage.uploadIcon),
                                    const Gap(width: 8),
                                    Flexible(
                                        child: Text(AppString.uploadFile,
                                            style: context.displayMedium
                                                ?.copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)))
                                  ],
                                ),
                              ),
                            ),
                            const Gap(width: 21),
                            Expanded(
                                child: Text(
                              'Receipt.jpg',
                              style: context.headlineMedium?.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ))
                          ],
                        ),
                      ),
                      const Gap(height: 20),
                      Text(AppString.uploadFileInst1,
                          style: context.displayMedium?.copyWith(
                              color: AppColors.kIconGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      const Gap(height: 2),
                      Text(AppString.uploadFileInst2,
                          style: context.displayMedium?.copyWith(
                              color: AppColors.kIconGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
                ElevatedButtonWidget(title: AppString.submit, onPressed: () {}),
              ],
            )),
      );
}
