import 'dart:io';

import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/widgets/elevated_button_widget.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ui/common/app_colors.dart';

mixin ResponseHandler {
  void handleExpiredToken() => _showLogoutDialog();

  void _showLogoutDialog() {
    const Text content = Text('Your session has expired',
        style: TextStyle(color: kPrimaryColor));

    showDialog(
        context: PageRouter.globalContext,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) => CupertinoAlertDialog(
              content: content,
              actions: <Widget>[
                CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () =>
                        PageRouter.pushReplacement(Routes.signInView),
                    child: Text('OK',
                        style: context.headlineLarge?.copyWith(
                            color: AppColors.kPrimaryBlack, fontSize: 14))),
              ],
            ));

    // if (Platform.isAndroid) {
    //   showDialog(
    //       context: PageRouter.globalContext,
    //       barrierDismissible: false,
    //       barrierColor: Colors.transparent,
    //       builder: (BuildContext context) => CupertinoAlertDialog(
    //             content: content,
    //             actions: <Widget>[
    //               CupertinoDialogAction(
    //                   isDefaultAction: true,
    //                   onPressed: () {
    //                     PageRouter.pushReplacement(Routes.signInView);
    //                   },
    //                   child: Text('OK',
    //                       style: context.headlineLarge?.copyWith(
    //                           color: AppColors.kPrimaryBlack, fontSize: 14))),
    //             ],
    //           ));
    // } else {
    //   showDialog(
    //       context: PageRouter.globalContext,
    //       barrierDismissible: false,
    //       barrierColor: Colors.transparent,
    //       builder: (BuildContext context) => AlertDialog(
    //             content: content,
    //             backgroundColor: kPrimaryWhite,
    //             actions: <Widget>[
    //               ElevatedButtonWidget(
    //                   title: 'Ok',
    //                   onPressed: () =>
    //                       PageRouter.pushReplacement(Routes.signInView))
    //             ],
    //           ));
    // }
  }
}
