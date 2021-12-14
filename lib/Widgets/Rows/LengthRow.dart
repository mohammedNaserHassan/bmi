import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LengthRow extends StatelessWidget {
  double sizbox;
  LengthRow({this.sizbox=40});
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, provider, m) => Row(
              children: [
                SizedBox(
                  width: sizbox,
                ),
                Text(
                  'Length',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Color(0xff0B85D8)),
                ),
                SizedBox(
                  width: 83.w,
                ),
                Container(
                    width: 25.w,
                    height: 25.h,
                    decoration:
                        BoxDecoration(border: Border.all(color: Color(0xff0B85D8))),
                    child: InkWell(
                      onTap: () {
                        provider.decrementLength();
                      },
                      child: Icon(
                        Icons.remove,
                        color: Color(0xff0B85D8),
                      ),
                    )),
                Container(
                  width: 110.w,
                  height: 25.h,
                  decoration:
                      BoxDecoration(border: Border.all(color: Color(0xff0B85D8))),
                  child: TextField(
                    controller: provider.length,
                    style: TextStyle(color:Color(0xff0B85D8)),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hoverColor: Color(0xff0B85D8),
                    ),
                  ),
                ),
                Container(
                    width: 25.w,
                    height: 25.h,
                    decoration:
                        BoxDecoration(border: Border.all(color: Color(0xff0B85D8))),
                    child: InkWell(
                      onTap: () {
                        provider.incrementLength();
                      },
                      child: Icon(
                        Icons.add,
                        color: Color(0xff0B85D8),
                      ),
                    )),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'cm',
                  style: TextStyle(color: Color(0xff0B85D8)),
                )
              ],
            ));
  }
}
