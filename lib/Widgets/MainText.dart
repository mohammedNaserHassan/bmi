import 'package:flutter/material.dart';
class MainText extends StatelessWidget {
  String txt;
  MainText({this.txt});

  @override
  Widget build(BuildContext context) {
    return  Text(
      txt,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
          color: Colors.blue),
    );
  }
}
