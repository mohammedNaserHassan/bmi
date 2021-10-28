import 'package:flutter/material.dart';
class SubText extends StatelessWidget {
  String txt;
  SubText({this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(color: Colors.grey, fontSize: 18),
    );
  }
}
