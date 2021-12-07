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
              color: Colors.blue, fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: space,
        ),
        Container(
            width: 170.w,
            height: 35.h,
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: TextField(
              controller: textEditingController,
              style: TextStyle(color: Colors.blue),
              keyboardType: inputType,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hint),
            ))
      ],
    );
  }
}
