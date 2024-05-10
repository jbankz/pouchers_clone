import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/profile/data/dao/user_dao.dart';
import 'package:pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:pouchers/ui/features/profile/presentation/notifier/user_notifier.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../widgets/gap.dart';

class RequestChangeOfPhoneNumberView extends ConsumerStatefulWidget {
  const RequestChangeOfPhoneNumberView({super.key});

  @override
  ConsumerState<RequestChangeOfPhoneNumberView> createState() =>
      _RequestChangeOfPhoneNumberViewState();
}

class _RequestChangeOfPhoneNumberViewState
    extends ConsumerState<RequestChangeOfPhoneNumberView> {
  final CancelToken _cancelToken = CancelToken();

  late UserNotifier _userNotifier;

  @override
  void initState() {
    super.initState();
    _userNotifier = ref.read(userNotifierProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(AppString.changePhoneNumber)),
        body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    Text(AppString.verifyAccount,
                        style: context.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 24)),
                    const Gap(height: 8),
                    Text(AppString.requestPhoneHint,
                        style: context.titleLarge?.copyWith(fontSize: 16))
                  ],
                )),
                ElevatedButtonWidget(
                  title: AppString.sendCode,
                  loading: ref.watch(userNotifierProvider).isBusy,
                  onPressed: () => _userNotifier.requestPhoneNumberOtp(
                      UserDto(email: userDao.user.email),
                      cancelToken: _cancelToken),
                )
              ],
            )),
      );
}
