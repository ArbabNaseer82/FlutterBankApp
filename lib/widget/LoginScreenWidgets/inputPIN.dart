import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinInputWidget extends StatelessWidget {
  final TextEditingController pinController;
  final void Function(String) onCompleted;

  const PinInputWidget({
    Key? key,
    required this.pinController,
    required this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(213, 219, 223, 1),width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Pinput(
        length: 4, // Specify the length of PIN to 4
        controller: pinController,
        onCompleted: onCompleted,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyDecorationWith(
          border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
          borderRadius: BorderRadius.circular(8),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
            color: Color.fromRGBO(234, 239, 243, 1),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
