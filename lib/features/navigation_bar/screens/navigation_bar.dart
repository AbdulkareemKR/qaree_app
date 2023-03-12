import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/features/groups/screens/groups_screen.dart';
import 'package:Qaree/features/home/screens/home_screen.dart';
import 'package:Qaree/features/personal_informations/screens/personal_informations.dart';
import 'package:Qaree/features/statistics/screens/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({super.key});

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      padding: NavBarPadding.only(top: 30.h),
      backgroundColor: ColorsConst.primaryBlack, // Default is Colors.white.
      navBarHeight: 80.h,
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadiusConst.largeBorderRadius,
        colorBehindNavBar: ColorsConst.transparent,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      Container(
        child: Center(child: Text("Search")),
      ),
      StatisticsScreen(),
      GroupsScreen(),
      PersonalInformations()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.book_rounded),
        title: ("Books"),
        inactiveColorSecondary: ColorsConst.lightGrey,
        activeColorSecondary: ColorsConst.lightPurple,
        activeColorPrimary: ColorsConst.white,
        inactiveColorPrimary: ColorsConst.lightGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Search"),
        opacity: 1,
        inactiveColorSecondary: ColorsConst.lightGrey,
        activeColorSecondary: ColorsConst.lightPurple,
        activeColorPrimary: ColorsConst.white,
        inactiveColorPrimary: ColorsConst.lightGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.bar_chart_rounded),
        title: ("Statistics"),
        inactiveColorSecondary: ColorsConst.lightGrey,
        activeColorSecondary: ColorsConst.lightPurple,
        activeColorPrimary: ColorsConst.white,
        inactiveColorPrimary: ColorsConst.lightGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.group_rounded),
        title: ("Groups"),
        inactiveColorSecondary: ColorsConst.lightGrey,
        activeColorSecondary: ColorsConst.lightPurple,
        activeColorPrimary: ColorsConst.white,
        inactiveColorPrimary: ColorsConst.lightGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        inactiveColorSecondary: ColorsConst.lightGrey,
        activeColorSecondary: ColorsConst.lightPurple,
        activeColorPrimary: ColorsConst.white,
        inactiveColorPrimary: ColorsConst.lightGrey,
      ),
    ];
  }
}
