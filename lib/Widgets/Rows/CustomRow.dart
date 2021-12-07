import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Widgets/TextFields/CustomField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRow extends StatefulWidget {
  String dateOfBirth,birthday;
  String weight, length,gender;

  CustomRow({this.length, this.weight, this.dateOfBirth,this.gender,this.birthday});

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context,listen: false).getAgePercent(
      gender: widget.gender,
      age: widget.birthday
    );
    Provider.of<AuthProvider>(context,listen: false).getBMI(
      weight: double.parse(widget.weight),
      length: double.parse(widget.length),
      ageParcent: Provider.of<AuthProvider>(context,listen: false).agePercent,
    );

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, v) => Column(
        children: [
          Row(
            children: [
              CustomField(
                txt: widget.dateOfBirth,
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
                txt: provider.setBMI(bmi: provider.bmi),
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
