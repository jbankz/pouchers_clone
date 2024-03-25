import 'dart:io';

import 'package:pouchers/app/core/state/app_state.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/features/upload/domain/dto/upload_dto.dart';
import 'package:pouchers/ui/features/upload/presentation/notifier/upload_notifier.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/app_strings.dart';

class UtilityBillView extends ConsumerStatefulWidget {
  const UtilityBillView({super.key});

  @override
  ConsumerState<UtilityBillView> createState() => _UtilityBillViewState();
}

class _UtilityBillViewState extends ConsumerState<UtilityBillView> {
  final CancelToken _cancelToken = CancelToken();
  late UploadNotifier _uploadNotifier;

  @override
  void initState() {
    super.initState();
    _uploadNotifier = ref.read(uploadNotifierProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final uploadState = ref.watch(uploadNotifierProvider);
    return Scaffold(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                      decoration: BoxDecoration(
                          color: AppColors.kBackgroundColor,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Row(
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: uploadState.isBusy
                                ? null
                                : _uploadNotifier.pickImage,
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
                                                  fontWeight: FontWeight.w400)))
                                ],
                              ),
                            ),
                          ),
                          const Gap(width: 21),
                          Expanded(
                              child: Text(
                            (uploadState.data as File?)?.fileName ?? '',
                            style: context.headlineMedium?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                          const Gap(width: 21),
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
              ElevatedButtonWidget(
                  title: AppString.submit,
                  loading: uploadState.isBusy,
                  onPressed: () => _submit(uploadState)),
            ],
          )),
    );
  }

  Future<void> _submit(AppState uploadState) async =>
      await _uploadNotifier.uploadFile(
          UploadDto(
              file: (uploadState.data as File?),
              utilityBill: (uploadState.data as File?)?.fileName),
          _cancelToken);
}
