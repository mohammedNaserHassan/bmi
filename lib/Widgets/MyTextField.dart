import 'package:bmi1/Provider/MyProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTextField extends StatelessWidget {
  String label;
  bool obscure;
  TextInputType textInputType;

  MyTextField(
      {this.label,
      this.obscure = false,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, index) => Container(
        margin: EdgeInsets.only(left: 20, right: 30),
        child: Expanded(
          child: TextField(
            obscureText: obscure ? provider.isEye : false,
            keyboardType: textInputType,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                hintText: label,
                suffixIcon: obscure
                    ? IconButton(
                        onPressed: () {
                          provider.setEye();
                        },
                        icon: Icon(Icons.visibility_off_outlined,size: 20,),
                      )
                    : null),
          ),
        ),
      ),
    );
  }
}
