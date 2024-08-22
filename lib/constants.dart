import 'package:flutter/material.dart';

class Constants {
  static const Color primary = Color.fromARGB(255, 8, 138, 226);
  static const Color darkGrey = Color.fromARGB(255, 59, 59, 59);
  static const Color dark = Color(0xFF272727);
  static const Color borderPrimary = Color(0xFFD9D9D9);

  static const double tfRadius = 10.0;

  static String? tfValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter valid credentials.";
    }
    return null;
  }

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: primary,
      elevation: 0,
      foregroundColor: dark,
      side: const BorderSide(color: borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: darkGrey,
    suffixIconColor: darkGrey, iconColor: darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: 15, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 13, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(tfRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(tfRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(tfRadius),
      borderSide: const BorderSide(width: 1, color: dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(tfRadius),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(tfRadius),
      borderSide: const BorderSide(width: 2, color: Colors.red),
    ),
  );
}
