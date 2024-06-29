import 'package:bankapp/Constants/colors.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

class CountryPickerWidget extends StatelessWidget {
  const CountryPickerWidget({Key}) : super();

  @override
  Widget build(BuildContext context) {
    return CountryListPick(
      theme: CountryTheme(
        isShowFlag: true,
        isShowTitle: false,
        isShowCode: false,
        isDownIcon: false,
        showEnglishName: false,
        labelColor: AppColors.primaryColor,
      ),
      // initialSelection: '+62',
      // or
      initialSelection: 'US',
      onChanged: (countryCode) {
        // Handle country selection logic here if needed
      },
    );
  }
}
