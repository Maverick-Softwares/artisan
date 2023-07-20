// ignore_for_file: implementation_imports, prefer_const_constructors, depend_on_referenced_packages, unused_field, prefer_final_fields
import 'package:artisan/pages/add_expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_string.dart';
import '../utils/theme.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({super.key});

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
    TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/incomes.png",
                    height: 250.h,
                  ),
                ),
                Text(
                  AppString.income_title,
                  style: loginStyle,
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    Image.asset("assets/iconImage/hand1.png",width: 25.w,height: 25.h,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: AppTextField(
                        Controller: _amountController,
                        hintText: 'Amount',
                        keyboard_type:TextInputType.number,
                      ),
                    ),
                  ],
                ),
                 SizedBox(
                  height: 100.h,
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>AddExpenses());
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.buttomColor,
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Continue',
                        textColor: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
