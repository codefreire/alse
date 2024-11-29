import 'package:alse/configuration/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomLabelWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final bool isLink;
  final TextAlign textAlign;
  final String? routeName;

  const CustomLabelWidget({
    super.key,
    required this.text,
    this.color = AppColors.primaryColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.isLink = false,
    this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    if (isLink && routeName != null) {
      return GestureDetector(
        onTap: () => {context.pushNamed(routeName!)},
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: TextDecoration.underline,
          ),
          textAlign: textAlign,
          maxLines: maxLines,
        ),
      );
    }
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
