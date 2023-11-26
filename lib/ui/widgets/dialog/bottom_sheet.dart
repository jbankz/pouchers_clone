import 'package:flutter/material.dart';

import '../../../app/core/router/page_router.dart';
import '../../common/app_colors.dart';

class BottomSheets {
  static Future<T?> showSheet<T>(
          {bool isDismissible = true, required Widget child}) =>
      showModalBottomSheet<T>(
          context: PageRouter.globalContext,
          isDismissible: isDismissible,
          builder: (_) => Wrap(children: [child]));

  static Future<dynamic> showAlertDialog(
          {bool barrierDismissible = true, required Widget child}) async =>
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: barrierDismissible,
        barrierColor: AppColors.kPrimaryTextColor.withOpacity(.70),
        transitionDuration: const Duration(milliseconds: 700),
        context: PageRouter.globalContext,
        pageBuilder: (context, anim1, anim2) => child,
        transitionBuilder: (context, anim1, anim2, child) => SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(anim1),
            child: child),
      );
}
