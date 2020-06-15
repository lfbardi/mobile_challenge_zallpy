import 'package:flutter/material.dart';
import 'package:mobile/bussiness/entities/global_model.dart'
    show GlobalStateModel, globalStateModel;
import 'package:mobile/pages/questions_stepper/questions_stepper.dart';
import 'package:mobile/pages/questions_stepper/widgets/question_tile.dart';
import 'package:mobile/pages/welcome_page/widgets/start_animation.dart';
import 'package:scoped_model/scoped_model.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  List<Widget> questionsTiles = [];

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        _loadQuestions();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _loadQuestions() async {

    await globalStateModel.loadQuestions();

    globalStateModel.questions.forEach((question) {
      questionsTiles.add(QuestionTile(question: question));
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => QuestionsStepper(
                  questionsTiles: questionsTiles,
                )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalStateModel>(
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset('assets/images/car_welcome_page.png',
                      color: Colors.white, scale: 2),
                  Container(
                    child: Text(
                      'Welcome to the Quiz',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Can you tell where these car companies came from?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),
                  StartAnimation(controller: _animationController.view)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
