import 'dart:async';

import 'package:Pouchers/ui/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/login/screens/login.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class DisableSuccessful extends StatefulWidget {
  static const String routeName = "disableSuccessful";
  final bool? isDelete;

  DisableSuccessful({Key? key, this.isDelete = false}) : super(key: key);

  @override
  State<DisableSuccessful> createState() => _DisableSuccessfulState();
}

class _DisableSuccessfulState extends State<DisableSuccessful> {
  Timer? customTimer;

  int refreshTime = 5;

  @override
  void initState() {
    super.initState();
    activateTimer();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  activateTimer() {
    customTimer = new Timer.periodic(Duration(seconds: 01), (Timer _timer) {
      if (refreshTime == 0) {
        _timer.cancel();
        Future.delayed(Duration(seconds: 2)).then(
          (value) => pushToAndClearStack(
            context,
            widget.isDelete! ? OnboardingView() : LogInAccount(),
          ),
        );
      } else {
        setState(() {
          refreshTime = refreshTime - 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        onTap: () {
          widget.isDelete!
              ? pushToAndClearStack(context, OnboardingView())
              : pushToAndClearUntil(context, LogInAccount(),
                  routeName: LogInAccount.routeName);
        },
        child: ListenerPage(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetPaths.success, height: 200, width: 200),
              SizedBox(
                height: kMacroPadding,
              ),
              Text(
                dataSuccess,
                style: textTheme.headline1,
              ),
              SizedBox(
                height: kPadding,
              ),
              Text(
                widget.isDelete! ? weHateDelete : weHateSub,
                textAlign: TextAlign.center,
                style: textTheme.bodyText1!
                    .copyWith(fontWeight: FontWeight.normal, height: 1.5),
              ),
              SizedBox(
                height: kMicroPadding,
              ),
              Text(
                refreshTime == 0 ? redirect : loggingOut,
                style: textTheme.headline2!.copyWith(fontSize: 18),
              ),
            ],
          ),
        ));
  }
}
