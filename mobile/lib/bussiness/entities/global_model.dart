import 'package:flutter/material.dart';
import 'package:mobile/bussiness/entities/question.dart';
import 'package:mobile/bussiness/entities/user_answer.dart';
import 'package:mobile/bussiness/services/fill_database.dart';
import 'package:mobile/bussiness/services/question_service.dart';
import 'package:scoped_model/scoped_model.dart';

class GlobalStateModel extends Model {
  bool isLoading = false;
  bool showResult = false;
  String resultPhrase = '';
  Color resultColor;
  int stackIndex = 0;
  double score = 0;
  List<Question> questions = [];
  List<UserAnswer> answers = [];

  setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  setQuestions(List<Question> newQuestions) {
    questions = newQuestions;
    notifyListeners();
  }

  nextQuestion() {
    if (stackIndex == questions.length - 1) return true;
    stackIndex += 1;
    notifyListeners();
  }

  loadQuestions() async {
    isLoading = true;
    List<Question> newQuestions = await QuestionService.getAllQuestions();
    if(newQuestions.length <= 0) {
      for(int i = 0; i < FillDatabase.questions.length; i++) {
        await QuestionService.createQuestion(FillDatabase.questions[i]);
      }
      newQuestions = await QuestionService.getAllQuestions();
    }
    newQuestions.shuffle();
    setQuestions(newQuestions);
    isLoading = false;
    notifyListeners();
  }

  verifyScore() {
    answers.forEach((answer) {
      if(answer.userAnswer == answer.question.correctAnswer) {
        answer.isCorrect = true;
        score += 100;
      }
    });
    score /= answers.length;
    setResultColor();
  }

  setResultColor() {
    if(score <= 20) {
      resultColor = Colors.red;
      resultPhrase = 'Car companies is not your strength :(';
    } else if(score > 20 && score <= 40) {
      resultColor = Colors.orange;
      resultPhrase = 'You know just a bit of car companies';
    } else if(score > 40 && score <= 60) {
      resultColor = Colors.yellow;
      resultPhrase = 'were you just lucky?';
    } else if(score > 60 && score <= 80) {
      resultColor = Colors.green;
      resultPhrase = 'You know car companies very well!';
    } else {
      resultColor = Colors.blue;
      resultPhrase = 'You are an expert in car companies!';
    }
    notifyListeners();
  }

  reset() {
    isLoading = false;
    showResult = false;
    resultColor = null;
    stackIndex = 0;
    score = 0;
    questions = [];
    answers = [];
    notifyListeners();
  }
}

GlobalStateModel globalStateModel = GlobalStateModel();
