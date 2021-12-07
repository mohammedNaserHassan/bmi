import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyDropDown extends StatelessWidget {
  String hint;
   MyDropDown({this.hint,});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context,provider,m)=>DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          iconEnabledColor: Colors.blue,
          underline: Container(
            color: Colors.white,
          ),
          icon: Visibility(visible: false,child: Icon(Icons.arrow_drop_down_outlined,size: 33.sp,)),
          isExpanded: true,
          hint: Text(hint),
          value: provider.valueDrop,
          items: [
            DropdownMenuItem(
              child: Text('Fruit'),
              value: 'Fruit',
            ),
            DropdownMenuItem(
              child: Text('Vegetables'),
              value: 'Vegetables',
            ),
            DropdownMenuItem(
              child: Text('Meat'),
              value: 'Meat',
            ),
            DropdownMenuItem(
              child: Text('Chicken'),
              value: 'Chicken',
            ),
            DropdownMenuItem(
              child: Text('Fish'),
              value: 'Fish',
            ),
            DropdownMenuItem(
              child: Text('Burger'),
              value: 'Burger',
            ),
            DropdownMenuItem(
              child: Text('Sweets'),
              value: 'Sweets',
            ),
          ],
          onChanged: (value) {
            provider.setValue(value);
          },
        ),
      ),
    );
  }
}
