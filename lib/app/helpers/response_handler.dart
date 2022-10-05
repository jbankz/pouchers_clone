import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pouchers/app/helpers/session_manager.dart';
import 'package:pouchers/utils/widgets.dart';

mixin ResponseHandler {
  handleExpiredToken(BuildContext context) async {
    _showLogoutDialog(context);
  }

  void _showLogoutDialog(BuildContext context) {
    var content = const Text('Your session has expired');
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
                  onPressed: () async {
                    Navigator.pop(context);
                    await deleteSelectBoxes();
                  },
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
              actions: <Widget>[
                LargeButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await deleteSelectBoxes();
                  },
                  title: 'OK',
                )
              ],
            );
          });
    }
  }

  Future<void> deleteSelectBoxes() async {
    SessionManager.clear();
  }
}
