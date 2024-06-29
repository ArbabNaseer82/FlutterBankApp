import 'package:flutter/material.dart';

class CustomInputTextBox extends StatelessWidget {
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final TextEditingController controller;
  final String hintText;
  final bool? enabledInput;

  const CustomInputTextBox({
    this.leadingIcon,
    this.trailingIcon,
    required this.controller,required this.hintText,
    this.enabledInput,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            if (leadingIcon != null) ...[
              leadingIcon!,
              SizedBox(width: 2),
            ],
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                enabled: enabledInput,
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            if (trailingIcon != null) ...[
              trailingIcon!,
              SizedBox(width: 2,),
            ] 
          ],
        ),
      ),
    );
  }
}
