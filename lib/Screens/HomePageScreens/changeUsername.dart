import 'package:bankapp/Constants/colors.dart';
import 'package:bankapp/widget/HomePageWidgets/singleText.dart';
import 'package:bankapp/widget/TransfarScreen/InputTextBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChangeUserName extends StatefulWidget {
  ChangeUserName({super.key});

  @override
  State<ChangeUserName> createState() => _ChangeUserNameState();
}

class _ChangeUserNameState extends State<ChangeUserName> {
  final TextEditingController value = TextEditingController();

  bool? authMode;

  //MPIN is active method
  void smsMode() {
    setState(() {
      authMode = true;
    });
    print(authMode);
  }

  // Custom ID active me
  void mailMode() {
    setState(() {
      authMode = false;
    });
    print(authMode);
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
          'Change Username',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                CustomInputTextBox(
                    controller: value, hintText: 'Enter Old Username'),
                SizedBox(
                  height: 20,
                ),
                CustomInputTextBox(
                    controller: value, hintText: 'Enter New Username'),
                SizedBox(
                  height: 20,
                ),
                CustomInputTextBox(
                    controller: value, hintText: 'Confirm New Username'),
                SizedBox(
                  height: 30,
                ),
                SingleText(
                  text: 'Select Authorization Mode',
                  fontWeight: FontWeight.w500,
                  textSize: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      smsMode();
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: authMode == true
                            ? Colors.green
                            : Colors.grey.shade400,
                        border: Border.all(
                          width: 2,
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'SMS',
                            style: TextStyle(
                              color: authMode == true
                                  ? Colors.white
                                  : Colors.black38,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                          // SizedBox(width: 10,),
                          Icon(
                            Icons.sms_outlined,
                            color: authMode == true
                                ? Colors.white
                                : Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      mailMode();
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: authMode == false
                            ? Colors.green
                            : Colors.grey.shade400,
                        border: Border.all(
                          width: 2,
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Mail',
                            style: TextStyle(
                              color: authMode == false
                                  ? Colors.white
                                  : Colors.black38,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                          // SizedBox(width: 10,),
                          Icon(
                            Icons.mail_outline_rounded,
                            color: authMode == false
                                ? Colors.white
                                : Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: AppColors.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              'CANCLE',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Loading ..."),
                                  content: Text("Success"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text("Close"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: authMode != null
                                  ? AppColors.primaryColor
                                  : Colors.grey.shade400,
                              border: Border.all(
                                width: 2,
                                color: AppColors.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'SUMBIT',
                                style: TextStyle(
                                  color: authMode != null
                                      ? Colors.white
                                      : Colors.black45,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
