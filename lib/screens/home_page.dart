import 'package:bmi_calc_flutter_23/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleCardColor = kInactiveColor;
  Color femaleCardColor = kInactiveColor;

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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          print('male pressed');
                          updateColor(Gender.male);
                        });
                      },
                      child: reusableCard(
                        color: maleCardColor,
                        child: CardItems(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          print('female pressed');
                          updateColor(Gender.female);
                        });
                      },
                      child: reusableCard(
                        color: femaleCardColor,
                        child: CardItems(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
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
                child: Text('data'),
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
                      child: Text('data1'),
                    ),
                  ),
                  Expanded(
                    child: reusableCard(
                      color: kInactiveColor,
                      child: Text('data'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              width: double.infinity,
              color: Colors.yellow,
              child: Text('data'),
            )
          ],
        ));
  }
}

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
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}

class reusableCard extends StatelessWidget {
  Widget child;
  Color color;
  reusableCard({required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}
