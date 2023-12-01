import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/ui/widgets/hint_widget.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/app_strings.dart';

class TwoFaGoogleAuthenticatorCodeGeneratorView extends ConsumerStatefulWidget {
  const TwoFaGoogleAuthenticatorCodeGeneratorView({super.key});

  @override
  ConsumerState<TwoFaGoogleAuthenticatorCodeGeneratorView> createState() =>
      _TwoFaGoogleAuthenticatorCodeGeneratorViewState();
}

class _TwoFaGoogleAuthenticatorCodeGeneratorViewState
    extends ConsumerState<TwoFaGoogleAuthenticatorCodeGeneratorView> {
  late AuthNotifier _authNotifier;
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _authNotifier = ref.read(authNotifierProvider.notifier)
        ..generateTwoFaToken(cancelToken: _cancelToken);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(AppString.authentication)),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                const Gap(height: 168),
                InkWell(
                  onTap: () => AppHelper.copy(
                      authState.generate2faToken?.twoFactorTempSecret ?? ''),
                  borderRadius: BorderRadius.circular(300.r),
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 58.w, vertical: 11.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(300.r),
                        color: AppColors.kBackgroundColor),
                    child: Text(
                        _splitStringIntoGroups(
                            authState.generate2faToken?.twoFactorTempSecret ??
                                ''),
                        style: context.headlineLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.kSecondaryPurple),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                const Gap(height: 17),
                GestureDetector(
                  onTap: () => AppHelper.copy(
                      authState.generate2faToken?.twoFactorTempSecret ?? ''),
                  child: Text(
                    AppString.tapToCopy1,
                    style: context.headlineMedium?.copyWith(
                        color: AppColors.kIconGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(height: 45),
                HintWidget(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    hint: AppString.tokenHint1),
                const Gap(height: 20),
                HintWidget(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    hint: AppString.tokenHint2),
              ],
            )),
            ElevatedButtonWidget(
                loading: authState.isBusy,
                title: AppString.complete,
                onPressed: () async => PageRouter.pushNamed(
                    Routes.twoFaGoogleAuthenticatorCodeView)),
          ],
        ),
      ),
    );
  }

  String _splitStringIntoGroups(String input, {int groupSize = 4}) {
    try {
      final RegExp regExp = RegExp('.{1,$groupSize}');
      final Iterable<Match> matches = regExp.allMatches(input);

      return matches.map((match) => match.group(0)!).join(' ');
    } catch (_) {
      return input;
    }
  }
}
