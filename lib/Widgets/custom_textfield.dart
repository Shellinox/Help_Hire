import 'package:flutter/material.dart';
import 'package:help_hive/Utils/Colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObsecureText;
  final int maxLines;
  final int minLines;
  final TextInputType keyboardType;
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.isObsecureText = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: primaryTextColor),
      obscureText: isObsecureText,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(20),
        hintStyle: const TextStyle(color: hintTextColor),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
