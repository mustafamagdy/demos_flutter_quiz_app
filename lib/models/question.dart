import 'package:flutter/material.dart';

class QuestionModel {
  final String title;
  final String description;
  final List<String> answers;
  final int rightAnswer;

  const QuestionModel(
      {required this.title,
      required this.answers,
      required this.rightAnswer,
      this.description = ''});
}
