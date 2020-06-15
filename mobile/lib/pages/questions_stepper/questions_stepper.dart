import 'package:flutter/material.dart';
import 'package:mobile/bussiness/entities/global_model.dart'
    show GlobalStateModel;
import 'package:scoped_model/scoped_model.dart';

class QuestionsStepper extends StatefulWidget {

  final List<Widget> questionsTiles;

  QuestionsStepper({ this.questionsTiles });

  @override
  _QuestionsStepperState createState() => _QuestionsStepperState();
}

class _QuestionsStepperState extends State<QuestionsStepper> {

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, GlobalStateModel model) {
        return IndexedStack(
          index: model.stackIndex,
          children: widget.questionsTiles
        );
      },
    );
  }
}
