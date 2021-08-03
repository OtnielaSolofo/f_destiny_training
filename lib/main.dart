import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizzBrain quizbrain = QuizzBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white10,
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> iconType = [];

  void checkAnswer(bool userAnswer) {
    setState(() {
      if (quizbrain.isFinished()) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Quizz alert",
          desc: "Want you go to beginin ? ",
          buttons: [
            DialogButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        iconType = [];
        quizbrain.reset();
      } else {
        setState(() {
          if (userAnswer == quizbrain.getQuestionAnswer()) {
            iconType.add(Icon(
              Icons.check,
              color: Colors.green,
            ));
          } else {
            iconType.add(Icon(
              Icons.close,
              color: Colors.red,
            ));
          }

          quizbrain.getNextQuestion();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Text(
              quizbrain.getQuestionText(),
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          flex: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Expanded(
              child: FlatButton(
            onPressed: () {
              checkAnswer(true);
            },
            color: Colors.green,
            child: Text(
              "TRUE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Expanded(
              child: FlatButton(
            onPressed: () {
              checkAnswer(false);
            },
            color: Colors.red,
            child: Text(
              "FALSE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )),
        ),
        Row(
          children: iconType,
        )
      ],
    );
  }
}
