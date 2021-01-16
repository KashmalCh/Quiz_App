import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            title: Center(
              child: Text('Quiz'),
            ),
            backgroundColor: Colors.grey[800],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: App(),
          ),
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreChecker = [];
  int correctAnswers = 0;

  void alertMessage() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Quiz Completed",
      desc: "You answered $correctAnswers questions correctly!",
      buttons: [
        DialogButton(
          child: Text(
            "Play Again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }

  void answerChecker(bool selectedAnswer) {
    setState(() {
      if (quizBrain.getAnswer() == selectedAnswer) {
        correctAnswers++;
        scoreChecker.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreChecker.add(
          Icon(
            Icons.clear,
            color: Colors.red,
          ),
        );
      }
      if (quizBrain.isFinished()) {
        alertMessage();
        setState(() {
          correctAnswers = 0;
          scoreChecker.clear();
          quizBrain.reset();
        });
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                answerChecker(true);
              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                answerChecker(false);
              },
              child: Text(
                'False',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              child: Row(
                children: scoreChecker,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
