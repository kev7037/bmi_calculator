import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottomButton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/BMIModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/roundIconButton.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';

enum GenderType {
  Male,
  Female,
  NotSelected
}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderType selectedGenderCode = GenderType.NotSelected;
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  int height = 180;
  int weight = 60;
  int age = 20;

  //1 Male - 2 Female
  // void updateColour(GenderType genderCode){
  //   if(genderCode == GenderType.Male){
  //     if(maleCardColour == inactiveCardColour){
  //       maleCardColour = activeCardColour;
  //       femaleCardColour = inactiveCardColour;
  //       selectedGenderCode = GenderType.Male;
  //     }else{
  //       maleCardColour = inactiveCardColour;
  //       selectedGenderCode = GenderType.NotSelected;
  //     }
  //   }else if (genderCode == GenderType.Female){
  //     if(femaleCardColour == inactiveCardColour){
  //       femaleCardColour = activeCardColour;
  //       maleCardColour = inactiveCardColour;
  //       selectedGenderCode = GenderType.Female;
  //     }else{
  //       femaleCardColour = inactiveCardColour;
  //       selectedGenderCode = GenderType.NotSelected;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                onTapFunction: (){
                  setState(() {
                    selectedGenderCode = GenderType.Male;
                  });
                },
                colour: (selectedGenderCode == GenderType.Male ? kActiveCardColour : kInactiveCardColour),
                cardChild: CustomIconWidget(
                  iconData: FontAwesomeIcons.mars,
                  text: 'MALE',
                ),
                )
              ),
              Expanded(child: ReusableCard(
                onTapFunction: (){
                  setState(() {
                    selectedGenderCode = GenderType.Female;
                  });
                },
                colour: (selectedGenderCode == GenderType.Female ? kActiveCardColour : kInactiveCardColour),
                  cardChild: CustomIconWidget(
                    iconData: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                )
              ),
            ],
          )),
          Expanded(child:ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
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
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: kActiveSliderCircleColour,
                      activeTrackColor: kActiveSliderColour,
                      inactiveTrackColor: kInactiveSliderColour,
                      overlayColor: kActiveSliderCircleOverLayColour
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (value){
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            )
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGTH',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onPressedFunction: (){
                                setState(() {
                                  if(weight > 30){
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              onPressedFunction: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              ),
              Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onPressedFunction: (){
                                setState(() {
                                  if(age > 15){
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              onPressedFunction: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              ),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            buttonColour: kBottomContainerColour,
            onTapFunction: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.pushNamed(
                context,
                '/ResultPage',
                arguments: {
                  "resultText" : calc.calculateBMI(),
                  "bmiResult" : calc.getResult(),
                  "interpretation" : calc.getInterpretation(),
                }
              );
            },
          )
        ],
      )
    );
  }
}