import 'question.dart';

class QuizzBrain {
  int _questionNumber = 0;

  List<Question> _listQuestion = [
    Question(question: "question 1", questionAnswer: false),
    Question(question: "question 2", questionAnswer: true),
    Question(question: "question 3", questionAnswer: false),
    Question(question: "question 4", questionAnswer: true),
    Question(question: "question 5", questionAnswer: false),
    Question(question: "question 6", questionAnswer: true),
    Question(question: "question 7", questionAnswer: true),
    Question(question: "question 8", questionAnswer: false),
    Question(question: "question 9", questionAnswer: true),
    Question(question: "question 10", questionAnswer: false),
  ];

  void reset() {
    _questionNumber = 0;
  }

  bool isFinished() {
    if (_questionNumber < (_listQuestion.length - 1)) {
      return false;
    } else {
      return true;
    }
  }

  bool getQuestionAnswer() {
    return _listQuestion[_questionNumber].questionAnswer;
  }

  String getQuestionText() {
    return _listQuestion[_questionNumber].question;
  }

  void getNextQuestion() {
    if (_questionNumber < (_listQuestion.length - 1)) {
      _questionNumber++;
    }
    print("test");
  }
}
