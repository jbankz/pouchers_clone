import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/modules/tab_layout/screens/homepage/notification_single.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  String dateFormatter = 'MMM dd, yyyy';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getNotificationProvider.notifier).getNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    print(ref.watch(getNotificationProvider).data);
    return InitialPage(
      title: "Notification",
      child: ListenerPage(
          child: ref.watch(getNotificationProvider).when(
              loading: () => SpinKitDemo(),
              done: (data) {
                if (data != null) {
                  return data.data!.notifications.isEmpty
                      ? Container(
                          color: kPrimaryWhite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "You have no Notifications",
                                  style: textTheme.subtitle1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) => inkWell(
                                  onTap: () {
                                    pushTo(
                                        context,
                                        NotificationSingleScreen(
                                            data.data!.notifications[index]));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: kSmallPadding),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 10,
                                              margin: EdgeInsets.only(top: 8),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: kColorGreen),
                                            ),
                                            SizedBox(
                                              width: kSmallPadding,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${data.data!.notifications[index].title}",
                                                    style: textTheme.headline4!
                                                        .copyWith(
                                                            fontSize: 16,
                                                            height: 1.5),
                                                  ),
                                                  SizedBox(
                                                    height: kSmallPadding,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${data.data!.notifications[index].createdAt!.formatDate(dateFormatter)} | ",
                                                        style:
                                                            textTheme.headline6,
                                                      ),
                                                      Text(
                                                          DateFormat.jm()
                                                              .format(data
                                                                  .data!
                                                                  .notifications[
                                                                      index]
                                                                  .createdAt!),
                                                          // "08:25 AM",
                                                          style: textTheme
                                                              .headline6),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: kLightPurple,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                itemCount: data.data!.notifications.length,
                              ),
                            ),
                            SizedBox(
                              height: kSmallPadding,
                            ),
                            // Text(
                            //   "View all notifications",
                            //   style: textTheme.headline2,
                            // )
                          ],
                        );
                } else {
                  return SizedBox();
                }
              })),
    );
  }
}
