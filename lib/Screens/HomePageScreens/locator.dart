import 'package:bankapp/Constants/colors.dart';
import 'package:bankapp/widget/GlobalWidgets/ShareButton.dart';
import 'package:bankapp/widget/HomePageWidgets/Slider.dart';
import 'package:bankapp/widget/HomePageWidgets/singleText.dart';
import 'package:bankapp/widget/TransfarScreen/InputTextBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Locator extends StatefulWidget {
  const Locator({super.key});

  @override
  State<Locator> createState() => _LocatorState();
}

class _LocatorState extends State<Locator> {
  bool locationValue = true;
  double sliderValue = 0;

  //nearMeActive is active method
  void nearMeActive() {
    setState(() {
      locationValue = true;
    });
    print(locationValue);
  }

  // zipCodeActive active me
  void zipCodeActive() {
    setState(() {
      locationValue = false;
    });
    print(locationValue);
  }

  // This method will update the sliderValue when the slider changes
  void onSliderChanged(double value) {
    setState(() {
      sliderValue = value;
    });
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
          'Locator',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          nearMeActive();
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.purple),
                            borderRadius: BorderRadius.circular(10),
                            color: locationValue
                                ? AppColors.primaryColor
                                : Colors.white,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                locationValue
                                    ? AppColors.primaryColor
                                        .withOpacity(0.9) // Darker shade
                                    : Colors.white
                                        .withOpacity(0.9), // Lighter shade
                                locationValue
                                    ? AppColors.primaryColor
                                        .withOpacity(0.7) // Medium shade
                                    : Colors.white
                                        .withOpacity(0.7), // Medium shade
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color:
                                      locationValue ? Colors.white : Colors.black,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Near Me',
                                  style: TextStyle(
                                    color: locationValue
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          zipCodeActive();
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                            color: !locationValue
                                ? AppColors.primaryColor
                                : Colors.white,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                !locationValue
                                    ? AppColors.primaryColor
                                        .withOpacity(0.9) // Darker shade
                                    : Colors.white
                                        .withOpacity(0.9), // Lighter shade
                                !locationValue
                                    ? AppColors.primaryColor
                                        .withOpacity(0.7) // Medium shade
                                    : Colors.white
                                        .withOpacity(0.7), // Medium shade
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: !locationValue
                                      ? Colors.white
                                      : Colors.black,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  'Search by Zip code',
                                  style: TextStyle(
                                    color: !locationValue
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    Visibility(
                      visible: locationValue,
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select Radius',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SliderLine(
                                      initialValue: sliderValue,
                                      maxValue: 100,
                                      divisions: 100,
                                      onChanged: onSliderChanged,
                                    ),
                                  ),
                                  Text(
                                    '${sliderValue.round()} Km',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: !locationValue,
                        child: Column(
                          children: [
                            SingleText(
                              text: 'Select ZIP Code',
                              color: Colors.grey,
                              textSize: 15,
                            ),
                            CustomInputTextBox(
                              controller: TextEditingController(),
                              hintText: 'K1F B32',
                              trailingIcon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SizedBox(height: 10,),
                            SingleText(
                              text: 'Search by',
                              color: Colors.grey,
                              textSize: 15,
                            ),
                            CustomInputTextBox(
                              controller: TextEditingController(),
                              hintText: 'Select type',
                              trailingIcon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                child: ShareButton(
                  boxColor: AppColors.primaryColor,
                  onTap: () {},
                  icons: Icons.search,
                  title: 'SEARCH',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
