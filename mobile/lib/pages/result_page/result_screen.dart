import 'package:flutter/material.dart';
import 'package:mobile/bussiness/entities/global_model.dart' show GlobalStateModel;
import 'package:mobile/pages/questions_stepper/widgets/custom_buttom.dart';
import 'package:mobile/pages/welcome_page/welcome_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:scoped_model/scoped_model.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, GlobalStateModel model) {
      return Scaffold(
        body: Center(
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF182848), Color(0xFF4b6cb7)])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Text(
                    'Your Accuracy:',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: 1.2),
                  ),
                ),
                CircularPercentIndicator(
                  radius: 200.0,
                  lineWidth: 3.0,
                  percent: model.score / 100,
                  animation: true,
                  animationDuration: 3000,
                  center: Text(
                    "${model.score.toInt().toString()}%",
                    style: TextStyle(fontWeight: FontWeight.w300, color: model.resultColor, fontSize: 40,),
                  ),
                  progressColor: model.resultColor
                ),
                Container(
                  child: Text(
                    model.resultPhrase,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 1.2),
                  ),
                ),
                CustomButtom(
                  text: 'Try again',
                  onTap: () {
                    model.reset();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
