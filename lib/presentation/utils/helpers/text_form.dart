import 'package:flutter/material.dart';

import '../constants/colors.dart';

textForm(String? hintText, Icon? prefixIcon, TextEditingController controller) {
  return TextFormField(
    cursorColor: orangeColor,
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      prefixIconColor: hintTextColor,
      fillColor: whiteColor,
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: whiteColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: whiteColor)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: whiteColor, width: 0.0)),
      hintText: hintText,
      hintStyle: const TextStyle(
          color: hintTextColor,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          fontSize: 16),
    ),
  );
}
