import 'package:bankapp/Constants/colors.dart';
import 'package:bankapp/Screens/HomePageScreens/ContactUs.dart';
import 'package:bankapp/Screens/HomePageScreens/Setting.dart';
import 'package:bankapp/Screens/HomePageScreens/Transfar.dart';
import 'package:bankapp/Screens/HomePageScreens/buyAirTime.dart';
import 'package:bankapp/Screens/HomePageScreens/locator.dart';
import 'package:bankapp/Screens/HomePageScreens/payBill.dart';
import 'package:bankapp/Screens/HomePageScreens/quickLoan.dart';
import 'package:bankapp/Screens/HomePageScreens/referAESB.dart';
import 'package:bankapp/Screens/HomePageScreens/scanToPay.dart';
import 'package:bankapp/Screens/HomePageScreens/statement.dart';
import 'package:bankapp/widget/Drawer/ListTileBox.dart';
import 'package:bankapp/widget/HomePageWidgets/iconBox.dart';
import 'package:bankapp/widget/HomePageWidgets/textRow.dart';
import 'package:bankapp/widget/LoginScreenWidgets/countryPickerList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Builder(
            // Wrap the InkWell in a Builder widget
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.menu_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        centerTitle: true,
        title: Center(
          child: Text(
            'AESB',
            style: TextStyle(
                color: AppColors.primaryColor,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        actions: [
          CountryPickerWidget(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),

      //       drawer: Drawer(
      //   // Add a ListView to the drawer. This ensures the user can scroll
      //   // through the options in the drawer if there isn't enough vertical
      //   // space to fit everything.
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text('Drawer Header'),
      //       ),
      //       ListTile(
      //         title: const Text('Home'),
      //         // selected: _selectedIndex == 0,
      //         onTap: () {
      //           // Update the state of the app
      //           // _onItemTapped(0);
      //           // Then close the drawer
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Business'),
      //         // selected: _selectedIndex == 1,
      //         onTap: () {
      //           // Update the state of the app
      //           // _onItemTapped(1);
      //           // Then close the drawer
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('School'),
      //         // selected: _selectedIndex == 2,
      //         onTap: () {
      //           // Update the state of the app
      //           // _onItemTapped(2);
      //           // Then close the drawer
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             width: 2,
              //             color: Colors.black26,
              //           ),
              //           borderRadius: BorderRadius.circular(5),
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.all(5.0),
              //           child: Icon(
              //             Icons.menu_rounded,
              //             color: Colors.black,
              //           ),
              //         ),
              //       ),
              //       SizedBox(),
              //       Text(
              //         'AESB',
              //         style: TextStyle(
              //             color: AppColors.primaryColor,
              //             letterSpacing: 2,
              //             fontWeight: FontWeight.bold,
              //             fontSize: 25),
              //       ),
              //       Row(
              //         children: [
              //           CountryPickerWidget(),
              //           Container(
              //             decoration: BoxDecoration(
              //               border: Border.all(
              //                 width: 2,
              //                 color: Colors.black26,
              //               ),
              //               borderRadius: BorderRadius.circular(5),
              //             ),
              //             child: const Padding(
              //               padding: EdgeInsets.all(5.0),
              //               child: Icon(
              //                 Icons.notifications_none_outlined,
              //                 color: Colors.black,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              Row(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryColor.withOpacity(.9),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'BASIC CURRENT ACCOUNT',
                                style: TextStyle(
                                  color: Colors.white30,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$ 1,23,456  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                    ),
                                  ),
                                  Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'JOHN SMITH',
                                    style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '0123456789  ',
                                        style: TextStyle(
                                          color: Colors.white30,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Icon(
                                        Icons.file_copy_rounded,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: AppColors.primaryColor,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search here...',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextRow(
                mainText: 'Quick Access',
                textbutton: 'View All',
                ontap: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconTextContainer(
                            icon: Icons.compare_arrows_sharp,
                            text: 'Transfar',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Transfar()),
                              );
                            },
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          CustomIconTextContainer(
                            icon: Icons.insert_page_break_rounded,
                            text: 'AirTime',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AirTime()),
                              );
                            },
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          CustomIconTextContainer(
                            icon: Icons.qr_code_scanner_rounded,
                            text: 'Scan to pay',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScanToPay()),
                              );
                            },
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          CustomIconTextContainer(
                            icon: Icons.electric_bolt_sharp,
                            text: 'Utility',
                            onTap: () {},
                          ),
                          // SizedBox(width: 1,),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomIconTextContainer(
                              icon: Icons.monetization_on_rounded,
                              text: 'Quick Loan',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuickLoan()),
                                );
                              },
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            CustomIconTextContainer(
                              icon: Icons.padding_outlined,
                              text: 'Statement',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StatementDetails()),
                                );
                              },
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            CustomIconTextContainer(
                              icon: Icons.payment_sharp,
                              text: 'Pay Bill',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PayBill()),
                                );
                              },
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            CustomIconTextContainer(
                              icon: Icons.emoji_events_outlined,
                              text: 'Events',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextRow(
                mainText: 'Transactions',
                textbutton: 'View All',
                ontap: () {},
              ),
              Container(
                child: Center(
                  child: Text(
                    'NO record Found',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black45),
                  ),
                  Text(
                    'William Huffman',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'A/C.:000099990001  ',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.copy_sharp,
                        size: 23,
                      )
                    ],
                  ),
                  Text(
                    '1 Account . Personal',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black45),
                  ),
                ],
              ),
            ),
            ListTileBox(
              imagePath: 'assets/Icons/profile.png',
              title: 'Profile',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingContent()));
              },
            ),
            ListTileBox(
              imagePath: 'assets/Icons/transfar.png',
              title: 'Transfer',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Transfar()));
              },
            ),
            ListTileBox(
              imagePath: 'assets/Icons/scan_to_pay.png',
              title: 'Scan to Pay',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScanToPay()));
              },
            ),
            ListTileBox(
              imagePath: 'assets/Icons/utilities.png',
              title: 'Utilities',
              onTap: () {},
            ),
            ListTileBox(
              imagePath: 'assets/Icons/quick_loan.png',
              title: 'Quick Loan',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuickLoan()));
              },
            ),
            ListTileBox(
              imagePath: 'assets/Icons/statement.png',
              title: 'Statement',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StatementDetails()));
              },
            ),
            ListTileBox(
              imagePath: 'assets/Icons/self_top_up.png',
              title: 'Self Top-Up',
              onTap: () {},
            ),
            ListTileBox(
              imagePath: 'assets/Icons/locator.png',
              title: 'Locator',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Locator()));
              },
            ),
            ListTileBox(
              imagePath: 'assets/Icons/contact_us.png',
              title: 'Contact Us',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUS()));
              },
            ),
            ListTileBox(
              imagePath: 'assets/Icons/refer.png',
              title: 'Refer',
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Refer()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
