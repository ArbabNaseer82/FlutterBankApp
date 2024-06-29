import 'package:bankapp/Constants/colors.dart';
import 'package:bankapp/Screens/HomePageScreens/Setting.dart';
import 'package:bankapp/Screens/HomePageScreens/Transaction.dart';
import 'package:bankapp/widget/HomePageWidgets/CustomImageTextBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickLoan extends StatefulWidget {
  const QuickLoan({Key? key}) : super(key: key);

  @override
  _QuickLoanState createState() => _QuickLoanState();
}

class _QuickLoanState extends State<QuickLoan> {
  int _selectedIndex = 0;

  // Define your different components here
  final List<Widget> _pages = [
    LoanContent(),
    TransactionContent(),
    SettingContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: 'Loan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plagiarism_outlined),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

// Define your different content components here
class LoanContent extends StatelessWidget {
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
          'Apply For Quick',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomImageTextBox(
                  imageURl:
                      'https://th.bing.com/th/id/OIP.JQb8qYSu_PSYAb-cYozGfAHaEU?rs=1&pid=ImgDetMain',
                  title: 'Home Loan',
                  subTitle: 'Take a stepcloser to ypur home with home loans.',
                  onTap: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                CustomImageTextBox(
                  imageURl:
                      'https://th.bing.com/th/id/OIP.tZd4XwjRxmCWZoAhnk01ZwHaE8?rs=1&pid=ImgDetMain',
                  title: 'Car Loan',
                  subTitle:
                      'Have been dreaming of buying a car? Then stop dreaming and click.',
                  onTap: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                CustomImageTextBox(
                  imageURl:
                      'https://th.bing.com/th/id/OIP.JQb8qYSu_PSYAb-cYozGfAHaEU?rs=1&pid=ImgDetMain',
                  title: 'Home Loan',
                  subTitle: 'Take a stepcloser to ypur home with home loans.',
                  onTap: () {},
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Profile Content'),
      ),
    );
  }
}
