import 'package:bankapp/Constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final double? boxHeight;
  final Color boxColor;
  final VoidCallback onTap;
  final IconData icons;
  final String title;
  final Color? borderColor;

  const ShareButton({
    super.key,
    this.boxHeight,
    required this.boxColor,
    required this.onTap,
    required this.icons,
    required this.title, this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: boxHeight ?? 50,
        decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(width: 1, color:borderColor?? AppColors.primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
