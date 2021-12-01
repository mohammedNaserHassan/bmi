import 'package:flutter/material.dart';
class DateTimeWidget extends StatelessWidget {
  TextEditingController textEditingController;
  String label;
  double space;
  TextInputType inputType;
   DateTimeWidget({this.label,this.textEditingController,this.space=30,this.inputType=TextInputType.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 35,
        ),
        Text(
          label,
          style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: space,
        ),
        Container(
            width: 170,
            height: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue)),
            child: TextField(
              controller: textEditingController,
              style: TextStyle(color: Colors.blue),
              keyboardType: inputType,
              decoration:
              InputDecoration(border: InputBorder.none,
              ),
            ))
      ],
    );
  }
}
