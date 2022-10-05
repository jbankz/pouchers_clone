import 'package:flutter/material.dart';
import 'package:pouchers/ui/tab_layout/homepage/homepage.dart';
import 'package:pouchers/utils/constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/widgets.dart';

class TabLayout extends StatefulWidget {
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
    Container(),
    Container(),
    Container(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.gottenIndex == null) {
      _selectedIndex = 0;
      print(_selectedIndex);
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
          unselectedLabelStyle: textTheme.headline2!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12
          ),
          selectedLabelStyle: textTheme.headline2!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: NavBarItem("nav_home.png", false),
              activeIcon: NavBarItem("nav_home.png", true),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: NavBarItem("nav_card.png", false),
              activeIcon: NavBarItem("nav_card.png", true),
              label: "Cards",
            ),
            BottomNavigationBarItem(
              icon: NavBarItem("nav_swap.png", false),
              activeIcon: NavBarItem("nav_swap.png", true),
              label: "Transactions",
            ),
            BottomNavigationBarItem(
              icon: NavBarItem("nav_account.png", false),
              activeIcon: NavBarItem("nav_account.png", true),
              label: "Account",
            )
          ],
        ),
      ),
      onWillPop: _willPopCallback,
    );
  }
}
