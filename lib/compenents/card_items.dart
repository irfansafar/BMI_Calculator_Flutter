import 'package:flutter/material.dart';
import 'package:bmi_calc_flutter_23/constants.dart';

class CardItems extends StatelessWidget {
  final IconData icon;
  final String label;
  CardItems({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kContentTitle,
        ),
      ],
    );
  }
}
