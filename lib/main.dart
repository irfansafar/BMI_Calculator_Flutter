import 'package:flutter/material.dart';
import 'package:bmi_calc_flutter_23/screens/home_page.dart';
import 'constants.dart';

void main() {
  runApp(const BMIApps());
}

class BMIApps extends StatelessWidget {
  const BMIApps({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator1',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: HomePage(),
    );
  }
}
