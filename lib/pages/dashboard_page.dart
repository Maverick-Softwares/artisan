// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200.h, //70 for bottom
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 70.h, // to shift little up
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Color(0xFF0065FF),
                          width: constraints.maxWidth,
                          child: Container(
                            width: double.infinity,
                            height: 54.h,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15.w,
                                  top: 15.h,
                                  child: Text(
                                    'Good Morning,',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 15.w,
                                  top: 35.h,
                                  child: Text(
                                    'Mostafijur Rahman',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 15.w,
                                  top: 25.h,
                                  child: Container(
                                    child: Image.asset(
                                      "assets/iconImage/notification1.png",
                                      width: 25.w,
                                      height: 25.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 70.h,
                        height: 120.h,
                        left: 20.w,
                        right: 20.w,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(
                                  0,
                                  3,
                                ), // Offset for the shadow (horizontal, vertical)
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$ 13,500",
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF0065FF),
                                          ),
                                        ),
                                        Image.asset(
                                          "assets/iconImage/tk1.png",
                                          width: 20.w,
                                          height: 20.h,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Income",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "2023-5-24 7:47pm",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Color(0xFFACB1C1),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$ 2,000",
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF0065FF),
                                          ),
                                        ),
                                        Image.asset(
                                          "assets/iconImage/tk2.png",
                                          width: 20.w,
                                          height: 20.h,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Expense",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "2023-5-24 7:47pm",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Color(0xFFACB1C1),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transactions",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                      Text("View All",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: Color(0xFFACB1C1))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                dashboardCard("Food", "-\$60", "assets/images/food1.png"),
                SizedBox(
                  height: 15.h,
                ),
                dashboardCard("Entertainment", "-\$60",
                    "assets/images/clapperboard1.png"),
                SizedBox(
                  height: 15.h,
                ),
                dashboardCard(
                    "Shopping", "-\$285", "assets/images/shopping-bag1.png"),
                SizedBox(
                  height: 15.h,
                ),
                dashboardCard("Travel", "-\$385", "assets/images/plane1.png"),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding dashboardCard(String title, String price, String image) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(
                0,
                3,
              ), // Offset for the shadow (horizontal, vertical)
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Center(
                child: Container(
                  width: 385,
                  height: 70,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          height: 70.h,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 80.w,
                        top: 18.h,
                        child: Text(
                          title,
                          style: GoogleFonts.poppins(textStyle:  TextStyle(
                            color: Color(0xFF1E2944),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),)
                        ),
                      ),
                      Positioned(
                        // left: 250,
                        top: 5.h,
                        right: 50.w,
                        child: Container(
                          width: 71.w,
                          height: 60.h,
                          child: Stack(
                            children: [
                              Positioned(
                                right: 10.w,
                                top: 5.h,
                                child: Text(
                                  price,
                                  style: TextStyle(
                                    color: Color(0xFFACB1C1),
                                    fontSize: 16.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 25.h,
                                child: Text(
                                  'Yesterday',
                                  style: TextStyle(
                                    color: Color(0xFFACB1C1),
                                    fontSize: 14.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.w,
              top: 10.h,
              child: Center(
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}