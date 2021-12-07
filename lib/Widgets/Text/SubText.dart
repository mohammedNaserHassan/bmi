import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SubText extends StatelessWidget {
  String txt;
  SubText({this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(color: Colors.grey, fontSize: 18.sp),
    );
  }
}