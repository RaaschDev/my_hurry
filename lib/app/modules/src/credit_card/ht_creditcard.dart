import 'package:flutter/material.dart';
import 'package:hurry/app/modules/src/colors.dart';
import 'package:hurry/app/modules/src/texts.dart';

class HTCreditCard extends StatelessWidget {
  final double height;
  final double width;
  const HTCreditCard({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.backGroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            offset: Offset(2, 2),
            color: Colors.black,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'VISA',
                  style: HTText.primaryButtonTextStyle,
                ),
                Text(
                  '22/25',
                  style: HTText.primaryButtonTextStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'XXXX-XXXX-XXXX-XXXX',
                  style: HTText.primaryTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Raphael Raasch Fialho',
                  style: HTText.primaryTextStyle,
                ),
                Text(
                  'XXX',
                  style: HTText.primaryTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
