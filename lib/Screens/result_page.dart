import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/resuable.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF111328),
        title: Text(
          "Calculate Result",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: Text(
              "Your Result",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          )),
          Expanded(
              flex: 5,
              child: ResuableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(resultText,
                          style: TextStyle(
                            color: Colors.green,
                          )),
                      Text(
                        bmiResult,
                        style: TextStyle(
                            fontSize: 100.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        interpretation,
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ))),
          GestureDetector(
            onTap: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              height: 70.0,
              width: double.infinity,
              color: bottomContainerColor,
              child: const Center(
                child: Text(
                  "RE-CALCULATE",
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
