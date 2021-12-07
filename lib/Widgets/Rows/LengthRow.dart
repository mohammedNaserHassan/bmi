import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LengthRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, provider, m) => Row(
              children: [
                SizedBox(
                  width: 40.w,
                ),
                Text(
                  'Length',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.blue),
                ),
                SizedBox(
                  width: 80.w,
                ),
                Container(
                    width: 30.w,
                    height: 30.h,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blue)),
                    child: InkWell(
                      onTap: () {
                        provider.decrementLength();
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.blue,
                      ),
                    )),
                Container(
                  width: 90.w,
                  height: 30.h,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: TextField(
                    controller: provider.length,
                    style: TextStyle(color: Colors.blue),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hoverColor: Colors.blue,
                    ),
                  ),
                ),
                Container(
                    width: 30.w,
                    height: 30.h,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blue)),
                    child: InkWell(
                      onTap: () {
                        provider.incrementLength();
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                    )),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'cm',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ));
  }
}
