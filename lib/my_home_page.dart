import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'result_page.dart';
import 'round_icon_buton.dart';

//contants

enum Gender {
  male,
  female;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 65;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: "MALE",
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: "FEMALE",
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "HEIGHT",
                    style: kLableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLableTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kBottomContainerColor,
                      overlayColor: const Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 240.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              color: kActiveCardColor,
              onTap: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLableTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLableTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          calculatorBrain: calc,
                        )),
              );
            },
            buttonTitle: "CALCULATOR",
          )
        ],
      ),
    );
  }
}
