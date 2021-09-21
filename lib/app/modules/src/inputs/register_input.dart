import 'package:flutter/material.dart';
import 'package:hurry/app/modules/src/colors.dart';
import 'package:hurry/app/modules/src/texts.dart';

class HTRegisterInput extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController controller;

  HTRegisterInput({
    Key? key,
    required this.hint,
    required this.obscure,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.backGroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Colors.black,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              style: HTText.primaryInputTextStyle,
              cursorColor: AppColors.primaryColor,
              obscureText: obscure,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: HTText.primaryInputTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
