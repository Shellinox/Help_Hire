import 'package:flutter/material.dart';
import 'package:help_hive/Utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final void Function()? onPressed;
  const CustomButton({super.key, required this.buttonTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          minimumSize: const Size(double.infinity, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
      child: Text(
        buttonTitle,
        style: const TextStyle(
            color: primaryTextColor, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
