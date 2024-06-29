import 'package:bankapp/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String mainText;
  final String textbutton;
  final Color? mainTextColor;
  final Color? textButtonColor;
  final VoidCallback? ontap;
  final double? mainTextSize;
  final double? verticalPadding;

  const TextRow({
    super.key,
    required this.mainText,
    required this.textbutton,
    this.mainTextColor,
    this.textButtonColor,
    this.ontap,
    this.mainTextSize,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 10.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mainText,
            style: TextStyle(
              color: mainTextColor ?? Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: mainTextSize ?? 22,
            ),
          ),
          TextButton(
            onPressed: ontap,
            child: Text(
              textbutton,
              style: TextStyle(
                color: textButtonColor ?? AppColors.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
