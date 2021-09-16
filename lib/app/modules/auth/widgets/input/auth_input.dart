import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hurry/app/modules/src/inputs/auth_inputs.dart';

class AuthInput extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormater;
  AuthInput({
    Key? key,
    required this.hint,
    required this.obscure,
    required this.controller,
    this.inputFormater,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        decoration: AuthInputStyle.boxAuthInputdecoration(Color(0xFFFFFFFF), 50),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          cursorColor: Colors.black38,
          style: AuthInputStyle.textInputStyle,
          decoration: AuthInputStyle.authInputDecoration(hint),
          inputFormatters: inputFormater,
        ),
      ),
    );
  }
}
