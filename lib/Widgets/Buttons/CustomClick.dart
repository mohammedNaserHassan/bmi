import 'package:flutter/material.dart';
class CustomClick extends StatelessWidget {
  Function function;
  String label;
  double width,height;
   CustomClick({this.function,this.label,this.width=170,this.height=50});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        height: height,
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 10)
      ),
    );
  }
}
