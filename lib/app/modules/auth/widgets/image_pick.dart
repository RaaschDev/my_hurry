import 'package:flutter/material.dart';
import 'package:hurry/app/modules/src/colors.dart';

class ImageButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ImageButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.maxFinite,
      height: 30,
      color: AppColors.primaryColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
