import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimeWidget extends StatelessWidget {
  TextEditingController textEditingController;
  String label, hint;
  double space;
  TextInputType inputType;

  DateTimeWidget(
      {this.label,
      this.hint = '',
      this.textEditingController,
      this.space = 30,
      this.inputType = TextInputType.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 35.w,
        ),
        Text(
          label,
          style: TextStyle(
              color: Color(0xff0B85D8), fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: space,
        ),
        Container(
            width: 160.w,
            height: 30.h,
            decoration: BoxDecoration(border: Border.all(color: Color(0xff0B85D8))),
            child: TextField(
              controller: textEditingController,
              style: TextStyle(color: Color(0xff0B85D8)),
              keyboardType: inputType,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hint),
            ))
      ],
    );
  }
}
