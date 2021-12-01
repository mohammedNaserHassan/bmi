import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Widgets/TextFields/CustomField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CustomRow extends StatelessWidget {
  const CustomRow();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder:(context,provider,v)=> Column(
        children: [
          Row(
            children: [
              CustomField(txt: provider.user.dateOfBirth,topleft: 10,bottomleft: 0,bottomright: 0,topright: 0,),
              SizedBox(width: 1,),
              CustomField(txt: provider.user.weight+'KG',topright: 10,bottomleft: 0,topleft: 0,bottomright: 0,),
            ],
          ),
          SizedBox(height: 1,),
          Row(
            children: [
              CustomField(txt: 'Normal',bottomleft: 10,bottomright: 0,topleft: 0,topright: 0,),
              SizedBox(width: 1,),
              CustomField(txt: provider.user.length+'CM',bottomright: 10,topright: 0,topleft: 0,bottomleft: 0,),
            ],
          )
        ],
      ),
    );
  }
}
