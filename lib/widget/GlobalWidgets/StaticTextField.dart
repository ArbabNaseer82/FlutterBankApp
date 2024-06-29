import 'package:bankapp/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticTextField extends StatelessWidget {
  final String text;
  final Color? color;
  final double? textSize;
  final FontWeight? textWeight;
  const StaticTextField({super.key, required this.text, this.color, this.textSize, this.textWeight,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color:color?? AppColors.primaryColor,
                    fontWeight:textWeight?? FontWeight.w700,
                    fontSize:textSize?? 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
