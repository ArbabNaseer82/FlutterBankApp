import 'package:bankapp/Constants/colors.dart';
import 'package:bankapp/widget/HomePageWidgets/singleText.dart';
import 'package:bankapp/widget/LoginScreenWidgets/authButton.dart';
import 'package:bankapp/widget/TransfarScreen/InputTextBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PayBill extends StatefulWidget {
  const PayBill({super.key});

  @override
  State<PayBill> createState() => _PayBillState();
}

class _PayBillState extends State<PayBill> {
  late bool makePayment = true;
  final TextEditingController value = TextEditingController();

  //MPIN is active method
  void paymentActive() {
    setState(() {
      makePayment = true;
    });
    print(makePayment);
  }

  // Custom ID active me
  void manageBillActive() {
    setState(() {
      makePayment = false;
    });
    print(makePayment);
  }

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
          'Pay Bill',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          paymentActive();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.secondaryColor,
                                width: makePayment ? 5.0 : 0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Make Payment',
                              style: TextStyle(
                                  color: makePayment
                                      ? AppColors.primaryColor
                                      : Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          manageBillActive();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.secondaryColor,
                                width: !makePayment ? 5.0 : 0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Manage Bills',
                              style: TextStyle(
                                  color: !makePayment
                                      ? AppColors.primaryColor
                                      : Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: makePayment,
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SingleText(
                        text: 'From',
                        textSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomInputTextBox(
                        controller: value,
                        hintText: 'Select account',
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
                        text: 'Pay to',
                        textSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomInputTextBox(
                        controller: value,
                        hintText: 'Select pay',
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
                        text: 'Amount',
                        textSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomInputTextBox(
                          controller: value, hintText: 'Enter amount'),
                      SingleText(
                        text: 'Frequency',
                        textSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomInputTextBox(
                        controller: value,
                        hintText: 'Once',
                        trailingIcon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SingleText(
                        text: 'Date',
                        textSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomInputTextBox(
                          controller: value, hintText: 'Jan 16-24'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/Images/Announcement.jpg',
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                'Bill Payments may take up to 3 business days to process and post',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: 'Pay Bill',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !makePayment,
              child: Expanded(
                child: Center(
                  child: Text(
                    'Empty Bill History',
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
