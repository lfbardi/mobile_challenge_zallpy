import 'package:mobile/bussiness/entities/question.dart';

class FillDatabase {
  static List<Question> questions = [
    Question(
      title: 'Which country BMW came from?',
      company: 'bmw',
      correctAnswer: 'Germany',
      answerA: 'England',
      answerB: 'USA',
      answerC: 'Germany',
      answerD: 'Japan',
    ),
    Question(
      title: 'Which country Toyota came from?',
      company: 'toyota',
      correctAnswer: 'Japan',
      answerA: 'England',
      answerB: 'USA',
      answerC: 'Germany',
      answerD: 'Japan',
    ),
    Question(
      title: 'Which country Mini came from?',
      company: 'mini',
      correctAnswer: 'England',
      answerA: 'England',
      answerB: 'USA',
      answerC: 'Germany',
      answerD: 'Japan',
    ),
    Question(
      title: 'Which country General Motors came from?',
      company: 'general_motors',
      correctAnswer: 'USA',
      answerA: 'England',
      answerB: 'USA',
      answerC: 'Germany',
      answerD: 'Japan',
    ),
    Question(
      title: 'Which country Rolls-Royce came from?',
      company: 'rolls_royce',
      correctAnswer: 'England',
      answerA: 'England',
      answerB: 'USA',
      answerC: 'Germany',
      answerD: 'Japan',
    )
  ];
}
