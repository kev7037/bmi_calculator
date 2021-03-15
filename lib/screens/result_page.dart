import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/BMIModel.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottomButton.dart';

class ResultsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final  Map<String, Object> bmiModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar:AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiModel['bmiResult'],
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiModel['resultText'],
                    style: kBMITextStyle,
                  ),
                  Text(
                    bmiModel['interpretation'],
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            buttonColour: kBottomContainerColour,
            onTapFunction: (){
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }
}
