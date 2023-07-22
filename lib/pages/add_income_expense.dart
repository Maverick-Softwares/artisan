
// ignore_for_file: prefer_const_constructors

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AddIncomeExpense extends StatefulWidget {
  const AddIncomeExpense({super.key});

  @override
  State<AddIncomeExpense> createState() => _AddIncomeExpenseState();
}

class _AddIncomeExpenseState extends State<AddIncomeExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0065FF),
        elevation: 2,
        title: Text("Add Expenses",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: Image.asset("assets/iconImage/left-arrow1.png",height: 30.h,width: 30.w,),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}