// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, prefer_final_fields

import 'package:artisan/widgets/expenses_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/style.dart';
import '../widgets/violet_button.dart';

class AddIncomeExpense extends StatefulWidget {
  const AddIncomeExpense({super.key});

  @override
  State<AddIncomeExpense> createState() => _AddIncomeExpenseState();
}

class _AddIncomeExpenseState extends State<AddIncomeExpense> {
  TextEditingController _priceController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  void _save() async {
    String price = _priceController.text;
    String title = _titleController.text;
    String categry = _categoryController.text;
    String note = _noteController.text;

    // !pls delate -------------

    if (price.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Price field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else if (title.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Tile field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else if (categry.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Categry field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else {
      // Sign up logic
      // Redirect to the next page or perform necessary actions
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0065FF),
        elevation: 2,
        title: Text(
          "Add Expenses",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Image.asset(
          "assets/iconImage/left-arrow1.png",
          height: 20.h,
          width: 20.w,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(
                height: 80.h,
              ),
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: Colors.white,
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
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0065FF),
                    ),
                    textAlign: TextAlign.center,
                    controller: _priceController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "\$ 0",
                      hintStyle: TextStyle(
                          color: Color(0xFF0065FF),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(width: 1.0, color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(width: 1.0, color: Colors.white),
                      ),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(30),
                      // ), // Center the hint text
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              ExpensesTextFeild(
                  Controller: _titleController,
                  hintText: "Title",
                  image: "assets/iconImage/title.png"),
              SizedBox(
                height: 20.h,
              ),
              ExpensesTextFeild(
                  Controller: _categoryController,
                  hintText: "Category",
                  image: "assets/iconImage/menu.png"),
              SizedBox(
                height: 20.h,
              ),
              ExpensesTextFeild(
                  Controller: _noteController,
                  hintText: "Note",
                  image: "assets/iconImage/writing.png"),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: _save,
                child: VioletButton(title: "SAVE")
              ),
            ],
          ),
        ),
      ),
    );
  }
}