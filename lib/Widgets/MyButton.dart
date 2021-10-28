import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  String label;
  Function function;
  MyButton({this.label,this.function});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: function,
      child: Container(
        child: Center(
            child: Text(
             label,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
        decoration: BoxDecoration(
            color: Colors.blue,
          borderRadius: BorderRadius.circular(10)
        ),
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.all(30),
      ),
    );
  }
}
