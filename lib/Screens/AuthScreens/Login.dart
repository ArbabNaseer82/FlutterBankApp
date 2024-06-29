import 'package:bankapp/Constants/colors.dart';
import 'package:bankapp/Screens/HomePageScreens/homePage.dart';
import 'package:bankapp/widget/LoginScreenWidgets/authButton.dart';
import 'package:bankapp/widget/LoginScreenWidgets/countryPickerList.dart';
import 'package:bankapp/widget/LoginScreenWidgets/inputPIN.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  static bool mpinFocus = true;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _pinController = TextEditingController();

  final bool faceID = true;

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  // Function when enter PIN
  void _onPinCompleted(String pin) {
    print("Entered PIN is: $pin");
    // Handle the submitted PIN as needed
  }

  //MPIN is active method
  void mpinActive() {
    setState(() {
      LoginScreen.mpinFocus = true;
    });
    print(LoginScreen.mpinFocus);
  }

  // Custom ID active me
  void customerActive() {
    setState(() {
      LoginScreen.mpinFocus = false;
    });
    print(LoginScreen.mpinFocus);
  }

  void alertDialog(String message) => {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Loading ..."),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          },
        )
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 40),
      color: AppColors.primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.white30,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0.1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const CountryPickerWidget(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bank at your finger tips',
                        style: TextStyle(color: Colors.white54, fontSize: 15),
                      ),
                      Text(
                        'Login Method',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.white30,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(
                    'assets/Images/Logo.png',
                    height: 50,
                    width: 60,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            mpinActive();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.secondaryColor,
                                  width: LoginScreen.mpinFocus ? 3.0 : 0,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  'Quick Access MPIN',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: LoginScreen.mpinFocus
                                        ? AppColors.primaryColor
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            customerActive();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.secondaryColor,
                                  width: LoginScreen.mpinFocus ? 0 : 3,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  'Customer ID',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: LoginScreen.mpinFocus
                                        ? Colors.grey
                                        : AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: LoginScreen.mpinFocus,
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            PinInputWidget(
                              pinController: _pinController,
                              onCompleted: _onPinCompleted,
                            ),
                            TextButton(
                              onPressed: () {
                                alertDialog('Still Not in Working');
                              },
                              child: const Text(
                                'Forgot MPIN?',
                              ),
                            ),
                            CustomButton(
                              text: "LogIn",
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                              buttonColor: AppColors.primaryColor,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.black12,
                                child: Icon(
                                  Icons.fingerprint_outlined,
                                  size:
                                      45, // Set the size of the icon as needed
                                  color: Colors
                                      .black54, // Set the color of the icon
                                ),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.9,
                              child: Container(
                                height: 65,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    border: Border.all(
                                        width: 2, color: Colors.black26)),
                                child: const Center(
                                  child: Text(
                                    'Click the round icon to scan your Fingerprint',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 50,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  alertDialog("Create New User is in pending");
                                },
                                child: const Text(
                                  'Create an account?',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.lock_outline,
                                  size: 18,
                                ),
                                const Text(' Secure Banking -'),
                                TextButton(
                                  onPressed: () {
                                    alertDialog('Policy is in working stage');
                                  },
                                  child: const Text(
                                    'Privacy Policy',
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
