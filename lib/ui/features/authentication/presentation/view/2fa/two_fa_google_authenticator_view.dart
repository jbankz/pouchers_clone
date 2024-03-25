import 'package:pouchers/app/config/app_helper.dart';
import 'package:pouchers/app/core/network/api_path.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/ui/common/app_images.dart';
import 'package:pouchers/ui/features/authentication/presentation/notifier/auth_notifier.dart';
import 'package:pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:pouchers/ui/widgets/gap.dart';
import 'package:pouchers/ui/widgets/outline_button_widget.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../app/app.router.dart';
import '../../../../../../app/core/router/page_router.dart';
import '../../../../../common/app_strings.dart';

class TwoFaGoogleAuthenticatorView extends ConsumerWidget {
  const TwoFaGoogleAuthenticatorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(title: Text(AppString.authentication)),
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  const Gap(height: 172.65),
                  SvgPicture.asset(AppImage.vault, fit: BoxFit.scaleDown),
                  const Gap(height: 63.65),
                  Text(
                    AppString.setUpGoogleAuth,
                    style: context.headlineMedium
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(height: 12),
                  Text(
                    AppString.setUpGoogleAuthHint,
                    style: context.headlineMedium?.copyWith(
                        fontSize: 14,
                        color: AppColors.kIconGrey,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
              ElevatedButtonWidget(
                loading: ref.watch(authNotifierProvider).isBusy,
                title: AppString.setUpGoogleDownloadAuthHint,
                onPressed: () => AppHelper.triggerUrl(ApiPath.authenticator),
              ),
              const Gap(height: 20),
              OutlineButtonWidget(
                  title: AppString.setUpGoogleDownloadedAlreadAuthHint,
                  onPressed: () => PageRouter.pushNamed(
                      Routes.twoFaGoogleAuthenticatorCodeGeneratorView))
            ],
          ),
        ),
      );
}
