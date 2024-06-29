import 'package:bankapp/Constants/colors.dart';
import 'package:bankapp/widget/HomePageWidgets/DropDown.dart';
import 'package:bankapp/widget/HomePageWidgets/textRow.dart';
import 'package:bankapp/widget/LoginScreenWidgets/authButton.dart';
import 'package:bankapp/widget/TransfarScreen/InputTextBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AirTime extends StatelessWidget {
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
          'Buy Airtime',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: NetworkDropdown(
                options: [
                  'Network 1',
                  'Network 2',
                  'Network 3',
                  'Network 4',
                ],
                onChanged: (String? newValue) {
                  print(newValue);
                },
              ),
            ),
            TextRow(
              verticalPadding: 0,
              mainText: 'Amount',
              textbutton: '',
              mainTextSize: 17,
            ),
            CustomInputTextBox(controller: value, hintText: 'Enter amount'),
            TextRow(
              verticalPadding: 0,
              mainText: 'Mobile Number',
              textbutton: '',
              mainTextSize: 17,
            ),
            CustomInputTextBox(controller: value, hintText: '+1(***)******'),
            TextRow(
              verticalPadding: 0,
              mainText: 'Quick links',
              textbutton: '',
              mainTextSize: 17,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black54),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            )),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.wifi,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Buy Data',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Buy bundel',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            CustomButton(
              text: "Proceed",
              onTap: () {},
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
