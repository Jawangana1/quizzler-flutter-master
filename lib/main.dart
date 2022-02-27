import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

List<Icon> scorekeeper = [
  
];

QuizBrain quiz = QuizBrain();

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = quiz.getAnswer();

                if (correctAnswer == true) {
                  scorekeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                } else {
                  scorekeeper.add(
                    Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  );
                }
                setState(() {
                  quiz.nextQuestion();
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer = quiz.getAnswer();

                if (correctAnswer == false) {
                  scorekeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                } else {
                  scorekeeper.add(
                    Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  );
                }
                setState(() {
                  quiz.nextQuestion();
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 
question2: , true,
question3: ue,
*/
