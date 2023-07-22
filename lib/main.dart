// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages
import 'package:artisan/pages/add_expenses.dart';
import 'package:artisan/pages/add_income_expense.dart';
import 'package:artisan/pages/dashboard_navpage.dart';
import 'package:artisan/pages/login_page.dart';
import 'package:artisan/utils/app_colors.dart';
import 'package:artisan/utils/app_string.dart';
import 'package:artisan/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppString.app_title,
              theme: ThemeData(
                scaffoldBackgroundColor: AppColors.scaffold_background_color,
              ),
              // initialRoute: login,
              getPages: getPages,
              // home: LoginPage(),
              home: AddIncomeExpense());
        });
  }
}