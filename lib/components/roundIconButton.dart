import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.onPressedFunction, @required this.iconData});

  final IconData iconData;
  final Function onPressedFunction;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(iconData),
        onPressed: onPressedFunction,
        elevation: 0.0,
        shape: CircleBorder(),
        fillColor: kRoundButtonColour,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        )
    );
  }
}
