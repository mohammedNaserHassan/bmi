import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyDropDown extends StatelessWidget {
  String hint;
   MyDropDown({this.hint,});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context,provider,m)=>DropdownButton<String>(
        iconEnabledColor: Colors.blue,
        underline: Container(
          color: Colors.white,
        ),
        icon: Visibility(visible: false,child: Icon(Icons.arrow_drop_down_outlined,size: 33,)),
        isExpanded: true,
        hint: Text(hint),
        value: provider.valueDrop,
        items: [
          DropdownMenuItem(
            child: Text('Fruit'),
            value: '1',
          ),
          DropdownMenuItem(
            child: Text('Vegetables'),
            value: '2',
          ),
          DropdownMenuItem(
            child: Text('Meat'),
            value: '3',
          ),
          DropdownMenuItem(
            child: Text('Chicken'),
            value: '4',
          ),
          DropdownMenuItem(
            child: Text('Burger'),
            value: '5',
          ),
        ],
        onChanged: (value) {
          provider.setValue(value);
        },
      ),
    );
  }
}
