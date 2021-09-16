import 'package:flutter/material.dart';
import 'package:hurry/app/modules/src/colors.dart';

class AuthInputStyle {
  static BoxDecoration boxAuthInputdecoration(Color color, double radius) => BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Colors.black54,
            offset: Offset(2, 2),
          ),
        ],
      );

  static InputDecoration authInputDecoration(String hint) => InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 18,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w400,
        ),
      );

  static TextStyle textInputStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
