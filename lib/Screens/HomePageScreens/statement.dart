import 'package:bankapp/Constants/colors.dart';
import 'package:bankapp/widget/HomePageWidgets/singleText.dart';
import 'package:bankapp/widget/LoginScreenWidgets/authButton.dart';
import 'package:bankapp/widget/TransfarScreen/InputTextBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatementDetails extends StatelessWidget {
  StatementDetails({super.key});
  final TextEditingController value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_rounded),
        ),
        centerTitle: true,
        title: Text(
          'Detailed Statement',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleText(
                text: 'Select Account / Card',
                color: Colors.black,
                textSize: 15,
              ),
              CustomInputTextBox(
                controller: value,
                hintText: 'Select Account / Card',
                leadingIcon: Icon(
                  Icons.assured_workload_outlined,
                  color: AppColors.primaryColor,
                ),
                trailingIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              SingleText(
                text: 'From Amount',
                color: Colors.black,
                textSize: 15,
              ),
              CustomInputTextBox(controller: value, hintText: 'Enter amount'),
              SingleText(
                text: 'To Amount',
                color: Colors.black,
                textSize: 15,
              ),
              CustomInputTextBox(controller: value, hintText: 'Enter amount'),
              SingleText(
                text: 'Filter by Type*',
                color: Colors.black,
                textSize: 15,
              ),
              CustomInputTextBox(
                controller: value,
                hintText: 'Both',
                trailingIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              SingleText(
                text: 'Filter by Period*',
                color: Colors.black,
                textSize: 15,
              ),
              CustomInputTextBox(
                controller: value,
                hintText: 'Last 6 Months',
                trailingIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              SingleText(
                text: 'From Date*',
                color: Colors.black,
                textSize: 15,
              ),
              CustomInputTextBox(controller: value, hintText: 'From Date'),
              SingleText(
                text: 'To Date*',
                color: Colors.black,
                textSize: 15,
              ),
              CustomInputTextBox(controller: value, hintText: 'To Date'),
              SizedBox(height: 30,),
              CustomButton(text: 'Get Statement', onTap: (){}),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
