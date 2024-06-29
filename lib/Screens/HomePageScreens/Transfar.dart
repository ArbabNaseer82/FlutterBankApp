import 'package:bankapp/Constants/colors.dart';
import 'package:bankapp/widget/HomePageWidgets/textRow.dart';
import 'package:bankapp/widget/LoginScreenWidgets/authButton.dart';
import 'package:bankapp/widget/TransfarScreen/InputTextBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transfar extends StatelessWidget {
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
          'Transfer Money',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xfff5f5f5),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Available Balance',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '\$ 1,23,456',
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextRow(
                verticalPadding: 0,
                mainText: 'Frequent Beneficiaries',
                mainTextSize: 17,
                textbutton: '',
              ),
              Row(
                children: [
                  Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          // color: Colors.cyan,
                          width: 90,
                          height: 50,
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 232, 231, 233),
                                radius: 30,
                                child: Icon(
                                  Icons.person_outline_outlined,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                'USER\nNAME',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              TextRow(
                verticalPadding: 0,
                mainText: 'Bank',
                textbutton: '',
                mainTextSize: 17,
              ),
              CustomInputTextBox(
                controller: value,
                hintText: 'Select Bank',
                leadingIcon: Icon(
                  Icons.apartment_outlined,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
                trailingIcon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30,
                ),
              ),
              TextRow(
                verticalPadding: 0,
                mainText: 'Beneficiary\'s account number',
                textbutton: '',
                mainTextSize: 17,
              ),
              CustomInputTextBox(
                controller: value,
                hintText: 'Enter Account Number',
              ),
              TextRow(
                verticalPadding: 0,
                mainText: 'Amount',
                textbutton: '',
                mainTextSize: 17,
              ),
              CustomInputTextBox(
                controller: value,
                hintText: 'Enter amount',
              ),
              TextRow(
                verticalPadding: 0,
                mainText: 'Description',
                textbutton: '',
                mainTextSize: 17,
              ),
              CustomInputTextBox(
                controller: value,
                hintText: 'Description',
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                text: "Make Transfer",
                onTap: () {},
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
