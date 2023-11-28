import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:Pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:Pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../app/core/router/page_router.dart';
import '../../../../domain/enum/gender_enum.dart';

class UpdateGenderWidget extends ConsumerStatefulWidget {
  const UpdateGenderWidget({super.key});

  @override
  ConsumerState<UpdateGenderWidget> createState() => _UpdateGenderWidgetState();
}

class _UpdateGenderWidgetState extends ConsumerState<UpdateGenderWidget> {
  late UserNotifier _userNotifier;
  final CancelToken _cancelToken = CancelToken();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Gender? _gender;
  final List<Gender> _genders = [Gender.male, Gender.female];

  @override
  void initState() {
    super.initState();
    _gender = userDao.user.gender != null
        ? Gender.values.firstWhere(
            (element) => element.name == (userDao.user.gender ?? ''))
        : null;
    _userNotifier = ref.read(userNotifierProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 23.h),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppString.gender,
                style: context.headlineLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.kPrimaryTextColor),
              ),
              const Gap(height: 20),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final data = _genders[index];
                    final bool isSelected = _gender == data;
                    return GestureDetector(
                      onTap: () => setState(() => _gender = data),
                      child: Row(
                        children: [
                          Icon(
                              isSelected
                                  ? Icons.radio_button_on_outlined
                                  : Icons.radio_button_off_outlined,
                              color: isSelected
                                  ? AppColors.kPrimaryColor
                                  : AppColors.kPurpleColor400),
                          const Gap(width: 23),
                          Expanded(
                              child: Text(data.name.titleCase,
                                  style: context.headlineLarge?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.kPrimaryTextColor)))
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const Gap(height: 30),
                  itemCount: _genders.length),
              const Gap(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: userState.isBusy
                      ? const CupertinoActivityIndicator()
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => PageRouter.pop(),
                              child: Text(AppString.cancel,
                                  style: context.titleMedium?.copyWith(
                                      fontSize: 18,
                                      color: AppColors.kSecondaryTextColor,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const Gap(width: 45),
                            Flexible(
                              child: GestureDetector(
                                onTap: _submit,
                                child: Text(AppString.save,
                                    style: context.titleMedium?.copyWith(
                                        fontSize: 18,
                                        color: AppColors.kPrimaryColor,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ],
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    _userNotifier.updateProfile(UserDto(gender: _gender?.name),
        cancelToken: _cancelToken, success: () => PageRouter.pop());
  }
}
