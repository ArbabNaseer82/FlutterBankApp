import 'package:bankapp/Constants/colors.dart';
import 'package:flutter/material.dart';

class LocatorButton extends StatelessWidget {
  final double? height;
  final bool locationValue;
  final String title;
  final Color borderColor;
  final IconData icons;

  const LocatorButton({
    Key? key,
     this.height,
    required this.locationValue,
    required this.title,
    required this.borderColor,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: borderColor),
        borderRadius: BorderRadius.circular(10),
        color: locationValue ? AppColors.primaryColor : Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            locationValue
                ? AppColors.primaryColor.withOpacity(0.9) // Darker shade
                : Colors.white.withOpacity(0.9), // Lighter shade
            locationValue
                ? AppColors.primaryColor.withOpacity(0.7) // Medium shade
                : Colors.white.withOpacity(0.7), // Medium shade
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
              icons,
              color: locationValue ? Colors.white : Colors.black,
              size: 30,
            ),
            SizedBox(height: 5,),
            Text(
              title,
              style: TextStyle(
                color: locationValue ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
