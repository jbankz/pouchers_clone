import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/response_handler.dart';
import 'package:Pouchers/data/fcmtoken.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/tab_layout/screens/homepage/homepage.dart';
import 'package:Pouchers/modules/transactions/screens/transactions.dart';
import 'package:Pouchers/ui/features/dashboard/views/account/views/account_view.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/logger.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../../ui/features/dashboard/views/card/presentation/view/virtual_card_view.dart';

class TabLayout extends ConsumerStatefulWidget {
  static const String routeName = "tabLayout";

  final int? gottenIndex;

  TabLayout({this.gottenIndex});

  @override
  _TabLayoutState createState() => _TabLayoutState();
}

class _TabLayoutState extends ConsumerState<TabLayout> with ResponseHandler {
  int _selectedIndex = 0;
  int extCount = 0;

  void _onItemTapped(int index) {
    if (_selectedIndex == 0) extCount = 0;
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> items = [
    const HomePage(),
    //CardHome(),
    // const CreateCard(),
    const VirtualCardView(),
    const Transactions(),
    const AccountView(),
  ];

  void checkActivityTime() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.gottenIndex == null) {
      _selectedIndex = 0;
    } else {
      _selectedIndex = widget.gottenIndex!;
    }
    FCManager.setupFCM();
    _setupFCM();
  }

  Future<bool> _willPopCallback() {
    bool result = false;
    if (_selectedIndex != 0) {
      print("hbhhd");
      _onItemTapped(0);
    } else {
      print("extCount$extCount");
      ++extCount;
      if (extCount == 2) {
        result = true;
      } else {
        showErrorBar(context, "Tap again to exit app");
      }
    }
    print("result$result");
    return Future.value(result);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return
        // AppLifeCycleManager(
        // child:
        WillPopScope(
      child: Scaffold(
        body: SafeArea(
          child: ListenerPage(
            child: items[_selectedIndex],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kDarkGrey,
          unselectedLabelStyle: textTheme.headline2!
              .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
          selectedLabelStyle: textTheme.headline2!
              .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: NavBarItem("nav_home.svg", false),
              activeIcon: NavBarItem("nav_home.svg", true),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: NavBarItem("nav_card.svg", false),
              activeIcon: NavBarItem("nav_card.svg", true),
              label: "Cards",
            ),
            BottomNavigationBarItem(
              icon: NavBarItem("nav_swap.svg", false),
              activeIcon: NavBarItem("nav_swap.svg", true),
              label: "Transactions",
            ),
            BottomNavigationBarItem(
              icon: NavBarItem("nav_account.svg", false),
              activeIcon: NavBarItem("nav_account.svg", true),
              label: "Account",
            )
          ],
        ),
      ),
      onWillPop: _willPopCallback,
    );
    //);
  }

  Future<void> _setupFCM() async {
    await FCManager.getInstance().requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
    await FCManager.getInstance().setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print("message2${message.notification}");
        _parseNotification(message.notification!);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.notification!.title != null) {
        print("message2${message.notification}");
        _parseNotification(message.notification!);
      }
    });

    FirebaseMessaging?.onBackgroundMessage(
        (message) => myBackgroundMessageHandler(message.data));

    try {
      await FCManager.getInstance().getToken().then(
        (String? token) {
          assert(token != null);
          logPrint("tokehhghn$token");
          ref.read(editProfileProvider.notifier).editProfile(fcmToken: token);
          //ref
          // .read(sendFCMTokenProvider.notifier)
          // .sendFCMToken(fcmToken: token!);
        },
      );
    } catch (e, stack) {}
  }

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      final dynamic data = message['data'];
    }
    if (message.containsKey('notification')) {
      final dynamic notification = message['notification'];
    }
  }

  _parseNotification(RemoteNotification notification) async {
    print("message${notification.body}");
    showSimpleNotification(
        Text(
          notification.body!,
          style: kHeadline6Style.copyWith(color: Colors.white),
        ),
        duration: const Duration(seconds: 10),
        background: kPrimaryColor,
        elevation: 0);
  }
}
