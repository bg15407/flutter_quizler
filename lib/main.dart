import 'package:flutter/material.dart';
import 'package:flutter_quizler/question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MaterialApp(home: QuizPage()));
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> answerIcons = [];

  // List<String> questions = [
  //   "First Question",
  //   "Second Question",
  //   "Third Question"
  // ];
  //
  // List<bool> answers = [false, true, true];

  int currentQuestion = 0;
  int score = 0;

  void changeQuestion() {
    int length = quizBrain.getSizeOfQuizBrain() - 1;
    // print(currentQuestion);
    // print(length);
    if (currentQuestion >= length) {
      Alert(
        context: context,
        //type: AlertType.info,
        title: "That was the Last Question",
        desc: "Great Job! You have answerd all",
        image: Icon(
          Icons.task,
          color: Colors.green,
          size: 54,
        ),
        buttons: [
          DialogButton(
            child: Text(
              "Try Again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                currentQuestion = 0;
                answerIcons = [];
              });
            },
            width: 120,
          )
        ],
      ).show();
      //currentQuestion = 0;
    } else {
      currentQuestion++;
      print('new $currentQuestion');
    }
  }

  void checkAnswer({required bool answer, required int question}) {
    if (quizBrain.getAnswer(questionNumber: question) == answer) {
      answerIcons.add(
        Icon(Icons.check, color: Colors.green),
      );
      print(score++);
    } else {
      answerIcons.add(
        Icon(Icons.close, color: Colors.red),
      );
      print(score);
    }
    changeQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Quizler App'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                  child: Text(
                      quizBrain.getQuestion(questionNumber: currentQuestion),
                      style: TextStyle(color: Colors.white))),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    print('Yes');
                    setState(() {
                      checkAnswer(answer: true, question: currentQuestion);
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('No', style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      print('No');
                      setState(() {
                        checkAnswer(answer: false, question: currentQuestion);
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: answerIcons,
            ),
          ],
        ),
      ),
    );
  }
}
