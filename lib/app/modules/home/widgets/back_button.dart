import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      child: MaterialButton(
        color: Colors.black45,
        height: 56,
        minWidth: 56,
        onPressed: () {
          Modular.to.pop();
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
