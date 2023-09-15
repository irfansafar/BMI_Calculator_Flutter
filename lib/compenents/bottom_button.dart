import 'package:flutter/material.dart';
import 'package:bmi_calc_flutter_23/constants.dart';

class BottomButton extends StatelessWidget {
  String label;
  void Function() onTap;

  BottomButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: double.infinity,
        color: kButtonColor,
        child: Center(
          child: Text(
            label,
            style: kBottomButton,
          ),
        ),
      ),
    );
  }
}
