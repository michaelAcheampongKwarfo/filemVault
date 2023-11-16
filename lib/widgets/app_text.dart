import 'package:film_vault/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  const AppText(
      {super.key,
      required this.text,
      required this.fontSize,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.whiteColor,
        fontFamily: 'Times New Roman',
      ),
    );
  }
}
