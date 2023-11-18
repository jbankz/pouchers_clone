import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/modules/make_payment/models/make_payment_model.dart'
    as model;
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:flutter/material.dart';

class NotificationSingleScreen extends StatelessWidget {
  final model.Notification notification;

  NotificationSingleScreen(this.notification);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: "Notification",
        child: ListenerPage(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${notification.title}",
                style: textTheme.headline4!.copyWith(
                    fontSize: 16, height: 1.5, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              Text(
                "${notification.body}",
                style: textTheme.headline6!.copyWith(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ));
  }
}
