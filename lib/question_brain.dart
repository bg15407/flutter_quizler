import 'package:flutter_quizler/questions.dart';

class QuizBrain {
  List<Question> _myQuestions = [
    Question(questionText: 'First Question', answer: false),
    Question(questionText: 'Second Question', answer: true),
    Question(questionText: 'Third Question', answer: true)
  ];

  String getQuestion({required int questionNumber}) {
    return _myQuestions[questionNumber].questionText;
  }

  bool getAnswer({required int questionNumber}) {
    return _myQuestions[questionNumber].answer;
  }

  int getSizeOfQuizBrain() {
    return _myQuestions.length;
  }
}
