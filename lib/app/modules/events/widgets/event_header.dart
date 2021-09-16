import 'package:flutter/material.dart';
import 'package:hurry/app/modules/src/colors.dart';

import 'buttons.dart';

class EventHeader extends StatelessWidget {
  final String title;
  final String date;
  final String start;
  final String end;
  const EventHeader({
    Key? key,
    required this.title,
    required this.date,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$date - $start ate $end',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
