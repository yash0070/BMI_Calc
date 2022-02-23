import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_13/components/resuable.dart';
import '../components/resuable.dart';
import '../components/icon_content.dart';
import 'result_page.dart';
import '../calculatorBrain.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

// create an enum for male and female

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  get children => null;

  int height = 180;
  int weight = 50;
  int age = 15;

  // Color maleCardColour = inactiveCardColor;
  // Color femaleCardColour = inactiveCardColor;

  // void updateCardColour(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColour == inactiveCardColor) {
  //       maleCardColour = activeCardColor;
  //       femaleCardColour = inactiveCardColor;
  //     } else {
  //       maleCardColour = inactiveCardColor;
  //     }
  //   }
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColour == inactiveCardColor) {
  //       femaleCardColour = activeCardColor;
  //       maleCardColour = inactiveCardColor;
  //     } else {
  //       femaleCardColour = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: const Color(0xFF0A0E21),
          title: const Center(child: Text("BMI Calculator"))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = (Gender.male);
                  });
                },
                child: ResuableCard(
                  colour: selectedGender == Gender.male
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: IconContent(
                    icon: Icons.male,
                    label: "MALE",
                  ),
                ),
              )),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = (Gender.female);
                    });
                  },
                  child: ResuableCard(
                      colour: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        icon: Icons.female,
                        label: "FEMALE",
                      )),
                ),
              ),
            ],
          )),
          Expanded(
              child: ResuableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("HEIGHT", style: labelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "cm",
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120,
                              max: 220,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              }),
                        )
                      ]))),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ResuableCard(
                colour: activeCardColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT", style: labelTextStyle),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w900),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            child: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            elevation: 6.0,
                            constraints: BoxConstraints.tightFor(
                                width: 50.0, height: 50.0),
                            shape: CircleBorder(),
                            fillColor: Color(0xFF4C4F5E),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RawMaterialButton(
                            child: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            elevation: 6.0,
                            constraints: BoxConstraints.tightFor(
                                width: 50.0, height: 50.0),
                            shape: CircleBorder(),
                            fillColor: Color(0xFF4C4F5E),
                          ),
                        ],
                      ),
                    ]),
              )),
              Expanded(
                  child: ResuableCard(
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                child: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                elevation: 6.0,
                                constraints: BoxConstraints.tightFor(
                                    width: 50.0, height: 50.0),
                                shape: CircleBorder(),
                                fillColor: Color(0xFF4C4F5E),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              RawMaterialButton(
                                child: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                elevation: 6.0,
                                constraints: BoxConstraints.tightFor(
                                    width: 50.0, height: 50.0),
                                shape: CircleBorder(),
                                fillColor: Color(0xFF4C4F5E),
                              ),
                            ],
                          ),
                        ],
                      )))
            ],
          )),
          // Container(
          //   height: 70.0,
          //   child: RaisedButton(
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => ResultPage()));
          //     },
          //     color: bottomContainerColor,
          //     child: Text("CALCULATE"),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight, bmi: 0);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              height: 70.0,
              width: double.infinity,
              color: bottomContainerColor,
              child: const Center(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class RoundIconButton extends StatelessWidget {
//   RoundIconButton({required this.icon, required this.onPressed});

//   final IconData icon;
//   final Function onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       child: Icon(icon),
//       onPressed: onPressed(),
//       elevation: 6.0,
//       constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
//       shape: CircleBorder(),
//       fillColor: Color(0xFF4C4F5E),
//     );
//   }
// }

