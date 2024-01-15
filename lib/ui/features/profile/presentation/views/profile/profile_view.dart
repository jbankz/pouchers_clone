import 'dart:io';

import 'package:Pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:Pouchers/ui/features/upload/domain/dto/upload_dto.dart';
import 'package:Pouchers/ui/widgets/dialog/bottom_sheet.dart';
import 'package:Pouchers/utils/date_picker.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

import '../../../../../../app/app.router.dart';
import '../../../../../../app/core/router/page_router.dart';
import '../../../../../../utils/image_picker.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_images.dart';
import '../../../../../common/app_strings.dart';
import '../../../../../widgets/gap.dart';
import '../../../../../widgets/profile_image.dart';
import '../../../../upload/presentation/notifier/upload_notifier.dart';
import '../../../data/dao/user_dao.dart';
import 'widget/update_fullname.dart';
import 'widget/update_gender.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  late UserNotifier _userNotifier;
  late UploadNotifier _uploadNotifier;
  final CancelToken _cancelToken = CancelToken();
  final ImagePickerHandler _imagePickerHandler = ImagePickerHandler();

  @override
  void initState() {
    super.initState();
    _userNotifier = ref.read(userNotifierProvider.notifier);
    _uploadNotifier = ref.read(uploadNotifierProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);
    final uploadState = ref.watch(uploadNotifierProvider);

    return ValueListenableBuilder<Box>(
        valueListenable: userDao.getListenable(),
        builder: (_, box, __) {
          final user = userDao.returnUser(box);
          final String name =
              '${user.firstName ?? ''} ${user.lastName ?? ''}'.titleCase;
          final bool isAccountVerified = user.tierLevels == 3;
          final bool isBVNVerified = (user.tierLevels) > 1;
          return Scaffold(
            backgroundColor: AppColors.kPurpleColor800,
            appBar: AppBar(
                backgroundColor: AppColors.kPurpleColor800,
                title: Text(AppString.profile)),
            body: SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: SingleChildScrollView(
                  child: Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  if (user.tierLevels != 3)
                    InkWell(
                      onTap: () =>
                          PageRouter.pushNamed(Routes.accountVerificationView),
                      borderRadius: BorderRadius.circular(8.r),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                            color: AppColors.kLightOrange100,
                            borderRadius: BorderRadius.circular(8.r),
                            border:
                                Border.all(color: AppColors.kLightOrange200)),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImage.shield),
                            const Gap(width: 7),
                            Expanded(
                              child: Text(AppString.completeAccount,
                                  style: context.titleLarge?.copyWith(
                                      color: AppColors.kLightOrange300,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                            ),
                            const Icon(Icons.navigate_next,
                                color: AppColors.kLightOrange200)
                          ],
                        ),
                      ),
                    ),
                  const Gap(height: 13),
                  ProfileImage(
                      image: user.profilePicture ?? '',
                      loading: uploadState.isBusy,
                      pickImage: () => _imagePickerHandler.pickImage(
                          file: (file) => _uploadNotifier.uploadProfilePic(
                              UploadDto(
                                  file: File(file.path),
                                  profilePicture: File(file.path).fileName),
                              _cancelToken))),
                  const Gap(height: 8),
                  Text(userDao.fullName,
                      style: context.headlineMedium
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center),
                  const Gap(height: 2),
                  Text(user.tag ?? '',
                      style: context.headlineMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kIconGrey),
                      textAlign: TextAlign.center),
                  const Gap(height: 9),
                  GestureDetector(
                    onTap: () => PageRouter.pushNamed(Routes.tierView),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.91.w, vertical: 1.38.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.91.r),
                              color: AppColors.kUnknownColor1,
                              border:
                                  Border.all(color: AppColors.kPurpleColor700)),
                          child: Text('Tier ${user.tierLevels}',
                              style: context.displayMedium?.copyWith(
                                  fontSize: 8, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center),
                        ),
                        const Gap(width: 10),
                        Flexible(
                          child: Text(AppString.upgradeNow,
                              style: context.displayMedium?.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                  const Gap(height: 25),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 23.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.white),
                    child: Column(
                      children: [
                        _buildTile(
                            context: context,
                            key: AppString.fullName,
                            value: name,
                            onTap: () {
                              if (isBVNVerified) return;
                              BottomSheets.showInputAlertDialog(
                                  barrierDismissible: false,
                                  child: const UpdateFullNameWidget());
                            }),
                        _buildTile(
                            context: context,
                            key: AppString.gender,
                            value: user.gender?.titleCase ?? '',
                            onTap: () {
                              if (isBVNVerified) return;
                              BottomSheets.showInputAlertDialog(
                                  barrierDismissible: false,
                                  child: const UpdateGenderWidget());
                            }),
                        _buildTile(
                            context: context,
                            key: AppString.phone,
                            value: user.phoneNumber ?? '',
                            onTap: () => PageRouter.pushNamed(
                                Routes.requestChangeOfPhoneNumberView)),
                        _buildTile(
                            context: context,
                            key: AppString.idVerification,
                            value: '',
                            trailing: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 5.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: user.tierLevels == 1
                                        ? AppColors.kLightOrange100
                                        : AppColors.kLightColorGreen),
                                child: Text(
                                    isAccountVerified
                                        ? AppString.incomplete
                                        : AppString.incomplete,
                                    style: context.headlineMedium?.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: isAccountVerified
                                            ? AppColors.kGreen100Color
                                            : AppColors.kLightOrange300))),
                            onTap: () => PageRouter.pushNamed(
                                Routes.accountVerificationView)),
                        _buildTile(
                            context: context,
                            key: AppString.dob,
                            value: user.dob ?? '',
                            isLoading: userState.isBusy,
                            onTap: () async {
                              if (isBVNVerified) return;

                              final date = await pickDate(
                                  dateOptions: DateOptions.past,
                                  onChange: (date) {}) as String?;
                              if (date != null) {
                                _userNotifier.updateProfile(UserDto(dob: date),
                                    cancelToken: _cancelToken);
                              }
                            }),
                        _buildTile(
                            context: context,
                            isLast: true,
                            key: AppString.tag,
                            value: user.tag ?? ''),
                      ],
                    ),
                  )
                ]),
              )),
            ),
          );
        });
  }

  GestureDetector _buildTile(
          {required BuildContext context,
          required String key,
          required String value,
          Widget? trailing,
          bool isLast = false,
          bool isLoading = false,
          void Function()? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(key,
                      style: context.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.kIconGrey),
                      textAlign: TextAlign.left),
                ),
                const Gap(width: 30),
                trailing ??
                    Expanded(
                        child: Text(value,
                            style: context.headlineMedium
                                ?.copyWith(fontWeight: FontWeight.w400),
                            textAlign: TextAlign.right,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis)),
                isLoading
                    ? const CupertinoActivityIndicator()
                    : const Icon(Icons.navigate_next,
                        color: AppColors.kSecondaryTextColor)
              ],
            ),
            if (!isLast)
              const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Gap(height: 7), Divider(), Gap(height: 15)])
          ],
        ),
      );
}
