import 'package:flutter/material.dart';

class EventBanner extends StatelessWidget {
  final String? img;
  const EventBanner({Key? key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * .3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('$img'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
