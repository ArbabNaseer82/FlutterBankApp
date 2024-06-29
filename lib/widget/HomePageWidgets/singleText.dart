import 'package:flutter/cupertino.dart';

class SingleText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? textSize;
  final FontWeight? fontWeight;

  const SingleText(
      {super.key,
      required this.text,
      this.color,
      this.textSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: textSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
