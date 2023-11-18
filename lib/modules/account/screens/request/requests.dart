import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/account/screens/request/received.dart';
import 'package:Pouchers/modules/account/screens/request/sent.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManageRequest extends ConsumerStatefulWidget {
  static const String routeName = "manageRequest";

  @override
  ConsumerState<ManageRequest> createState() => _ManageRequestState();
}

class _ManageRequestState extends ConsumerState<ManageRequest>
    with TickerProviderStateMixin {
  late TabController? _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      title: "Requests",
      addSpace: false,
      color: kPurpleColor800,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kMicroPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    tabIndex = index;
                  });
                },
                tabs: [
                  Text(
                    sentText,
                  ),
                  Text(receivedText),
                ],
                controller: _tabController,
                indicatorColor: kPurpleColor,
                indicatorWeight: 2,
                unselectedLabelColor: kSecondaryTextColor,
                unselectedLabelStyle: textTheme.headline2!.copyWith(height: 3),
                labelColor: kPurpleColor,
                labelStyle: textTheme.headline2!.copyWith(height: 3),
              ),
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            tabIndex == 0 ? SentRequests() : ReceivedRequests()
          ],
        ),
      ),
    );
  }
}
