import 'package:flutter/material.dart';
import 'package:pouchers/ui/cards/screens/card_home.dart';
import 'package:pouchers/ui/cards/screens/create_card.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/homepage.dart';
import 'package:pouchers/ui/tab_layout/screens/profile/profile_page.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/widgets.dart';

class TabLayout extends StatefulWidget {
  static const String routeName = "tabLayout";

  final int? gottenIndex;

  TabLayout({this.gottenIndex});

  @override
  _TabLayoutState createState() => _TabLayoutState();
}

class _TabLayoutState extends State<TabLayout> {
  int _selectedIndex = 0;
  int extCount = 0;

  void _onItemTapped(int index) {
    if (_selectedIndex == 0) extCount = 0;
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> items = [
    HomePage(),
    // CardHome(),
    CreateCard(),
    Container(),
    ProfilePage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.gottenIndex == null) {
      _selectedIndex = 0;
    } else {
      _selectedIndex = widget.gottenIndex!;
    }
  }

  Future<bool> _willPopCallback() {
    bool result = false;
    if (_selectedIndex != 0) {
      _onItemTapped(0);
    } else {
      ++extCount;
      print("exit count:$extCount");
      if (extCount == 2) {
        print("exitss count:$extCount");
        result = true;
      } else {
        showErrorBar(context, "Tap again to exit app");
      }
    }
    print(result);
    return Future.value(result);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return WillPopScope(
      child: Scaffold(
        body: items[_selectedIndex],
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
  }
}
