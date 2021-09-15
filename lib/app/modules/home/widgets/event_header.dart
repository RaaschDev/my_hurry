import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
            SizedBox(
              height: 40,
            ),
            ButtonsWidget(
              onPressed: () {
                Modular.to.pushNamed('/event/lineup');
              },
              text: 'LINE UP',
            ),
            SizedBox(
              height: 20,
            ),
            ButtonsWidget(
              onPressed: () {},
              text: 'Consumiveis',
            ),
            SizedBox(
              height: 20,
            ),
            ButtonsWidget(
              onPressed: () {},
              text: 'Endereco',
            ),
            SizedBox(
              height: 100,
            ),
            MaterialButton(
              onPressed: () {},
              minWidth: double.maxFinite,
              height: 62,
              color: AppColors.primaryColor,
              child: Text(
                'Comprar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
