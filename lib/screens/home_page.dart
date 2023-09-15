import 'package:bmi_calc_flutter_23/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calc_flutter_23/compenents/card_items.dart';
import 'package:bmi_calc_flutter_23/compenents/reusable_cards.dart';
import 'package:bmi_calc_flutter_23/screens/result_page.dart';
import 'package:bmi_calc_flutter_23/compenents/bottom_button.dart';
import 'package:bmi_calc_flutter_23/compenents/bmi_calc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleCardColor = kInactiveColor;
  Color femaleCardColor = kInactiveColor;
  int height = 180;
  int weight = 60;
  int age = 20;

  void updateColor(gender) {
    if (gender == Gender.male) {
      if (maleCardColor == kInactiveColor) {
        maleCardColor = kActiveColor;
        femaleCardColor = kInactiveColor;
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColor == kInactiveColor) {
        femaleCardColor = kActiveColor;
        maleCardColor = kInactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: reusableCard(
                      onTap: () {
                        setState(() {
                          print('male pressed1');
                          updateColor(Gender.male);
                        });
                      },
                      color: maleCardColor,
                      child: CardItems(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: reusableCard(
                      onTap: () {
                        setState(() {
                          print('female pressed');
                          updateColor(Gender.female);
                        });
                      },
                      color: femaleCardColor,
                      child: CardItems(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: reusableCard(
                color: kInactiveColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kContentTitle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kContentValue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'cm',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFF8D8E98)),
                        ),
                      ],
                    ),
                    Slider(
                        activeColor: kButtonColor,
                        min: 120.0,
                        max: 240,
                        value: height.toDouble(),
                        onChanged: (newValue) {
                          print(newValue);
                          setState(() {
                            height = newValue.round();
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: reusableCard(
                        color: kInactiveColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kContentTitle,
                            ),
                            Text(
                              weight.toString(),
                              style: kContentValue,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  child: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  backgroundColor: kButtonSecondaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                  child: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  backgroundColor: kButtonSecondaryColor,
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: reusableCard(
                        color: kInactiveColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kContentTitle,
                            ),
                            Text(
                              age.toString(),
                              style: kContentValue,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  child: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  backgroundColor: kButtonSecondaryColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                  child: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  backgroundColor: kButtonSecondaryColor,
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            BottomButton(
              label: 'CALCULATE YOUR BMI',
              onTap: () {
                CalcBrain calc = CalcBrain(height: height, weight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Result(
                    resultValue: calc.CalcBmi(),
                    bmiStatus: calc.BmiStatus(),
                    interpretetion: calc.getInterpretation(),
                  );
                }));
              },
            ),
          ],
        ));
  }
}
