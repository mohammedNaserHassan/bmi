import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Widgets/TextFields/CustomField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRow extends StatefulWidget {
  String date;
  String weight, length,state;

  CustomRow({this.length, this.weight, this.date,this.state});

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, v) => Column(
        children: [
          Row(
            children: [
              CustomField(
                txt: widget.date,
                topleft: 10,
                bottomleft: 0,
                bottomright: 0,
                topright: 0,
              ),
              SizedBox(
                width: 1.w,
              ),
              CustomField(
                txt: widget.weight + 'KG',
                topright: 10,
                bottomleft: 0,
                topleft: 0,
                bottomright: 0,
              ),
            ],
          ),
          SizedBox(
            height: 1,
          ),
          Row(
            children: [
              CustomField(
                txt: widget.state,
                bottomleft: 10,
                bottomright: 0,
                topleft: 0,
                topright: 0,
              ),
              SizedBox(
                width: 1.w,
              ),
              CustomField(
                txt: widget.length + 'CM',
                bottomright: 10,
                topright: 0,
                topleft: 0,
                bottomleft: 0,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
