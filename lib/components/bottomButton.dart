import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({this.onTapFunction, this.buttonTitle, this.buttonColour});

  final Function onTapFunction;
  final String buttonTitle;
  final Color buttonColour;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButttonTextStyle,
          ),
        ),
        color: buttonColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
