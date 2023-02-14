import 'package:flutter/material.dart';

import 'bottom_button.dart';
import 'calculator_brain.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.calculatorBrain});

  final CalculatorBrain calculatorBrain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: const Text(
              "Your Result",
              style: kLableTextStyle,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 25, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kActiveCardColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    calculatorBrain.getResult(),
                    style: kLableTextStyle,
                  ),
                  Text(
                    calculatorBrain.calculateBMI(),
                    style: kBMITextStyle,
                  ),
                  Text(
                    calculatorBrain.getInterpretation(),
                    style: kLableTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

}

