import 'package:flutter/material.dart';
import 'package:bmi_calc_flutter_23/constants.dart';
import 'package:bmi_calc_flutter_23/compenents/reusable_cards.dart';
import 'package:bmi_calc_flutter_23/compenents/bottom_button.dart';
import 'package:bmi_calc_flutter_23/compenents/bmi_calc.dart';

class Result extends StatelessWidget {
  Result(
      {required this.resultValue,
      required this.bmiStatus,
      required this.interpretetion});

  String resultValue;
  String bmiStatus;
  String interpretetion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 0, 5),
            child: Text(
              'Your Result',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 50,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: reusableCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiStatus,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: kResultColor),
                    ),
                    Text(
                      resultValue,
                      style: TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        interpretetion,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                color: kActiveColor),
          ),
          BottomButton(
            label: 'RE-CALCULATE YOUR BMI',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
