import 'package:flutter/material.dart';
import 'package:mobile/bussiness/entities/question.dart';
import 'package:mobile/bussiness/entities/user_answer.dart';
import 'package:mobile/bussiness/entities/global_model.dart' show GlobalStateModel, globalStateModel;
import 'package:mobile/pages/questions_stepper/widgets/custom_buttom.dart';
import 'package:mobile/pages/result_page/result_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class QuestionTile extends StatefulWidget {
  final Question question;

  QuestionTile({this.question});

  @override
  _QuestionTileState createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {

  String userAnswer;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, GlobalStateModel model) {
      return Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF182848), Color(0xFF4b6cb7)])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Container(
                            width: 300,
                            height: 200,
                            child: Card(
                              elevation: 5,
                              color: Color(0xFF192b4d),
                              child: Center(
                                  child: Text(
                                widget.question.title,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                          Positioned(
                            top: -50,
                            left: 50,
                            child: Container(
                              width: 200,
                              height: 100,
                              child: Image.asset(
                                  "assets/images/${widget.question.company}_logo.png"),
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CustomButtom(
                        text: widget.question.answerA,
                        onTap: () {
                          nextQuestion(widget.question.answerA);
                        },
                      ),
                      CustomButtom(
                        text: widget.question.answerB,
                        onTap: () {
                          nextQuestion(widget.question.answerB);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CustomButtom(
                        text: widget.question.answerC,
                        onTap: () {
                          nextQuestion(widget.question.answerC);
                        },
                      ),
                      CustomButtom(
                        text: widget.question.answerD,
                        onTap: () {
                          nextQuestion(widget.question.answerD);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void nextQuestion(String option) {
    userAnswer = option;

    globalStateModel.answers.add(UserAnswer(
      question: widget.question,
      userAnswer: option
    ));

    bool showResultPage = globalStateModel.nextQuestion();
    if(showResultPage ?? false) {
      globalStateModel.verifyScore();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ResultScreen()));
    }
  }
  
}
