import 'package:flutter/material.dart';

class BMIModel {

  BMIModel({@required this.bmiResult, @required this.resultText, @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
}