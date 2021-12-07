import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  String txt;
  double topleft, topright, bottomleft, bottomright;

  CustomField(
      {this.txt,
      this.bottomleft,
      this.bottomright,
      this.topleft,
      this.topright});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.w,
      height: 40.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topleft),
            bottomRight: Radius.circular(bottomright),
            topRight: Radius.circular(topright),
            bottomLeft: Radius.circular(bottomleft),
          ),
          color: Colors.white),
      child: Center(
          child: Text(
        txt,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      )),
    );
  }
}
