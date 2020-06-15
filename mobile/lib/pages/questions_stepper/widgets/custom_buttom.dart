import 'package:flutter/material.dart';

class CustomButtom extends StatefulWidget {
  final String text;
  final Function onTap;

  CustomButtom({this.text, this.onTap});

  @override
  _CustomButtomState createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      child: RaisedButton(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Text(widget.text, style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300
        ),),
        color: Color(0xFF192b4d),
        onPressed: widget.onTap,
      ),
    );
  }
}