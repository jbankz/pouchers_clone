import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:Pouchers/ui/common/app_images.dart';
import 'package:Pouchers/ui/widgets/gap.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overlay_support/overlay_support.dart';

// Trigger a notification using OverlaySupport
// Display the notification using the MessageNotification widget
void triggerNotificationTray(String message,
    {bool error = false, Duration? duration, bool ignoreIfNull = false}) {
  if (ignoreIfNull) return;
  showOverlayNotification(
      (_) => MessageNotification(message: message, error: error),
      duration: duration ?? const Duration(milliseconds: 4000));
}

class MessageNotification extends StatefulWidget {
  final String message;
  final bool error;

  const MessageNotification(
      {super.key, required this.message, this.error = false});

  @override
  State<MessageNotification> createState() => _MessageNotificationState();
}

class _MessageNotificationState extends State<MessageNotification>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    _triggerFeedback();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = CurvedAnimation(
        parent: controller, curve: Curves.easeInOut, reverseCurve: Curves.ease);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _triggerFeedback() async {
    await HapticFeedback.vibrate();
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: animation,
        child: GestureDetector(
          onTap: () => context.dismissTrey(),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
                color: AppColors.kPrimaryTextColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.kPrimaryTextColor)),
            margin:
                EdgeInsets.only(top: kToolbarHeight, left: 16.w, right: 16.w),
            child: Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  SvgPicture.asset(widget.error
                      ? AppImage.error
                      : AppImage.checkboxCircleFill),
                  const Gap(width: 12),
                  Expanded(
                      child: Text(widget.message,
                          style: context.headlineMedium?.copyWith(
                              color: widget.error
                                  ? AppColors.kDanger
                                  : AppColors.white))),
                  const Gap(width: 12),
                  InkWell(
                      onTap: () => context.dismissTrey(),
                      child: Icon(Icons.close,
                          color: widget.error
                              ? AppColors.kDanger
                              : AppColors.white,
                          size: 20))
                ],
              ),
            ),
          ),
        ),
      );
}
