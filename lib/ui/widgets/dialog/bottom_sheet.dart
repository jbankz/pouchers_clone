import 'package:flutter/material.dart';

import '../../../app/core/router/page_router.dart';
import '../../common/app_colors.dart';

class BottomSheets {
  static Future<T?> showSheet<T>({required Widget child}) =>
      showModalBottomSheet<T>(
          context: PageRouter.globalContext,
          builder: (_) => Wrap(children: [child]));

  static Future<dynamic> showAlertDialog({required Widget child}) async =>
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
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
