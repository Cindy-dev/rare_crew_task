import 'package:flutter/material.dart';

import '../constants/colors.dart';

//text form field for the authentication screens
textForm(String? hintText, Icon? prefixIcon, TextEditingController controller,
    String? Function(String?)? validator) {
  return TextFormField(
    validator: validator,
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
