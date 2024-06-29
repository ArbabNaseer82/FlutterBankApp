import 'package:bankapp/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomIconTextContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final IconData icon;
  final Color? iconColor;
  final double iconSize;
  final String text;
  final Color backgroundColor;
  final double borderRadius;
  final VoidCallback onTap;

  const CustomIconTextContainer({
    this.height,
    this.width,
    required this.icon,
    this.iconColor,
    this.iconSize = 30,
    required this.text,
    this.backgroundColor = const Color.fromARGB(255, 228, 228, 228),
    this.borderRadius = 10,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? MediaQuery.of(context).size.height * 0.11,
        width: width ?? MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Icon(
                icon,
                color: iconColor ?? AppColors.secondaryColor,
                size: iconSize,
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                textAlign: TextAlign.center,
                text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
