import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MainText extends StatelessWidget {
  String txt;
  MainText({this.txt});

  @override
  Widget build(BuildContext context) {
    return  Text(
      txt,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35.sp,
          color: Color(0xff0B85D8)),
    );
  }
}