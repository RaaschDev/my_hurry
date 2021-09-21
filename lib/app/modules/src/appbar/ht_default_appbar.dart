import 'package:flutter/material.dart';
import 'package:hurry/app/modules/src/colors.dart';

class HTDefaultAppBar extends StatelessWidget {
  const HTDefaultAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(),
      ),
    );
  }
}
