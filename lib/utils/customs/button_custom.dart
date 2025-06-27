import 'package:flutter/material.dart';
import 'package:pottery/congifures/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Color? color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.color=AppColor.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return isPrimary
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color),
            onPressed: onPressed,
            child: Text(text),
          )
        : TextButton(
            style: TextButton.styleFrom(foregroundColor: color),
            onPressed: onPressed,
            child: Text(text),
          );
  }
}
