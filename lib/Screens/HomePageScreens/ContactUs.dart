import 'package:bankapp/Constants/colors.dart';
import 'package:bankapp/widget/HomePageWidgets/singleText.dart';
import 'package:bankapp/widget/TransfarScreen/InputTextBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactUS extends StatelessWidget {
  final TextEditingController value = TextEditingController();
  ContactUS({super.key});

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
          'Contact Us',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SingleText(
                text: 'For Local Callers',
                textSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              CustomInputTextBox(
                controller: value,
                enabledInput: false,
                hintText: '11100',
                trailingIcon: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor.withOpacity(.7),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.call_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'CALL',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomInputTextBox(
                controller: value,
                enabledInput: false,
                hintText: '0811188900 (Toll Free)',
                trailingIcon: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor.withOpacity(.7),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.call_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'CALL',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SingleText(
                text: 'For Local and Overseas Callers',
                textSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              CustomInputTextBox(
                controller: value,
                enabledInput: false,
                hintText: '+1 001 001 0001',
                trailingIcon: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor.withOpacity(.7),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.call_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'CALL',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomInputTextBox(
                controller: value,
                enabledInput: false,
                hintText: '+1 001 001 0001',
                trailingIcon: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor.withOpacity(.7),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.call_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'CALL',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SingleText(
                text: 'Email',
                textSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              CustomInputTextBox(
                controller: value,
                enabledInput: false,
                hintText: 'enquiry@example.com',
                trailingIcon: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor.withOpacity(.7),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail_outline_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Mail',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/Icons/facebook.png'),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset('assets/Icons/instagram.png'),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset('assets/Icons/linkedIn.png'),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset('assets/Icons/youtube.png'),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
