import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  String label;
  bool obscure;
  TextEditingController textEditingController;
  TextInputType textInputType;

  MyTextField(
      {this.label,
      this.obscure = false,
      this.textInputType = TextInputType.text,
      this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, index) => Container(
        margin: EdgeInsets.only(left: 20.w, right: 30.w),
        child: TextField(
          controller: textEditingController,
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
                      icon: Icon(
                        provider.isEye
                            ? Icons.visibility_off_outlined
                            : Icons.remove_red_eye_outlined,
                        size: 20,
                      ),
                    )
                  : null),
        ),
      ),
    );
  }
}
