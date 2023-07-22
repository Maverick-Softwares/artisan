// ignore_for_file: depend_on_referenced_packages, unused_import, prefer_const_constructors, prefer_final_fields

import 'package:artisan/pages/dashboard_page.dart';
import 'package:artisan/pages/login_page.dart';
import 'package:artisan/pages/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:developer';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'add_income_expense.dart';

class DashboardNavPage extends StatefulWidget {
  const DashboardNavPage({super.key});

  @override
  State<DashboardNavPage> createState() => _DashboardNavPageState();
}

class _DashboardNavPageState extends State<DashboardNavPage> {
  late PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  List<Widget> _buildScreens() {
    return [
      AddIncomeExpense(),
      DashboardPage(),
      AddIncomeExpense()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        iconSize: 30.h,
        icon: Image.asset(
          "assets/iconImage/file.png",
        ),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          "assets/iconImage/add1.png",
          fit: BoxFit.cover,
        ),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 30.h,
        icon: Image.asset(
          "assets/iconImage/pie-chart.png",
        ),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        colorBehindNavBar: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(
              0,
              1,
            ), // Offset for the shadow (horizontal, vertical)
          ),
        ],
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
      navBarHeight: 55.h, 
    );
  }
}