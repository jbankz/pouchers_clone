import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Pouchers/app/helpers/session_manager.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/login/screens/login.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/widgets.dart';

mixin ResponseHandler {

  void restartApplication(BuildContext context, String? message) {
    SessionManager.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(milliseconds: 1000),
            () => pushToAndClearStack(
          context,
          const LogInAccount(),
        ),
      );
    });
  }
//10:28 am
  //iphone 11

  handleExpiredToken(BuildContext context, ) async {
    _showLogoutDialog(context );
  }

  void _showLogoutDialog(BuildContext context) {
    var content = const Text('Your session has expired', style: TextStyle(
      color: kPrimaryColor
    ),);
    if (Platform.isIOS) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              content: content,
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('OK'),
                  isDefaultAction: true,
                  onPressed: (){
                    Navigator.pop(context);
                    pushToAndClearStack(context, LogInAccount());
                  }
                ),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: content,
backgroundColor: kPrimaryWhite,
              actions: <Widget>[
                LargeButton(
                  onPressed: (){
                    Navigator.pop(context);
                    pushToAndClearStack(context, LogInAccount());
                  },
                  title: 'OK',
                )
              ],
            );
          });
    }
  }
}
