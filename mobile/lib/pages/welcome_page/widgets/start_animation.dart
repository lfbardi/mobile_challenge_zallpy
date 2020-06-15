import 'package:flutter/material.dart';

class StartAnimation extends StatelessWidget {

  final AnimationController controller;

  StartAnimation({ this.controller }) :
    buttonSqueeze = Tween(
      begin: 320.0,
      end: 60.0
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.05)
    ));

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }

  final Animation<double> buttonSqueeze;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return InkWell(
      onTap: (){
        controller.forward();
      },
      child: Container(
            width: buttonSqueeze.value,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFF264073),
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
          child: _buildInside(context)
        )
    );
  }

  Widget _buildInside(BuildContext context) {
    if(buttonSqueeze.value > 75) {
      return Text('Start', style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 2,
        ),);
    } else {
       return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          strokeWidth: 1.0,
      );
    }
  } 
}