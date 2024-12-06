import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'dart:math';

import 'models/question.dart';

typedef AnswerQuestionCallback = void Function(bool);

class Question extends StatelessWidget {
  final QuestionModel question;
  final AnswerQuestionCallback answerQuestion;

  Question(this.question, this.answerQuestion, {Key? key}) : super(key: key);

  void _selectAnswer(int selectedAnswer) {
    answerQuestion(question.rightAnswer == selectedAnswer);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10.0),
          child: Text(
            question.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            question.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: question.answers
                .mapIndexed((index, answer) => _buildAnswerButton(index))
                .toList(),
          ),
        ),
      ],
    );
  }

  final colors = [
    Colors.deepOrange,
    Colors.purpleAccent,
    Colors.lightGreen,
    Colors.amberAccent
  ];
  final r = Random();

  Widget _buildAnswerButton(int answerIndex) {
    var color = colors[r.nextInt(colors.length)];
    return SizedBox(
      width: 100,
      height: 100,
      child: ElevatedButton(
        onPressed: () => _selectAnswer(answerIndex),
        child: Text(question.answers[answerIndex]),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shadowColor: MaterialStateProperty.all(Colors.amber),
        ),
      ),
    );
  }
}
