import 'package:bankapp/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileBox extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color? titleColor;
  final IconData? icons;
  final Color? iconColor;
  final VoidCallback? onTap;

  const ListTileBox({
    super.key,
    required this.imagePath,
    required this.title,
    this.titleColor,
    this.icons,
    this.iconColor, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imagePath),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color:titleColor?? Colors.black,
          fontSize: 14
        ),
      ),
      trailing: Icon(
        icons ?? Icons.arrow_forward_ios_outlined,
        color:iconColor?? AppColors.primaryColor,
        size: 15,
      ),
      onTap: onTap,
    );
  }
}
