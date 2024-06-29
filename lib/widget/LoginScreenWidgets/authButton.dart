import 'package:bankapp/Constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback  onTap;
  final Color buttonColor;

  const CustomButton({
    required this.text,
    required this.onTap,
    this.buttonColor = AppColors.primaryColor,
  });

 @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
