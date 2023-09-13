import 'package:flutter/material.dart';

class reusableCard extends StatelessWidget {
  Widget child;
  Color color;
  void Function()? onTap;
  reusableCard({required this.child, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child,
      ),
    );
  }
}
