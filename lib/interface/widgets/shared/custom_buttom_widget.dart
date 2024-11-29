import 'package:alse/configuration/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtomWidget extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final double radius;
  final String? iconPath;
  final double textFontSize;
  final Color colorText;
  final Color colorBorder;

  const CustomButtomWidget({
    super.key,
    required this.text,
    this.color = AppColors.secondaryColor,
    required this.onPressed,
    this.radius = 30,
    this.iconPath,
    this.textFontSize = 14,
    this.colorText = AppColors.primaryColor,
    this.colorBorder = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          elevation: WidgetStateProperty.all(5),
          backgroundColor: WidgetStateProperty.all(color),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            )
          ),
          minimumSize: WidgetStateProperty.all(const Size(double.infinity, 50)),
          side: WidgetStateProperty.all(
            BorderSide(
              color: colorBorder,
            ),
          ),
        ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null) ...[
            Image.asset(
              iconPath!,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: textFontSize,
              fontWeight: FontWeight.bold,
              color: colorText,
            ),
          ),
        ],
      ),
    );
  }
}
