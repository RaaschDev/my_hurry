import 'package:flutter/material.dart';
import 'package:hurry/app/modules/src/colors.dart';

class ButtonsWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonsWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.maxFinite,
      height: 62,
      color: AppColors.backGroundColor,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
    );
  }
}
