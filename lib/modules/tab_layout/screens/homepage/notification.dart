import 'package:flutter/material.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/widgets.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: "Notification",
      child: ListenerPage(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                  children: List.generate(
                10,
                (index) => Container(
                  margin: EdgeInsets.symmetric(vertical: kSmallPadding),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            margin: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: kColorGreen),
                          ),
                          SizedBox(
                            width: kSmallPadding,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your password has been successfully reset.Your password has been successfully reset.",
                                  style: textTheme.headline4!
                                      .copyWith(fontSize: 16, height: 1.5),
                                ),
                                SizedBox(
                                  height: kSmallPadding,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Jan 24, 2023 | ",
                                      style: textTheme.headline6,
                                    ),
                                    Text("08:25 AM", style: textTheme.headline6),
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
              )),
            ),
            SizedBox(
              height: kSmallPadding,
            ),
            Text(
              "View all notifications",
              style: textTheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}
