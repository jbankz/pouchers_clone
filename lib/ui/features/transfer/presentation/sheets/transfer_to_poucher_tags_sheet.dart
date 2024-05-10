import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/profile/data/dao/contacts_dao.dart';
import 'package:pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:pouchers/ui/widgets/profile_image.dart';
import 'package:pouchers/utils/debouncer.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../utils/field_validator.dart';
import '../../../../common/app_colors.dart';
import '../../../../widgets/edit_text_field_with.dart';
import '../../../../widgets/gap.dart';
import '../../../profile/domain/model/user.dart';
import '../../../profile/presentation/notifier/user_notifier.dart';
import 'transfer_to_poucher_tags_sheet.form.dart';

@FormView(fields: [FormTextField(name: 'tag')])
class TransferToPoucherTagSheet extends ConsumerStatefulWidget {
  const TransferToPoucherTagSheet({super.key, this.isRequestingMoney = false});

  final bool isRequestingMoney;

  @override
  ConsumerState<TransferToPoucherTagSheet> createState() =>
      _TransferToPoucherTagSheetState();
}

class _TransferToPoucherTagSheetState
    extends ConsumerState<TransferToPoucherTagSheet>
    with $TransferToPoucherTagSheet {
  late UserNotifier _userNotifier;

  final CancelToken _cancelToken = CancelToken();

  final _debouncer = Debouncer();

  PermissionStatus? _permission;
  bool isRequestingMoney = false;
  @override
  void initState() {
    super.initState();
    tagFocusNode.requestFocus();
    isRequestingMoney = widget.isRequestingMoney;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _userNotifier = ref.read(userNotifierProvider.notifier);
      _checkContactPermission();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
    disposeForm();
  }

  Future<void> _checkContactPermission() async {
    _permission = await Permission.contacts.request();
    if (_permission?.isGranted ?? false) _userNotifier.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);

    return AnimatedSize(
      duration: const Duration(milliseconds: 350),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: SafeArea(
          minimum:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Text(
                  isRequestingMoney
                      ? AppString.requestMoney
                      : AppString.sendMoney,
                  style: context.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const Gap(height: 31),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      EditTextFieldWidget(
                        controller: tagController,
                        focusNode: tagFocusNode,
                        title: isRequestingMoney
                            ? AppString.requestMoneyFrom
                            : AppString.sendTo,
                        label: AppString.enterPoucherTag,
                        validator: FieldValidator.validateString(),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.search,
                        prefix: IconButton(
                          onPressed: () {},
                          icon: Text(
                            '@',
                            style: context.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        suffixIcon: userState.isGettingUserByTag
                            ? const CupertinoActivityIndicator()
                            : const SizedBox.shrink(),
                        onChanged: (value) => _debouncer.run(
                          () => _userNotifier.getUserByTag(
                            UserDto(tag: value),
                            cancelToken: _cancelToken,
                          ),
                        ),
                      ),
                      const Gap(height: 20),
                      if (userState.user != null)
                        InkWell(
                          onTap: () => PageRouter.pop(userState.user),
                          child: Row(
                            children: [
                              ProfileImage(
                                image: userState.user?.profilePicture ?? '',
                                height: 38,
                                width: 38,
                              ),
                              const Gap(width: 15),
                              Expanded(
                                child: Text(
                                  '${userState.user?.firstName?.titleCase ?? ''} ${userState.user?.lastName?.titleCase ?? ''}',
                                  style: context.titleMedium?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                const Gap(height: 16),
                Builder(builder: (_) {
                  if (!(_permission?.isGranted ?? false)) {
                    return _buildNonContactPermittedWidget(context);
                  }

                  return ValueListenableBuilder<Box>(
                      valueListenable: contactDao.getListenable(),
                      builder: (_, box, __) {
                        final contacts = contactDao.retrieve(box);

                        if (contacts.isEmpty) return const SizedBox.shrink();

                        return Container(
                            height: context.height * .3,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: _buildContactsWidget(context, contacts));
                      });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildContactsWidget(BuildContext context, List<User> contacts) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contacts',
              style: context.headlineMedium?.copyWith(
                  fontSize: 14,
                  color: AppColors.kPrimaryBlack,
                  fontWeight: FontWeight.w500),
              maxLines: 1),
          const Gap(height: 16),
          Flexible(
            child: ListView.separated(
                itemBuilder: (_, index) {
                  final contact = contacts[index];
                  final String fullName =
                      '${contact.firstName?.titleCase ?? ''} ${contact.lastName?.titleCase ?? ''}';
                  return Row(
                    children: [
                      ProfileImage(
                          image: contact.profilePicture ?? '',
                          height: 37.h,
                          width: 37.w),
                      const Gap(width: 11),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(fullName,
                              style: context.headlineMedium?.copyWith(
                                  color: AppColors.kPrimaryBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              maxLines: 1),
                          const Gap(height: 5),
                          Text(contact.tag ?? '',
                              style: context.headlineMedium?.copyWith(
                                  fontSize: 12,
                                  color: AppColors.kSecondaryTextColor,
                                  fontWeight: FontWeight.w400),
                              maxLines: 1)
                        ],
                      )),
                      const Gap(width: 11),
                      const Spacer(),
                      InkWell(
                        onTap: () => PageRouter.pop(contact),
                        borderRadius: BorderRadius.circular(8.r),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 19.w, vertical: 8.h),
                          decoration: BoxDecoration(
                              color: AppColors.kPurple100,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Text(AppString.send,
                              style: context.headlineMedium?.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white)),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: contacts.length),
          ),
        ],
      );

  InkWell _buildNonContactPermittedWidget(BuildContext context) => InkWell(
        onTap: () => _checkContactPermission(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppImage.searchContact),
                  const Gap(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.chooseFromContact,
                          style: context.titleMedium?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Gap(height: 2),
                        Text(
                          AppString.chooseFromContactInst,
                          style: context.titleMedium?.copyWith(
                            fontSize: 12,
                            color: AppColors.kIconGrey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Gap(height: 8),
                        Text(
                          AppString.enableContact,
                          style: context.titleMedium?.copyWith(
                            fontSize: 12,
                            color: AppColors.kPurpleColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(height: 8),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
