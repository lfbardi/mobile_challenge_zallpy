import 'package:mobile/bussiness/entities/question.dart';

class UserAnswer {
  Question question;
  String userAnswer;
  bool isCorrect = false;

  UserAnswer({ this.question, this.userAnswer, this.isCorrect });
}