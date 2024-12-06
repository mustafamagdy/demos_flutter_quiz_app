import 'package:flutter/material.dart';
import 'package:flutter_app1/question.dart';

import 'models/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _quizNotStarted
          ? _letsStartQuiz()
          : _quizFinished
              ? _showResults()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Question(questions[questionIndex], _answerQuestion),
                    TextButton(
                      onPressed: () => print('test'),
                      child: Text('text button'),
                    ),
                    OutlinedButton(
                      onPressed: () => print('test 2'),
                      style: OutlinedButton.styleFrom(primary: Colors.red),
                      child: Text('another button'),
                    ),
                  ],
                ),
    );
  }

  Widget _letsStartQuiz() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Click start to begin',
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(onPressed: _startQuiz, child: const Text('Start')),
        ]);
  }

  Widget _showResults() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your score is',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            _scorePercent,
            style: TextStyle(
              fontSize: 26,
              color: _scoreColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: _startQuiz,
            child: const Text('Start again'),
          ),
        ]);
  }

  final questions = const [
    QuestionModel(
        title: 'question number 1',
        answers: ['answer 1', 'answer 2', 'answer 3'],
        rightAnswer: 1,
        description: 'some details here !!'),
    QuestionModel(
        title: 'question number 2',
        answers: ['answer a', 'answer b', 'answer c'],
        rightAnswer: 0),
    QuestionModel(
        title: 'question number 3',
        answers: ['answer x', 'answer y', 'answer z'],
        rightAnswer: 2),
  ];

  var questionIndex = -1;
  var score = 0;

  void _answerQuestion(bool correct) {
    setState(() {
      questionIndex++;
      if (correct) {
        score++;
      }
    });
  }

  void _startQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }

  bool get _quizNotStarted => questionIndex == -1;
  bool get _quizFinished => questionIndex >= questions.length;
  double get _score => ((score / questions.length) * 100.0);
  String get _scorePercent => '${_score.toStringAsFixed(0)}%';
  Color get _scoreColor => _score > 50.0 ? Colors.lightGreen : Colors.red;
}
