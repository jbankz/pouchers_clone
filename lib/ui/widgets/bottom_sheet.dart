import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../app/core/router/page_router.dart';

class Sheets {
  static Future<T?> showDialog<T>(
      {required Widget child, bool isDismissible = true}) {
    return showGeneralDialog(
      context: PageRouter.globalContext,
      barrierLabel: 'barrierLabel',
      barrierColor: PageRouter.globalContext.dialogBackgroundColor,
      barrierDismissible: isDismissible,
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(animation),
          child: child),
    );
  }

  static Future<T?> showSheet<T>(
      {required Widget child,
      bool isDismissible = true,
      bool enableDrag = true,
      double radius = 30}) {
    return showModalBottomSheet<T>(
        isDismissible: isDismissible,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        enableDrag: enableDrag,
        elevation: 8,
        shape: RoundedRectangleBorder(
            // side: BorderSide(color: isDark ? kColorDark : kColorWhite),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius))),
        context: PageRouter.globalContext,
        builder: (_) => child);
  }

  static PersistentBottomSheetController<T> showPersistentSheet<T>(
      BuildContext context,
      {required Widget child}) {
    return showBottomSheet<T>(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        context: context,
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.maximize),
              Flexible(child: child),
            ],
          );
        });
  }
}
